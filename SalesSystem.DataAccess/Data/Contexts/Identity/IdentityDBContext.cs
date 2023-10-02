using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SalesSystem.Models.DTO;

namespace SalesSystem.DataAccess.Data.Contexts.Identity
{
    public class IdentityDBContext : IdentityDbContext<ApplicationUser, ApplicationRol, string>
    {
        public IdentityDBContext()
        {
        }

        public IdentityDBContext(DbContextOptions<IdentityDBContext> options)
            : base(options)
        {
        }


        public virtual DbSet<ApplicationUser> UsersApp { get; set; }
    }
}
