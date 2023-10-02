using System;
using System.Collections.Generic;

namespace SalesSystem.Models.Models;

public partial class PermissionAction
{
    public int Id { get; set; }

    public string Action { get; set; }

    public int? IdPadre { get; set; }

    public virtual PermissionAction IdPadreNavigation { get; set; }

    public virtual ICollection<PermissionAction> InverseIdPadreNavigation { get; set; } = new List<PermissionAction>();

    public virtual ICollection<Permission> Permissions { get; set; } = new List<Permission>();
}
