namespace SalesSystem.Models.DTO
{
    public class ReportDTO
    {
        public string NumeroDocumento { get; set; }

        public string TipoPago { get; set; }

        public DateTime FechaPago { get; set; }

        public decimal Totalventas { get; set; }

        public string Producto { get; set; }

        public int Cantidad { get; set; }

        public decimal Precio { get; set; }

        public decimal Total { get; set; }
    }
}
