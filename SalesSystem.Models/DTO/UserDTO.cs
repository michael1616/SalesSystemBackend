using System.ComponentModel.DataAnnotations;

namespace SalesSystem.Models.DTO
{
    public class UserDTO
    {
        public string Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string FullName { get; set; }

        [Required]
        [EmailAddress]
        [MaxLength(150)]
        public string Email { get; set; }

        [Required]
        public string IdRol { get; set; }

        public string PasswordHash { get; set; }

        [Required]
        public bool IsActive { get; set; }

        public string RolDescription { get; set; }

    }
}
