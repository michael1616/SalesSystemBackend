using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using System.Security.Claims;

namespace SalesSystem.Permission
{
    public class PermissionAttribute : TypeFilterAttribute
    {
        public PermissionAttribute() : base(typeof(PermissionFilter))
        {
        }
    }


    public class PermissionFilter : IAuthorizationFilter
    {
        private readonly IWorkContainer _workContainer;

        public PermissionFilter(IWorkContainer workContainer)
        {
            _workContainer = workContainer;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {

            if (!context.HttpContext.User.Identity.IsAuthenticated)
            {
                context.Result = new UnauthorizedResult();
                return;
            }
            try
            {
                string id = context.HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.NameIdentifier).First().Value;
                string idRol = _workContainer.User.getIdRolByUserId(id).GetAwaiter().GetResult();

                string action = context.HttpContext.Request.Headers["Action"].ToString();
                string module = context.HttpContext.Request.Headers["Module"].ToString();

                if (string.IsNullOrEmpty(action) || string.IsNullOrEmpty(module))
                {
                    context.Result = new UnauthorizedResult();
                    return;
                }

                if (module != "MENU" && module != "PERMISSION")
                {
                    bool hasPermissionModule = _workContainer.Permission.HasPermission(idRol, module).GetAwaiter().GetResult();
                    bool hasPermissionAction = _workContainer.Permission.HasPermission(idRol, action).GetAwaiter().GetResult();


                    if (!hasPermissionModule || !hasPermissionAction)
                    {
                        context.Result = new ForbidResult();
                        return;
                    }
                }


            }
            catch (Exception)
            {
                context.Result = new UnauthorizedResult();
                return;
            }

        }
    }

}
