using SalesSystem.Models.DTO;

namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface IPermissionRepository
    {
        Task<bool> HasPermission(string idRol, string actionModule);

        Task<List<PermissionDTO>> GetActionsPermissions(bool isAdd, string idRol);
    }
}
