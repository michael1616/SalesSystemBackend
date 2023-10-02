using SalesSystem.Models.DTO;

namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface IDashboardRepository
    {
        Task<DashboardTO> ResumeGraphic();

        Task<DashboardTO> ResumeTotals();
    }
}
