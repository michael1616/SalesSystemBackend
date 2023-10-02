using AutoMapper;
using Microsoft.EntityFrameworkCore;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class ProductRepository : Repository<Producto>, IProductRepository
    {
        private readonly ApplicationDBContext _db;
        private readonly IMapper _mapper;

        public ProductRepository(ApplicationDBContext db, IMapper mapper) : base(db)
        {
            _mapper = mapper;
            _db = db;
        }

        public async Task<ProductDTO> EditProduct(ProductDTO product)
        {
            Producto productToUpdate = _mapper.Map<Producto>(product);

            var previousProduct = await GetFirstOrDefault(filter: a => a.IdProducto == product.IdProducto, tracked: false);
            productToUpdate.FechaRegistro = previousProduct.FechaRegistro;

            _db.Productos.Update(productToUpdate);
            await _db.SaveChangesAsync();

            return _mapper.Map<ProductDTO>(productToUpdate);
        }

        public async Task<List<ProductDTO>> GetProducts()
        {
            List<Producto> pruducts = await _db.Productos.Include("IdCategoriaNavigation").OrderByDescending(x => x.IdProducto).ToListAsync();

            return _mapper.Map<List<ProductDTO>>(pruducts);

        }
    }
}
