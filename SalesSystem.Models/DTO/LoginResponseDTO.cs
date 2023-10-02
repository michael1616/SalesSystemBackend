namespace SalesSystem.Models.DTO
{
    public class LoginResponseDTO
    {
        public UserResponseDTO Usuario { get; set; }
        public string Token { get; set; }
    }


    public class UserResponseDTO
    {
        public string Id { get; set; }

        public string Email { get; set; }

        public string Nombres { get; set; }

        public string Rol { get; set; }

        public string IdRol { get; set; }
    }
}
