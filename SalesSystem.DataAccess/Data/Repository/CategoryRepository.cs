using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class CategoryRepository : Repository<Categorium>
    {
        private readonly ApplicationDBContext _db;

        public CategoryRepository(ApplicationDBContext db) : base(db)
        {
            _db = db;
        }
    }
}
