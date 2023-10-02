namespace SalesSystem.Models.DTO
{
    public class ProductDTO
    {
        public int IdProducto { get; set; }

        public string Nombre { get; set; }

        public int? Stock { get; set; }

        public decimal? Precio { get; set; }

        public bool? EsActivo { get; set; }

        public int? IdCategoria { get; set; }

        public string DescripcionCategoria { get; set; }
    }
}
