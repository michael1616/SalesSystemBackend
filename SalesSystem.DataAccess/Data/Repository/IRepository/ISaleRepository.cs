using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Data.Repository.IRepository
{
    public interface ISaleRepository : IRepository<Ventum>
    {
        Task<SaleDTO> AddSale(SaleDTO sale);

        Task<List<SaleDTO>> GetRecord(RequestReportDTO paramRecord);

        Task<List<ReportDTO>> Report(RequestReportDTO paramRecord);

    }
}
