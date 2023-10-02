namespace SalesSystem.Models.DTO
{
    public class RolDTO
    {
        public string Id { get; set; }

        public string Name { get; set; }

        public DateTime RegistrationDate { get; set; }

        public List<PermissionDTO> Permissions { get; set; }
    }
}
