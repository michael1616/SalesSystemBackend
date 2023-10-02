

namespace SalesSystem.Models.DTO
{
    public class PermissionDTO
    {
        public int IdPermission { get; set; }

        public int IdPermissionAction { get; set; }

        public string Action { get; set; }

        public int? IdPadre { get; set; }

        public string IdRole { get; set; }

        public bool State { get; set; }

        public int? IdMenu { get; set; }

        public int ChildrenCount { get; set; }

        public List<PermissionDTO> ChildrenActions { get; set; }
    }
}
