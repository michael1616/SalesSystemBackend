using SalesSystem.Models.DTO;

namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface IMenuRepository
    {
        Task<List<MenuDTO>> GetMenuByRol(string idRol);
    }
}
