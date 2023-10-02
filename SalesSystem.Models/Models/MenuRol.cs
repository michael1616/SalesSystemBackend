using System;
using System.Collections.Generic;

namespace SalesSystem.Models.Models;

public partial class MenuRol
{
    public int IdMenuRol { get; set; }

    public int? IdMenu { get; set; }

    public string IdRol { get; set; }

    public virtual Menu IdMenuNavigation { get; set; }

    public virtual AspNetRole IdRolNavigation { get; set; }
}
