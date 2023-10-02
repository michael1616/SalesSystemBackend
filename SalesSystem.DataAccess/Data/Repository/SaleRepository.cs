using AutoMapper;
using Microsoft.EntityFrameworkCore;
using SalesSystem.DataAccess.Data.Contexts;
using SalesSystem.DataAccess.Data.Repository.IRepository;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;
using SalesSystem.Utilities;
using System.Globalization;

namespace SalesSystem.DataAccess.Data.Repository
{
    public class SaleRepository : Repository<Ventum>, ISaleRepository
    {
        private readonly ApplicationDBContext _db;
        private readonly IMapper _mapper;

        public SaleRepository(ApplicationDBContext db, IMapper mapper) : base(db)
        {
            _db = db;
            _mapper = mapper;
        }

        public async Task<SaleDTO> AddSale(SaleDTO modelo)
        {
            Ventum sale = _mapper.Map<Ventum>(modelo);

            foreach (DetalleVentum item in sale.DetalleVenta)
            {
                await DiscountStock((int)item.IdProducto, (int)item.Cantidad);
            }

            sale.NumeroDocumento = await GetDocumentNumber();

            await _db.Venta.AddAsync(sale);
            await _db.SaveChangesAsync();

            return _mapper.Map<SaleDTO>(sale);
        }

        public async Task<List<SaleDTO>> GetRecord(RequestReportDTO paramRecord)
        {

            List<Ventum> saleList = new List<Ventum>();

            if (paramRecord.SearchBy == "date")
            {
                DateTime startDate = DateTime.ParseExact(paramRecord.StartDate, Settings.dateFormat, CultureInfo.InvariantCulture);
                DateTime endDate = DateTime.ParseExact(paramRecord.EndDate, Settings.dateFormat, CultureInfo.InvariantCulture);

                saleList = await _db.Venta.Where(a => a.FechaRegistro.Value.Date >= startDate.Date &&
                a.FechaRegistro.Value.Date <= endDate.Date)
                    .Include(x => x.DetalleVenta).
                    ThenInclude(z => z.IdProductoNavigation).ToListAsync();
            }
            else
            {
                saleList = await _db.Venta.Where(a => a.NumeroDocumento == paramRecord.DocumentNumber)
                                                .Include(x => x.DetalleVenta).
                                                ThenInclude(z => z.IdProductoNavigation).ToListAsync();
            }


            return _mapper.Map<List<SaleDTO>>(saleList);
        }

        public async Task<List<ReportDTO>> Report(RequestReportDTO paramRecord)
        {

            DateTime startDate = DateTime.ParseExact(paramRecord.StartDate, Settings.dateFormat, CultureInfo.InvariantCulture);
            DateTime endDate = DateTime.ParseExact(paramRecord.EndDate, Settings.dateFormat, CultureInfo.InvariantCulture);

            List<DetalleVentum> saleDetailQuery = await _db.DetalleVenta
                .Include(p => p.IdProductoNavigation)
                .Include(z => z.IdVentaNavigation)
                .Where(sd => sd.IdVentaNavigation.FechaRegistro.Value.Date >= startDate.Date &&
                sd.IdVentaNavigation.FechaRegistro.Value.Date <= endDate.Date).ToListAsync();

            return _mapper.Map<List<ReportDTO>>(saleDetailQuery);
        }

        private async Task DiscountStock(int idProduct, int quantity)
        {
            Producto producto = await _db.Productos.FirstOrDefaultAsync(a => a.IdProducto == idProduct);

            if (producto != null)
            {
                producto.Stock = producto.Stock - quantity;
                _db.Productos.Update(producto);
                await _db.SaveChangesAsync();
            }


        }

        private async Task<string> GetDocumentNumber()
        {
            NumeroDocumento documentNumber = _db.NumeroDocumentos.First();
            documentNumber.UltimoNumero = documentNumber.UltimoNumero + 1;
            documentNumber.FechaRegistro = DateTime.Now;

            _db.NumeroDocumentos.Update(documentNumber);
            await _db.SaveChangesAsync();

            int numberDigists = 4;
            string zeros = string.Concat(Enumerable.Repeat("0", numberDigists));
            string saleNumber = $"{zeros}{documentNumber.UltimoNumero}";

            //00001
            saleNumber = saleNumber.Substring(saleNumber.Length - numberDigists, numberDigists);

            return saleNumber;
        }

    }
}
