using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace SalesSystem.Models.DTO
{
    public class ApplicationUser : IdentityUser
    {
        [Required]
        [MaxLength(50)]
        [MinLength(3)]
        public string FullName { get; set; }

        [Required]
        public bool IsActive { get; set; }

        [Required]
        public DateTime RegistrationDate { get; set; }
    }
}
