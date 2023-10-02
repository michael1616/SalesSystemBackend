using AutoMapper;
using Microsoft.EntityFrameworkCore;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class MenuRepository : IMenuRepository
    {
        private readonly ApplicationDBContext _db;
        private readonly IMapper _mapper;


        public MenuRepository(ApplicationDBContext db, IMapper mapper)
        {
            _db = db;
            _mapper = mapper;
        }

        public async Task<List<MenuDTO>> GetMenuByRol(string idRol)
        {
            List<Permission> permisions = await _db.Permissions.Where(x => x.IdRol == idRol).ToListAsync();
            List<Menu> menu = await _db.Menus.ToListAsync();


            List<Menu> query = (from per in permisions
                                join m in menu on per.IdMenu equals m.IdMenu
                                where per.State == true && per.IdMenu != null
                                select m).ToList();

            return _mapper.Map<List<MenuDTO>>(query);
        }
    }
}
