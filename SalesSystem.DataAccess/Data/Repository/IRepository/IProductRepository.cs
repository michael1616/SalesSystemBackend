using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface IProductRepository : IRepository<Producto>
    {
        Task<List<ProductDTO>> GetProducts();

        Task<ProductDTO> EditProduct(ProductDTO product);
    }
}
