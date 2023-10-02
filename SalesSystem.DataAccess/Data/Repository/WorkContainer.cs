using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Contexts.Identity;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class WorkContainer : IWorkContainer
    {
        private readonly ApplicationDBContext _db;
        private readonly IdentityDBContext _dbIdentity;

        public CategoryRepository Category { get; set; }

        public IRoleRepository Role { get; set; }

        public ISaleRepository Sale { get; set; }

        public IUserRepository User { get; set; }

        public IProductRepository Product { get; set; }

        public IDashboardRepository Dashboard { get; set; }

        public IMenuRepository Menu { get; set; }

        public IPermissionRepository Permission { get; set; }

        public WorkContainer(ApplicationDBContext db, IdentityDBContext dbIdentity, UserManager<ApplicationUser> userManager,
            RoleManager<ApplicationRol> roleManager,
            IMapper mapper,
            IConfiguration configuration)
        {
            _db = db;
            _dbIdentity = dbIdentity;
            Sale = new SaleRepository(_db, mapper);
            Category = new CategoryRepository(_db);
            Role = new RolRepository(_db, roleManager, userManager, mapper);
            Product = new ProductRepository(_db, mapper);
            Dashboard = new DashboardRepository(_db, mapper, Sale);
            Menu = new MenuRepository(_db, mapper);
            Permission = new PermissionRepository(_db, mapper);
            User = new UserRepository(_db, _dbIdentity, userManager, roleManager, mapper, configuration);

        }

        public async Task SaveAsync()
        {
            await _db.SaveChangesAsync();
        }

        public async void Dispose()
        {
            await _dbIdentity.DisposeAsync();
            await _db.DisposeAsync();
        }
    }
}
