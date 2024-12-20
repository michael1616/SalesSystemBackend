USE [master]
GO
/****** Object:  Database [SalesSystemDB]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE DATABASE [SalesSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SalesSystemDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SalesSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SalesSystemDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SalesSystemDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalesSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesSystemDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SalesSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesSystemDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SalesSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesSystemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SalesSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [SalesSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesSystemDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SalesSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SalesSystemDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalesSystemDB', N'ON'
GO
ALTER DATABASE [SalesSystemDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SalesSystemDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SalesSystemDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[EsActivo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NULL,
	[Precio] [money] NULL,
	[Total] [money] NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Icono] [varchar](50) NULL,
	[Url] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroDocumento]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroDocumento](
	[IdNumeroDocumento] [int] IDENTITY(1,1) NOT NULL,
	[UltimoNumero] [int] NOT NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNumeroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[State] [bit] NOT NULL,
	[IdAction] [int] NOT NULL,
	[IdRol] [nvarchar](450) NOT NULL,
	[IdMenu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionAction]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionAction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](300) NOT NULL,
	[IdPadre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Stock] [int] NULL,
	[Precio] [money] NULL,
	[EsActivo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
	[IdCategoria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 28/11/2024 4:14:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[NumeroDocumento] [varchar](40) NULL,
	[TipoPago] [varchar](50) NULL,
	[Total] [money] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230813201708_Initial-migration', N'7.0.10')
GO
INSERT [dbo].[AspNetRoles] ([Id], [RegistrationDate], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'128bfc68-b67b-4782-8115-9f503d4a37dd', CAST(N'2023-08-14T19:37:38.2012947' AS DateTime2), N'supervisor', N'SUPERVISOR', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [RegistrationDate], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5370e702-5a18-4b55-920e-259edb8c0511', CAST(N'2023-08-14T19:37:38.2012947' AS DateTime2), N'admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [RegistrationDate], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', CAST(N'2023-08-14T19:37:38.2012947' AS DateTime2), N'employee', N'EMPLOYEE', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [RegistrationDate], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', CAST(N'2023-08-31T18:25:41.1684310' AS DateTime2), N'superRol', N'SUPERROL', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'23a822d5-2983-465b-b595-543605971e5e', N'128bfc68-b67b-4782-8115-9f503d4a37dd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'91b4506d-62b9-4012-8024-ddc7285c7a3c', N'5370e702-5a18-4b55-920e-259edb8c0511')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9611be47-9fb8-47c0-8e40-3ebbfd63de2b', N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'09415eb8-92d2-410d-a5d9-5bccc014aee2', N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsActive], [RegistrationDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'09415eb8-92d2-410d-a5d9-5bccc014aee2', N'userSuperRol', 1, CAST(N'2023-08-31T18:28:58.0745850' AS DateTime2), N'super@gmail.com', N'SUPER@GMAIL.COM', N'super@gmail.com', N'SUPER@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKmOLfhRnno08CDu3q6v++eGN1Blb2f521QEvAbKxfZiHW4Baqb2w9cg4Lp0C6WLHQ==', N'C2KSOOKELFAGWJKADZWOCC4RFXK5RGO3', N'1f631c31-2224-4c06-a056-1a4b57a1e023', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsActive], [RegistrationDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'23a822d5-2983-465b-b595-543605971e5e', N'Juliana Gomez', 1, CAST(N'2023-08-23T20:19:14.1359842' AS DateTime2), N'juli@gmail.com', N'JULI@GMAIL.COM', N'juli@gmail.com', N'JULI@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGHyrEBkCZa8URG59edL7hkwYth3TNgJ/RkjJ0SZhspbudbagfrCjwREQE8ziLxyOA==', N'L2L25U6XS5EUWARCTG3NZXC6VV6Z7XDR', N'70f49f7a-0b2a-445f-ac72-e1342056ed16', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsActive], [RegistrationDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'91b4506d-62b9-4012-8024-ddc7285c7a3c', N'Michael Alexander Macías Tuberquia', 1, CAST(N'2023-08-14T19:37:20.3002593' AS DateTime2), N'maicol.a16-@hotmail.com', N'MAICOL.A16-@HOTMAIL.COM', N'maicol.a16-@hotmail.com', N'MAICOL.A16-@HOTMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAnZfYMotTTBlALSIhb78jQHDW8EhpkO9tgkWdVQTlHQDNdZSVL9ueFQUGcJeGgPMA==', N'LBSGDRZXV7WWLMMFGSQUO2SYE6U2KGXF', N'28bd7cb5-5e7e-4068-bb40-56c40c4ea0e7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsActive], [RegistrationDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9611be47-9fb8-47c0-8e40-3ebbfd63de2b', N'Juanito Perez', 1, CAST(N'2023-08-16T19:13:43.8887986' AS DateTime2), N'perez@gmail.com', N'PEREZ@GMAIL.COM', N'perez@gmail.com', N'PEREZ@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAO/Dc2k6tzJpcb3+Bhd3B+YHjcrX9KQHvMx26A6veFlAVqYBcpOFFDkojK4S2iVhQ==', N'NCFH6RPRN3EOME6JIFF2AHZXIH74B6OY', N'c8bb8a95-3b8a-4b4f-bf6a-ac80ffa4fc63', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [EsActivo], [FechaRegistro]) VALUES (1, N'Laptops', 1, CAST(N'2023-08-14T19:44:13.400' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [EsActivo], [FechaRegistro]) VALUES (2, N'Monitores', 1, CAST(N'2023-08-14T19:44:13.400' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [EsActivo], [FechaRegistro]) VALUES (3, N'Teclados', 1, CAST(N'2023-08-14T19:44:13.400' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [EsActivo], [FechaRegistro]) VALUES (4, N'Auriculares', 1, CAST(N'2023-08-14T19:44:13.400' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [EsActivo], [FechaRegistro]) VALUES (5, N'Memorias', 1, CAST(N'2023-08-14T19:44:13.400' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [EsActivo], [FechaRegistro]) VALUES (6, N'Accesorios', 1, CAST(N'2023-08-14T19:44:13.400' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (1, 2, 100000.0000, 200000.0000, 1, 9)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (2, 1, 4500000.0000, 4500000.0000, 2, 3)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (3, 2, 500000.0000, 1000000.0000, 2, 1016)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (4, 3, 20000.0000, 60000.0000, 2, 15)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (5, 3, 20000.0000, 60000.0000, 3, 14)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (6, 1, 950000.0000, 950000.0000, 3, 12)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (7, 2, 2220000.0000, 4440000.0000, 4, 2)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (8, 1, 800000.0000, 800000.0000, 5, 7)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (9, 2, 20000.0000, 40000.0000, 6, 15)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (10, 1, 14000000.0000, 14000000.0000, 7, 5)
INSERT [dbo].[DetalleVenta] ([IdDetalleVenta], [Cantidad], [Precio], [Total], [IdVenta], [IdProducto]) VALUES (11, 1, 680000.0000, 680000.0000, 8, 11)
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Icono], [Url]) VALUES (1, N'DashBoard', N'dashboard', N'/pages/dashboard')
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Icono], [Url]) VALUES (2, N'Users', N'group', N'/pages/user')
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Icono], [Url]) VALUES (3, N'Products', N'collections_bookmark', N'/pages/product')
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Icono], [Url]) VALUES (4, N'Sale', N'currency_exchange', N'/pages/sale')
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Icono], [Url]) VALUES (5, N'Record Sales', N'edit_note', N'/pages/record_sale')
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Icono], [Url]) VALUES (6, N'Reports', N'receipt', N'/pages/report_sale')
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Icono], [Url]) VALUES (7, N'Roles', N'settings', N'/pages/role')
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[NumeroDocumento] ON 

INSERT [dbo].[NumeroDocumento] ([IdNumeroDocumento], [UltimoNumero], [FechaRegistro]) VALUES (1, 8, CAST(N'2023-08-30T14:49:41.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[NumeroDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (1, 1, 1, N'5370e702-5a18-4b55-920e-259edb8c0511', 1)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (2, 1, 2, N'5370e702-5a18-4b55-920e-259edb8c0511', 2)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (3, 1, 3, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (4, 1, 4, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (5, 1, 5, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (6, 1, 6, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (7, 1, 7, N'5370e702-5a18-4b55-920e-259edb8c0511', 3)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (8, 1, 8, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (9, 1, 9, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (10, 1, 10, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (11, 1, 11, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (12, 1, 12, N'5370e702-5a18-4b55-920e-259edb8c0511', 4)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (13, 1, 13, N'5370e702-5a18-4b55-920e-259edb8c0511', 5)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (14, 1, 14, N'5370e702-5a18-4b55-920e-259edb8c0511', 6)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (15, 0, 1, N'128bfc68-b67b-4782-8115-9f503d4a37dd', 1)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (16, 0, 2, N'128bfc68-b67b-4782-8115-9f503d4a37dd', 2)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (17, 0, 3, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (18, 0, 4, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (19, 0, 5, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (20, 0, 6, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (21, 1, 7, N'128bfc68-b67b-4782-8115-9f503d4a37dd', 3)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (22, 1, 8, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (23, 1, 9, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (24, 1, 10, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (25, 1, 11, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (26, 1, 12, N'128bfc68-b67b-4782-8115-9f503d4a37dd', 4)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (27, 1, 13, N'128bfc68-b67b-4782-8115-9f503d4a37dd', 5)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (28, 1, 14, N'128bfc68-b67b-4782-8115-9f503d4a37dd', 6)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (29, 0, 1, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', 1)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (30, 0, 2, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', 2)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (31, 0, 3, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (32, 0, 4, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (33, 0, 5, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (34, 0, 6, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (35, 0, 7, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', 3)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (36, 0, 8, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (37, 0, 9, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (38, 0, 10, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (39, 0, 11, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (40, 1, 12, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', 4)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (41, 1, 13, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', 5)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (42, 0, 14, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', 6)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (43, 1, 15, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (44, 1, 15, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (45, 1, 15, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (46, 1, 16, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (47, 1, 16, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (48, 1, 16, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (49, 1, 17, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (50, 1, 17, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (51, 0, 17, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (52, 1, 18, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (53, 0, 18, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (54, 0, 18, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (55, 1, 19, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (56, 0, 19, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (57, 0, 19, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (58, 1, 20, N'5370e702-5a18-4b55-920e-259edb8c0511', 7)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (59, 0, 20, N'128bfc68-b67b-4782-8115-9f503d4a37dd', 7)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (60, 0, 20, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', 7)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (61, 1, 21, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (62, 0, 21, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (63, 0, 21, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (64, 1, 22, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (65, 0, 22, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (66, 0, 22, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (67, 1, 23, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (68, 0, 23, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (69, 0, 23, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (70, 1, 24, N'5370e702-5a18-4b55-920e-259edb8c0511', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (71, 0, 24, N'128bfc68-b67b-4782-8115-9f503d4a37dd', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (72, 0, 24, N'ba777204-a45a-4ded-8cd1-1d0a8a1d0536', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (75, 1, 2, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', 2)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (76, 1, 3, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (77, 0, 4, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (78, 0, 5, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (79, 0, 6, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (80, 1, 7, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', 3)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (81, 1, 8, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (82, 0, 9, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (83, 1, 10, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (84, 1, 11, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (85, 0, 20, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', 7)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (86, 0, 21, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (87, 0, 22, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (88, 0, 23, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (89, 0, 24, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (90, 1, 1, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', 1)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (91, 1, 18, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (92, 1, 19, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (93, 0, 12, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', 4)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (94, 0, 15, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (95, 1, 13, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', 5)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (96, 1, 16, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (97, 1, 14, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', 6)
INSERT [dbo].[Permission] ([Id], [State], [IdAction], [IdRol], [IdMenu]) VALUES (98, 1, 17, N'f15526ad-7abb-4ecb-a54e-ea3cf70d2ba1', NULL)
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[PermissionAction] ON 

INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (1, N'DASH_BOARD_MODULE', NULL)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (2, N'USERS_MODULE', NULL)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (3, N'USERS_LIST', 2)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (4, N'USERS_ADD', 2)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (5, N'USERS_EDIT', 2)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (6, N'USERS_DELETE', 2)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (7, N'PRODUCTS_MODULE', NULL)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (8, N'PRODUCTS_LIST', 7)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (9, N'PRODUCTS_ADD', 7)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (10, N'PRODUCTS_EDIT', 7)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (11, N'PRODUCTS_DELETE', 7)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (12, N'SALE_MODULE', NULL)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (13, N'RECORD_SALE_MODULE', NULL)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (14, N'REPORT_SALE_MODULE', NULL)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (15, N'SALE_PRODUCT_LIST', 12)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (16, N'RECORD_SALE_DETAIL', 13)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (17, N'REPORT_SALE_EXPORT', 14)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (18, N'DASH_BOARD_GRAPHIC', 1)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (19, N'DASH_BOARD_TOTALS', 1)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (20, N'ROLES_MODULE', NULL)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (21, N'ROLES_LIST', 20)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (22, N'ROLES_PERMISSION_ADD', 20)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (23, N'ROLES_PERMISSION_EDIT', 20)
INSERT [dbo].[PermissionAction] ([Id], [Action], [IdPadre]) VALUES (24, N'ROLES_PERMISSION_DELETE', 20)
SET IDENTITY_INSERT [dbo].[PermissionAction] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (1, N'laptop samsung book pro', 20, 2500000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (2, N'laptop lenovo idea pad', 28, 2220000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (3, N'laptop asus zenbook duo', 29, 4500000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (4, N'monitor teros gaming te-2', 25, 1000000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 2)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (5, N'monitor samsung curvo', 14, 14000000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 2)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (6, N'monitor huawei gamer', 10, 1350000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 2)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (7, N'teclado seisen gamer', 9, 800000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 3)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (8, N'teclado antryx gamer', 10, 100000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 3)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (9, N'teclado logitech', 8, 100000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 3)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (10, N'auricular logitech gamer', 15, 800000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 4)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (11, N'auricular hyperx gamer', 19, 680000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 4)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (12, N'auricular redragon rgb', 24, 950000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 4)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (13, N'memoria kingston rgb', 10, 200000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 5)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (14, N'ventilador cooler master', 17, 20000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 6)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (15, N'mini ventilador lenovo', 10, 20000.0000, 1, CAST(N'2023-08-17T18:53:04.290' AS DateTime), 6)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (1016, N'memoria ram DDR5 64gb', 10, 500000.0000, 1, CAST(N'2023-08-24T18:32:02.917' AS DateTime), 5)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Stock], [Precio], [EsActivo], [FechaRegistro], [IdCategoria]) VALUES (1025, N'solid disk', 10, 180000.0000, 1, CAST(N'2024-03-13T15:43:03.003' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (1, N'0001', N'cash', 200000.0000, CAST(N'2023-08-20T01:13:53.727' AS DateTime))
INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (2, N'0002', N'cash', 5560000.0000, CAST(N'2023-08-25T01:13:53.727' AS DateTime))
INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (3, N'0003', N'card', 1010000.0000, CAST(N'2023-08-25T17:18:43.260' AS DateTime))
INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (4, N'0004', N'card', 4440000.0000, CAST(N'2023-08-27T15:50:46.450' AS DateTime))
INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (5, N'0005', N'card', 800000.0000, CAST(N'2023-08-27T15:50:59.280' AS DateTime))
INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (6, N'0006', N'card', 40000.0000, CAST(N'2023-08-27T15:51:08.283' AS DateTime))
INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (7, N'0007', N'cash', 14000000.0000, CAST(N'2023-08-30T14:47:54.437' AS DateTime))
INSERT [dbo].[Venta] ([IdVenta], [NumeroDocumento], [TipoPago], [Total], [FechaRegistro]) VALUES (8, N'0008', N'card', 680000.0000, CAST(N'2023-08-30T14:49:41.410' AS DateTime))
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 28/11/2024 4:14:18 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ((1)) FOR [EsActivo]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[NumeroDocumento] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT ((1)) FOR [EsActivo]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([IdAction])
REFERENCES [dbo].[PermissionAction] ([Id])
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[PermissionAction]  WITH CHECK ADD FOREIGN KEY([IdPadre])
REFERENCES [dbo].[PermissionAction] ([Id])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
USE [master]
GO
ALTER DATABASE [SalesSystemDB] SET  READ_WRITE 
GO
