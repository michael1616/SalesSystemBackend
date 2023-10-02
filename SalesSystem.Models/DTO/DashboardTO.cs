namespace SalesSystem.Models.DTO
{
    public class DashboardTO
    {
        public int TotalVentas { get; set; }

        public decimal TotalIngresos { get; set; }

        public int TotalProductos { get; set; }

        public List<SalesPerWeekDTO> VentasUltimaSemana { get; set; }

    }
}
