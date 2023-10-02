using AutoMapper;
using Microsoft.EntityFrameworkCore;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;
using SalesSystem.Utilities;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class PermissionRepository : IPermissionRepository
    {
        private readonly ApplicationDBContext _db;
        private readonly IMapper _mapper;


        public PermissionRepository(ApplicationDBContext db, IMapper mapper)
        {
            _db = db;
            _mapper = mapper;
        }

        public async Task<List<PermissionDTO>> GetActionsPermissions(bool isAdd, string idRol)
        {
            List<PermissionDTO> permissions = new List<PermissionDTO>();

            if (isAdd)
            {
                permissions = await GetActionsPermissionAdd();
            }
            else
            {
                permissions = await GetActionsPermissionEdit(idRol);
            }

            return permissions;
        }

        public async Task<bool> HasPermission(string idRol, string actionModule)
        {
            if (string.IsNullOrEmpty(actionModule))
            {
                return false;
            }


            List<Permission> permisions = await _db.Permissions.Where(x => x.IdRol == idRol).ToListAsync();
            List<PermissionAction> actions = await _db.PermissionActions.ToListAsync();

            List<Permission> query = (from per in permisions
                                      join ac in actions on per.IdAction equals ac.Id
                                      where per.State == true && ac.Action == actionModule
                                      select per).ToList();

            if (query.Count <= 0)
            {
                return false;
            }

            return true;
        }



        private int? GetMenu(string action)
        {

            switch (action)
            {
                case nameof(PermissionModules.DASH_BOARD_MODULE):

                    return (int)PermissionModules.DASH_BOARD_MODULE;

                case nameof(PermissionModules.USERS_MODULE):

                    return (int)PermissionModules.USERS_MODULE;

                case nameof(PermissionModules.PRODUCTS_MODULE):

                    return (int)PermissionModules.PRODUCTS_MODULE;

                case nameof(PermissionModules.SALE_MODULE):

                    return (int)PermissionModules.SALE_MODULE;

                case nameof(PermissionModules.RECORD_SALE_MODULE):

                    return (int)PermissionModules.RECORD_SALE_MODULE;

                case nameof(PermissionModules.REPORT_SALE_MODULE):

                    return (int)PermissionModules.REPORT_SALE_MODULE;

                case nameof(PermissionModules.ROLES_MODULE):

                    return (int)PermissionModules.ROLES_MODULE;

                default:

                    return null;
            }

        }


        private async Task<List<PermissionDTO>> GetActionsPermissionAdd()
        {
            List<PermissionDTO> permissions = new List<PermissionDTO>();

            List<PermissionAction> permissionsFathers = await _db.PermissionActions.Where(a => a.IdPadre == null).ToListAsync();

            permissions = _mapper.Map<List<PermissionDTO>>(permissionsFathers);

            foreach (PermissionDTO item in permissions)
            {
                if (item.IdPadre == null)
                {
                    item.IdMenu = GetMenu(item.Action);
                }

                item.State = true;
                List<PermissionAction> permissionsChildrens = await _db.PermissionActions.Where(a => a.IdPadre == item.IdPermissionAction).ToListAsync();

                item.ChildrenCount = permissionsChildrens.Count();
                item.ChildrenActions = _mapper.Map<List<PermissionDTO>>(permissionsChildrens);

                item.ChildrenActions.ForEach(data =>
                {
                    data.State = true;
                });
            }

            return permissions.OrderByDescending(a => a.ChildrenCount).ToList();
        }



        private async Task<List<PermissionDTO>> GetActionsPermissionEdit(string idRol)
        {
            List<PermissionDTO> permissions = new List<PermissionDTO>();

            var permissionsData = await _db.Permissions.Where(a => a.IdRol == idRol).ToListAsync();
            var permissionsActions = await _db.PermissionActions.ToListAsync();


            permissions = (from per in permissionsData
                           join ac in permissionsActions on per.IdAction equals ac.Id
                           where ac.IdPadre == null
                           select new PermissionDTO
                           {
                               IdPermission = per.Id,
                               Action = ac.Action,
                               IdPadre = null,
                               IdMenu = per.IdMenu,
                               IdRole = per.IdRol,
                               State = per.State,
                               IdPermissionAction = per.IdAction
                           }).ToList();


            foreach (PermissionDTO item in permissions)
            {
                var queryActionChildren = (from per in permissionsData
                                           join ac in permissionsActions on per.IdAction equals ac.Id
                                           where ac.IdPadre == item.IdPermissionAction
                                           select new PermissionDTO
                                           {
                                               IdPermission = per.Id,
                                               Action = ac.Action,
                                               IdPadre = ac.IdPadre,
                                               IdMenu = null,
                                               IdRole = per.IdRol,
                                               State = per.State,
                                               IdPermissionAction = per.IdAction
                                           }).ToList();

                item.ChildrenCount = queryActionChildren.Count();
                item.ChildrenActions = queryActionChildren;
            }

            return permissions.OrderByDescending(a => a.ChildrenCount).ToList();
        }
    }
}
