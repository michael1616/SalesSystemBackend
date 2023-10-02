namespace SalesSystem.Models.DTO
{
    public class SaleDetailDTO
    {
        public int IdVenta { get; set; }

        public int? Cantidad { get; set; }

        public decimal? Precio { get; set; }

        public decimal? Total { get; set; }

        public int? IdProducto { get; set; }

        public string DescripcionProducto { get; set; }
    }
}
