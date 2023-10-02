using System;
using System.Collections.Generic;

namespace SalesSystem.Models.Models;

public partial class AspNetRole
{
    public string Id { get; set; }

    public DateTime RegistrationDate { get; set; }

    public string Name { get; set; }

    public string NormalizedName { get; set; }

    public string ConcurrencyStamp { get; set; }

    public virtual ICollection<AspNetRoleClaim> AspNetRoleClaims { get; set; } = new List<AspNetRoleClaim>();

    public virtual ICollection<MenuRol> MenuRols { get; set; } = new List<MenuRol>();

    public virtual ICollection<Permission> Permissions { get; set; } = new List<Permission>();

    public virtual ICollection<AspNetUser> Users { get; set; } = new List<AspNetUser>();
}
