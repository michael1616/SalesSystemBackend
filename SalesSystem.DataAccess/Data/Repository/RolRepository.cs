using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class RolRepository : Repository<AspNetRole>, IRoleRepository
    {
        private readonly ApplicationDBContext _db;
        private readonly RoleManager<ApplicationRol> _roleManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IMapper _mapper;

        public RolRepository(ApplicationDBContext db,
            RoleManager<ApplicationRol> roleManager,
            UserManager<ApplicationUser> userManager,
        IMapper mapper) : base(db)
        {
            _db = db;
            _roleManager = roleManager;
            _mapper = mapper;
            _userManager = userManager;
        }

        public async Task<string> AddRole(RolDTO rol)
        {
            bool resultExistRol = await _roleManager.RoleExistsAsync(rol.Name);

            if (resultExistRol)
            {
                return "The role already exists";
            }

            DateTime currentDate = DateTime.Now;
            IdentityResult result = await _roleManager.CreateAsync(new ApplicationRol(rol.Name, currentDate));

            if (!result.Succeeded)
            {
                return "Error creating the rol";
            }

            ApplicationRol appRol = await _roleManager.FindByNameAsync(rol.Name);

            if (appRol == null)
            {
                return "Error creating the rol";
            }

            await AddPermissions(rol, appRol.Id);

            return "Ok";
        }

        public async Task<string> DeleteRole(string idRole)
        {
            ApplicationRol appRol = await _roleManager.FindByIdAsync(idRole);

            if (appRol == null)
            {
                return "Rol not found";
            }

            IList<ApplicationUser> users = await _userManager.GetUsersInRoleAsync(appRol.Name);

            if (users.Count > 0)
            {
                return "a user already exists with this role";
            }

            await DeletePermissions(idRole);

            IdentityResult resultDeleteRol = await _roleManager.DeleteAsync(appRol);

            if (!resultDeleteRol.Succeeded)
            {
                return "Error deleting the role";
            }

            return "Ok";
        }

        public async Task<List<RolDTO>> GetRoles()
        {
            List<AspNetRole> roles = await _db.AspNetRoles.ToListAsync();
            List<RolDTO> data = _mapper.Map<List<RolDTO>>(roles);

            return data.OrderByDescending(a => a.RegistrationDate).ToList();
        }

        public async Task<string> UpdateRole(RolDTO rol)
        {

            ApplicationRol appRol = await _roleManager.FindByIdAsync(rol.Id);

            if (appRol == null)
            {
                return "Rol not found";
            }

            if (appRol.Name != rol.Name)
            {
                appRol.Name = rol.Name;

                IdentityResult resultUpdate = await _roleManager.UpdateAsync(appRol);

                if (!resultUpdate.Succeeded)
                {
                    return "Error editing the role";
                }
            }

            await EditPermissions(rol);

            return "Ok";
        }


        private async Task<bool> AddPermissions(RolDTO rol, string idRol)
        {
            foreach (PermissionDTO item in rol.Permissions)
            {
                Permission permisionFather = _mapper.Map<Permission>(item);
                permisionFather.Id = 0;
                permisionFather.IdRol = idRol;

                await _db.Permissions.AddAsync(permisionFather);
                await _db.SaveChangesAsync();


                foreach (PermissionDTO itemActions in item.ChildrenActions)
                {
                    Permission permisionChildren = _mapper.Map<Permission>(itemActions);
                    permisionChildren.IdRol = idRol;
                    permisionChildren.Id = 0;

                    await _db.Permissions.AddAsync(permisionChildren);
                    await _db.SaveChangesAsync();
                }
            }

            return true;
        }


        private async Task<bool> EditPermissions(RolDTO rol)
        {
            foreach (PermissionDTO item in rol.Permissions)
            {
                Permission permisionFather = _mapper.Map<Permission>(item);
                permisionFather.IdRol = rol.Id;

                _db.Permissions.Update(permisionFather);
                await _db.SaveChangesAsync();


                foreach (PermissionDTO itemActions in item.ChildrenActions)
                {
                    Permission permisionChildren = _mapper.Map<Permission>(itemActions);
                    permisionChildren.IdRol = rol.Id;

                    _db.Permissions.Update(permisionChildren);
                    await _db.SaveChangesAsync();
                }
            }

            return true;
        }



        private async Task<bool> DeletePermissions(string idRol)
        {
            List<Permission> permissions = _db.Permissions.Where(a => a.IdRol == idRol).ToList();

            foreach (Permission item in permissions)
            {
                _db.Remove(item);
                await _db.SaveChangesAsync();
            }

            return true;
        }
    }
}
