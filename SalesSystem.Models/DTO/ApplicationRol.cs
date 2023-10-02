using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace SalesSystem.Models.DTO
{
    public class ApplicationRol : IdentityRole
    {

        public ApplicationRol(string name, DateTime registrationDate)
        : base(name)
        {
            RegistrationDate = registrationDate;
        }

        [Required]
        public virtual DateTime RegistrationDate { get; set; }
    }
}
