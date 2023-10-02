using AutoMapper;
using SalesSystem.Models.DTO;
using SalesSystem.Models.Models;

namespace SalesSystem.DataAccess.Config
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<AspNetRole, RolDTO>().ForMember(destiny =>
              destiny.Permissions,
              opt => opt.Ignore()
            );

            CreateMap<RolDTO, AspNetRole>().ForMember(destiny =>
              destiny.Permissions,
              opt => opt.Ignore()
            );

            CreateMap<ApplicationUser, UserDTO>().ReverseMap();

            CreateMap<AspNetUser, UserDTO>().ForMember(destiny =>
              destiny.RolDescription,
              opt => opt.MapFrom(origin => origin.Roles.FirstOrDefault().Name)
            ).ForMember(destiny =>
              destiny.IdRol,
              opt => opt.MapFrom(origin => origin.Roles.FirstOrDefault().Id)
            );

            CreateMap<UserDTO, AspNetUser>().ForMember(destiny =>
              destiny.Roles,
              opt => opt.Ignore()
            );

            CreateMap<Menu, MenuDTO>().ReverseMap();

            CreateMap<Categorium, CategoryDTO>().ReverseMap();

            CreateMap<Producto, ProductDTO>().ForMember(destiny =>
              destiny.DescripcionCategoria,
              opt => opt.MapFrom(origin => origin.IdCategoriaNavigation.Nombre)
            );

            CreateMap<ProductDTO, Producto>().ForMember(destiny =>
              destiny.IdCategoriaNavigation,
              opt => opt.Ignore()
            );


            CreateMap<Ventum, SaleDTO>().ReverseMap();

            CreateMap<DetalleVentum, SaleDetailDTO>().ForMember(destiny =>
              destiny.DescripcionProducto,
              opt => opt.MapFrom(origin => origin.IdProductoNavigation.Nombre)
            );


            CreateMap<SaleDetailDTO, DetalleVentum>().ForMember(destiny =>
              destiny.IdProductoNavigation,
              opt => opt.Ignore()
            );


            CreateMap<DetalleVentum, ReportDTO>().ForMember(destiny =>
              destiny.NumeroDocumento,
              opt => opt.MapFrom(origin => origin.IdVentaNavigation.NumeroDocumento)
            ).ForMember(destiny =>
              destiny.Producto,
              opt => opt.MapFrom(origin => origin.IdProductoNavigation.Nombre)
            ).ForMember(destiny =>
              destiny.TipoPago,
              opt => opt.MapFrom(origin => origin.IdVentaNavigation.TipoPago)
            ).ForMember(destiny =>
              destiny.FechaPago,
              opt => opt.MapFrom(origin => origin.IdVentaNavigation.FechaRegistro)
            ).ForMember(destiny =>
              destiny.Totalventas,
              opt => opt.MapFrom(origin => origin.IdVentaNavigation.Total)
            );


            CreateMap<ReportDTO, DetalleVentum>().ForMember(destiny =>
              destiny.IdVentaNavigation,
              opt => opt.Ignore()
            ).ForMember(destiny =>
              destiny.IdProductoNavigation,
              opt => opt.Ignore()
            );


            CreateMap<ApplicationUser, UserResponseDTO>().ForMember(destiny =>
               destiny.Nombres,
               opt => opt.MapFrom(origin => origin.FullName)
            );

            CreateMap<UserResponseDTO, ApplicationUser>().ForMember(destiny =>
               destiny.FullName,
               opt => opt.MapFrom(origin => origin.Nombres)
            );


            CreateMap<PermissionAction, PermissionDTO>().ForMember(destiny =>
               destiny.IdPermissionAction,
               opt => opt.MapFrom(origin => origin.Id)
            );

            CreateMap<PermissionDTO, PermissionAction>().ForMember(destiny =>
               destiny.Id,
               opt => opt.MapFrom(origin => origin.IdPermissionAction)
            );

            CreateMap<Permission, PermissionDTO>().ForMember(destiny =>
               destiny.IdPermissionAction,
               opt => opt.MapFrom(origin => origin.IdAction)
            );


            CreateMap<PermissionDTO, Permission>().ForMember(destiny =>
               destiny.IdAction,
               opt => opt.MapFrom(origin => origin.IdPermissionAction)
            ).ForMember(destiny =>
               destiny.Id,
               opt => opt.MapFrom(origin => origin.IdPermission)
            );

        }
    }
}
