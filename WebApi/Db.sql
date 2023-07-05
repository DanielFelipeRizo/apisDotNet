USE [master]
GO
/****** Object:  Database [TareasDb]    Script Date: 5/07/2023 10:58:53 a. m. ******/
CREATE DATABASE [TareasDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TareasDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TareasDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TareasDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TareasDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TareasDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TareasDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TareasDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TareasDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TareasDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TareasDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TareasDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TareasDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TareasDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TareasDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TareasDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TareasDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TareasDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TareasDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TareasDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TareasDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TareasDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TareasDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TareasDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TareasDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TareasDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TareasDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TareasDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TareasDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TareasDb] SET RECOVERY FULL 
GO
ALTER DATABASE [TareasDb] SET  MULTI_USER 
GO
ALTER DATABASE [TareasDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TareasDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TareasDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TareasDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TareasDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TareasDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TareasDb', N'ON'
GO
ALTER DATABASE [TareasDb] SET QUERY_STORE = OFF
GO
USE [TareasDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/07/2023 10:58:53 a. m. ******/
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 5/07/2023 10:58:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaId] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Peso] [int] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 5/07/2023 10:58:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarea](
	[TareaId] [uniqueidentifier] NOT NULL,
	[CategoriaId] [uniqueidentifier] NOT NULL,
	[Titulo] [nvarchar](200) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[PrioridadTarea] [int] NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tarea] PRIMARY KEY CLUSTERED 
(
	[TareaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/07/2023 10:58:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[nombre] [nvarchar](200) NOT NULL,
	[apellido] [nvarchar](200) NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221220155714_init', N'7.0.1')
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'cfd83f57-31f9-4d35-a748-08dae2a92d6d', N'Actividades prueba', N'prueba', 343)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'f0dd167c-3d71-4bec-a749-08dae2a92d6d', N'Actividades prueba1', N'prueba1 upd', 33)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'5fa46a16-e159-4f14-a74a-08dae2a92d6d', N'Actividades prueba2', N'prueba2', 44)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'd810e0bc-c3c1-46b0-a74b-08dae2a92d6d', N'Actividades 3', N'prueba3', 33)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'0f361eba-c7b9-4d09-a74c-08dae2a92d6d', N'Actividades 4', N'prueba4', 4)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'5b4bdf2e-c7cc-4e1b-a74d-08dae2a92d6d', N'Actividades 5', N'prueba5', 5)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'da57f64a-f65f-44a5-6270-08dae2c29a54', N'stasdaring', N'stasaring', 323)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'c915ab5a-6663-4459-e47b-08dae2c6134e', N'tomar', N'tomar en dici', 333)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'fe2de405-c38e-4c90-ac52-da0540dfb402', N'Actividades personales', NULL, 50)
GO
INSERT [dbo].[Categoria] ([CategoriaId], [Nombre], [Descripcion], [Peso]) VALUES (N'fe2de405-c38e-4c90-ac52-da0540dfb4ef', N'Actividades pendientes', NULL, 20)
GO
INSERT [dbo].[Tarea] ([TareaId], [CategoriaId], [Titulo], [Descripcion], [PrioridadTarea], [FechaCreacion]) VALUES (N'edb9d960-ebcf-4978-70c3-08dae2c6b7b1', N'cfd83f57-31f9-4d35-a748-08dae2a92d6d', N'tarea test', N'test upd', 34, CAST(N'2022-12-20T20:11:30.8820000' AS DateTime2))
GO
INSERT [dbo].[Tarea] ([TareaId], [CategoriaId], [Titulo], [Descripcion], [PrioridadTarea], [FechaCreacion]) VALUES (N'fe2de405-c38e-4c90-ac52-da0540dfb410', N'fe2de405-c38e-4c90-ac52-da0540dfb4ef', N'Pago de servicios publicos', N'update descripcion', 90, CAST(N'2022-12-20T10:57:13.8853911' AS DateTime2))
GO
INSERT [dbo].[Tarea] ([TareaId], [CategoriaId], [Titulo], [Descripcion], [PrioridadTarea], [FechaCreacion]) VALUES (N'fe2de405-c38e-4c90-ac52-da0540dfb411', N'fe2de405-c38e-4c90-ac52-da0540dfb402', N'Terminar de ver pelicula en netflix', N'eweqwqwqw', 44, CAST(N'2022-12-20T10:57:13.8853922' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'c799c93c-58e9-406b-87fa-08dae2a797b8', N'a1', N'a1', CAST(N'2022-12-20T14:29:59.4650000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'b969223d-89a7-4cc5-5156-08dae2adaccf', N'a2', N'a2', CAST(N'2022-12-20T17:14:22.4450000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'9250a68f-f8d5-4adb-de38-08dae2c1fbfe', N'string', N'string', CAST(N'2022-12-20T19:39:45.3930000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'c504f4bf-53f9-4201-de39-08dae2c1fbfe', N'string1', N'string1', CAST(N'2022-12-20T19:39:45.3930000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'63516bde-b02f-4ad3-de3a-08dae2c1fbfe', N'string2', N'string2', CAST(N'2022-12-20T19:39:45.3930000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'c113a3e9-a897-4344-de3b-08dae2c1fbfe', N'string3', N'string3', CAST(N'2022-12-20T19:39:45.3930000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'544be588-845c-47a1-de3c-08dae2c1fbfe', N'string4', N'string4', CAST(N'2022-12-20T19:39:45.3930000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'e9762b55-d73e-41e9-de3d-08dae2c1fbfe', N'string5', N'string5', CAST(N'2022-12-20T19:39:45.3930000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'374c3950-e89b-4b38-de3e-08dae2c1fbfe', N'string6', N'string6', CAST(N'2022-12-20T19:39:45.3930000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'61f986c6-e7bb-4b91-2b3e-08daea7c9d7f', N'str7', N'str7', CAST(N'2022-12-30T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'1f4b0479-9219-408a-2b3f-08daea7c9d7f', N'str8', N'str8', CAST(N'2022-12-30T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'4a308b5e-1a14-4a27-2b40-08daea7c9d7f', N'str9', N'str9', CAST(N'2022-12-30T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Usuario] ([UsuarioId], [nombre], [apellido], [FechaCreacion]) VALUES (N'6998468b-74c9-44d2-2b41-08daea7c9d7f', N'str10edit2', N'str10edit2', CAST(N'2022-12-30T00:00:00.0000000' AS DateTime2))
GO
/****** Object:  Index [IX_Tarea_CategoriaId]    Script Date: 5/07/2023 10:58:53 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_Tarea_CategoriaId] ON [dbo].[Tarea]
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Categoria_CategoriaId] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categoria] ([CategoriaId])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Categoria_CategoriaId]
GO
USE [master]
GO
ALTER DATABASE [TareasDb] SET  READ_WRITE 
GO
