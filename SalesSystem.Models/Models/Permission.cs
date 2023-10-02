using System;
using System.Collections.Generic;

namespace SalesSystem.Models.Models;

public partial class Permission
{
    public int Id { get; set; }

    public bool State { get; set; }

    public int IdAction { get; set; }

    public string IdRol { get; set; }

    public int? IdMenu { get; set; }

    public virtual PermissionAction IdActionNavigation { get; set; }

    public virtual Menu IdMenuNavigation { get; set; }

    public virtual AspNetRole IdRolNavigation { get; set; }
}
