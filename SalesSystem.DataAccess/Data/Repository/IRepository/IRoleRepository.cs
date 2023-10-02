using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface IRoleRepository : IRepository<AspNetRole>
    {
        Task<List<RolDTO>> GetRoles();

        Task<string> AddRole(RolDTO rol);

        Task<string> UpdateRole(RolDTO rol);

        Task<string> DeleteRole(string idRole);
    }
}
