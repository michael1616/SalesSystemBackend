namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface IWorkContainer : IDisposable
    {
        ISaleRepository Sale { get; }

        IUserRepository User { get; }

        IProductRepository Product { get; }

        IDashboardRepository Dashboard { get; }

        IMenuRepository Menu { get; }

        IPermissionRepository Permission { get; }

        IRoleRepository Role { get; }

        CategoryRepository Category { get; }

        Task SaveAsync();
    }
}
