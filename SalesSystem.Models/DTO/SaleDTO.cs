namespace SalesSystem.Models.DTO
{
    public class SaleDTO
    {
        public int IdVenta { get; set; }

        public string NumeroDocumento { get; set; }

        public string TipoPago { get; set; }

        public decimal? Total { get; set; }

        public DateTime? FechaRegistro { get; set; }

        public virtual ICollection<SaleDetailDTO> DetalleVenta { get; set; }
    }
}
