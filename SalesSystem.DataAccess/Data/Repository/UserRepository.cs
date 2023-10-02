using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Contexts.Identity;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class UserRepository : Repository<AspNetUser>, IUserRepository
    {
        private readonly ApplicationDBContext _db;
        private readonly IdentityDBContext _dbIdentity;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<ApplicationRol> _roleManager;
        private readonly IMapper _mapper;
        private string secretKey;

        public UserRepository(ApplicationDBContext db,
            IdentityDBContext dbIdentity,
            UserManager<ApplicationUser> userManager,
            RoleManager<ApplicationRol> roleManager,
            IMapper mapper,
            IConfiguration configuration) : base(db)
        {
            _db = db;
            _dbIdentity = dbIdentity;
            _userManager = userManager;
            _roleManager = roleManager;
            _mapper = mapper;
            secretKey = configuration.GetSection("ApiSettings:Secret").Value;

        }

        public async Task<bool> DeleteUser(string id)
        {
            ApplicationUser user = await _userManager.FindByIdAsync(id);

            if (user == null)
            {
                return false;
            }

            IdentityResult result = await _userManager.DeleteAsync(user);

            return result.Succeeded;
        }

        public async Task<UserDTO> EditUser(UserDTO modelo)
        {

            ApplicationUser user = await _userManager.FindByIdAsync(modelo.Id);

            user.FullName = modelo.FullName;
            user.IsActive = modelo.IsActive;
            user.Email = modelo.Email;
            user.UserName = modelo.Email;
            //user.PasswordHash = _userManager.PasswordHasher.HashPassword(user, modelo.PasswordHash);

            IdentityResult resultUpdate = await _userManager.UpdateAsync(user);

            if (!resultUpdate.Succeeded)
            {
                return null;
            }

            IList<string> roles = await _userManager.GetRolesAsync(user);
            ApplicationRol appRol = await _roleManager.FindByIdAsync(modelo.IdRol);

            if (roles[0] != appRol.Name)
            {
                IdentityResult resultDeleteRol = await _userManager.RemoveFromRoleAsync(user, roles[0]);

                if (!resultDeleteRol.Succeeded)
                {
                    return null;
                }

                ApplicationRol rol = await _roleManager.FindByIdAsync(modelo.IdRol);
                IdentityResult resultRol = await _userManager.AddToRoleAsync(user, rol.Name);

                if (!resultRol.Succeeded)
                {
                    return null;
                }
            }

            ApplicationUser usuarioApp = _dbIdentity.UsersApp.FirstOrDefault(u => u.Id == modelo.Id);

            return _mapper.Map<UserDTO>(usuarioApp);
        }

        public async Task<string> getIdRolByUserId(string id)
        {
            ApplicationUser user = await _userManager.FindByIdAsync(id);
            IList<string> rolUser = await _userManager.GetRolesAsync(user);

            ApplicationRol appRol = await _roleManager.FindByNameAsync(rolUser[0]);
            return appRol.Id;
        }

        public async Task<bool> IsUniqueUser(string email)
        {
            var usuario = await _dbIdentity.Users.FirstOrDefaultAsync(u => u.Email.ToLower() == email.ToLower());
            if (usuario == null)
            {
                return true;
            }
            return false;
        }

        public async Task<UserResponseDTO> RegisterUser(UserDTO modelo)
        {
            ApplicationUser usuario = new()
            {
                UserName = modelo.Email,
                Email = modelo.Email,
                NormalizedEmail = modelo.Email.ToUpper(),
                FullName = modelo.FullName,
                RegistrationDate = DateTime.Now,
                IsActive = modelo.IsActive
            };


            try
            {
                var resultado = await _userManager.CreateAsync(usuario, modelo.PasswordHash);
                if (resultado.Succeeded)
                {
                    if (!_roleManager.RoleExistsAsync("admin").GetAwaiter().GetResult())
                    {
                        DateTime currentDate = DateTime.Now;

                        await _roleManager.CreateAsync(new ApplicationRol("admin", currentDate));
                        await _roleManager.CreateAsync(new ApplicationRol("supervisor", currentDate));
                        await _roleManager.CreateAsync(new ApplicationRol("employee", currentDate));
                    }


                    ApplicationRol rol = await _roleManager.FindByIdAsync(modelo.IdRol);
                    await _userManager.AddToRoleAsync(usuario, rol.Name);

                    var usuarioApp = _dbIdentity.UsersApp.FirstOrDefault(u => u.Email == modelo.Email);

                    return _mapper.Map<UserResponseDTO>(usuarioApp);
                }
            }
            catch (Exception)
            {

                throw;
            }

            return new UserResponseDTO();
        }

        public async Task<List<UserDTO>> UsersList()
        {
            List<AspNetUser> users = await _db.AspNetUsers.Include("Roles").OrderByDescending(a => a.RegistrationDate).ToListAsync();

            return _mapper.Map<List<UserDTO>>(users);
        }

        public async Task<LoginResponseDTO> ValidCredentials(LoginRequestDTO credentials)
        {
            var usuario = await _dbIdentity.UsersApp.FirstOrDefaultAsync(u => u.Email.ToLower() == credentials.Email.ToLower());

            bool isValido = await _userManager.CheckPasswordAsync(usuario, credentials.Password);

            if (usuario == null || isValido == false)
            {
                return new LoginResponseDTO()
                {
                    Token = "",
                    Usuario = null
                };
            }

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, usuario.Id)
            };

            // Si Usuario Existe Generamos el JW Token
            var roles = await _userManager.GetRolesAsync(usuario);

            AddRolesToClaims(claims, roles);


            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(secretKey);

            var keyStored = new SymmetricSecurityKey(key);
            var creds = new SigningCredentials(keyStored, SecurityAlgorithms.HmacSha256);
            var expires = DateTime.UtcNow.AddMinutes(20);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: expires,
                signingCredentials: creds
            );

            LoginResponseDTO loginResponseDTO = new()
            {
                Token = tokenHandler.WriteToken(token),
                Usuario = _mapper.Map<UserResponseDTO>(usuario)
            };

            ApplicationRol appRol = await _roleManager.FindByNameAsync(roles[0]);

            loginResponseDTO.Usuario.Rol = roles[0];
            loginResponseDTO.Usuario.IdRol = appRol.Id;

            return loginResponseDTO;
        }

        private void AddRolesToClaims(List<Claim> claims, IEnumerable<string> roles)
        {
            foreach (var role in roles)
            {
                var roleClaim = new Claim(ClaimTypes.Role, role);
                claims.Add(roleClaim);
            }
        }
    }
}
