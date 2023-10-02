using AutoMapper;
using Microsoft.EntityFrameworkCore;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;
using SalesSystem.Utilities;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class DashboardRepository : IDashboardRepository
    {
        private readonly ApplicationDBContext _db;
        private readonly IMapper _mapper;
        private readonly ISaleRepository _sale;

        public DashboardRepository(ApplicationDBContext db, IMapper mapper, ISaleRepository sale)
        {
            _db = db;
            _mapper = mapper;
            _sale = sale;
        }

        private IQueryable<Ventum> Sales(IQueryable<Ventum> query, int subtractNumberOfDays)
        {
            DateTime? lastDate = query.OrderByDescending(a => a.FechaRegistro).Select(x => x.FechaRegistro).First();

            lastDate = lastDate?.AddDays(subtractNumberOfDays);

            return query.Where(x => x.FechaRegistro.Value.Date >= lastDate.Value.Date);
        }


        private async Task<int> TotalSalesLastWeek()
        {
            int total = 0;

            List<Ventum> sales = await _sale.GetAll();

            if (sales.Count > 0)
            {
                IQueryable<Ventum> salesQueryable = sales.AsQueryable();
                IQueryable<Ventum> tableSale = Sales(salesQueryable, Settings.subtractNumberOfDays);
                total = tableSale.Count();
            }

            return total;
        }


        private async Task<decimal> TotalEarningsLastWeek()
        {
            decimal earnings = 0;
            List<Ventum> sales = await _sale.GetAll();

            if (sales.Count > 0)
            {
                IQueryable<Ventum> salesQueryable = sales.AsQueryable();
                IQueryable<Ventum> tableSale = Sales(salesQueryable, Settings.subtractNumberOfDays);
                earnings = tableSale.Select(x => x.Total).Sum() ?? 0;
            }

            return earnings;
        }

        private async Task<int> TotalProductsLastWeek()
        {
            List<Producto> producto = await _db.Productos.ToListAsync();

            int totalProducts = producto.Count();

            return totalProducts;
        }

        private async Task<Dictionary<string, int>> SalesLastWeek()
        {
            Dictionary<string, int> salesLastWeek = new Dictionary<string, int>();
            List<Ventum> sales = await _sale.GetAll();

            if (sales.Count > 0)
            {
                IQueryable<Ventum> salesQueryable = sales.AsQueryable();
                IQueryable<Ventum> tableSale = Sales(salesQueryable, Settings.subtractNumberOfDays);

                salesLastWeek = tableSale.GroupBy(x => x.FechaRegistro.Value.Date)
                    .OrderBy(z => z.Key).Select(sl => new { Date = sl.Key.ToString("dd/MM/yyyy"), Total = sl.Count() })
                    .ToDictionary(keySelector: z => z.Date, elementSelector: x => x.Total);
            }

            return salesLastWeek;
        }


        public async Task<DashboardTO> ResumeGraphic()
        {
            DashboardTO dashboard = new DashboardTO();

            List<SalesPerWeekDTO> salesPerWeek = new List<SalesPerWeekDTO>();

            foreach (KeyValuePair<string, int> item in await SalesLastWeek())
            {
                salesPerWeek.Add(new SalesPerWeekDTO()
                {
                    Fecha = item.Key,
                    Total = item.Value
                });
            }

            dashboard.VentasUltimaSemana = salesPerWeek;

            return dashboard;
        }

        public async Task<DashboardTO> ResumeTotals()
        {
            DashboardTO dashboard = new DashboardTO();

            dashboard.TotalVentas = await TotalSalesLastWeek();
            dashboard.TotalIngresos = await TotalEarningsLastWeek();
            dashboard.TotalProductos = await TotalProductsLastWeek();

            return dashboard;
        }
    }
}
