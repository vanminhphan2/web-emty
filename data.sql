USE [master]
GO
/****** Object:  Database [QLBANRUOU]    Script Date: 25/10/2017 3:49:28 CH ******/
CREATE DATABASE [QLBANRUOU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBANRUOU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBANRUOU.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBANRUOU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLBANRUOU_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBANRUOU] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBANRUOU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBANRUOU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBANRUOU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBANRUOU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBANRUOU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBANRUOU] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBANRUOU] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLBANRUOU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBANRUOU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBANRUOU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBANRUOU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBANRUOU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBANRUOU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBANRUOU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBANRUOU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBANRUOU] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBANRUOU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBANRUOU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBANRUOU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBANRUOU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBANRUOU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBANRUOU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBANRUOU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBANRUOU] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBANRUOU] SET  MULTI_USER 
GO
ALTER DATABASE [QLBANRUOU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBANRUOU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBANRUOU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBANRUOU] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBANRUOU] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLBANRUOU]
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[MaRuou] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHITIETDONTHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaRuou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Taikhoan] [varchar](50) NOT NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIRUOU]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIRUOU](
	[MaLoaiRuou] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiRuou] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LOAIRUOU] PRIMARY KEY CLUSTERED 
(
	[MaLoaiRuou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NUOCNHAPKHAU]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NUOCNHAPKHAU](
	[MaNNK] [int] IDENTITY(1,1) NOT NULL,
	[TenNNK] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NUOCNHAPKHAU] PRIMARY KEY CLUSTERED 
(
	[MaNNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHASANXUAT]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHASANXUAT](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](100) NULL,
	[Loigioithieu] [nvarchar](max) NULL,
	[Dienthoai] [varchar](50) NULL,
 CONSTRAINT [PK_NHASANXUAT] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RUOU]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RUOU](
	[MaRuou] [int] IDENTITY(1,1) NOT NULL,
	[TenRuou] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Mota] [nvarchar](max) NULL,
	[AnhRuou] [varchar](50) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MaLoaiRuou] [int] NULL,
	[MaNNK] [int] NULL,
	[MaNSX] [int] NULL,
	[Vip] [int] NULL,
 CONSTRAINT [PK_RUOU] PRIMARY KEY CLUSTERED 
(
	[MaRuou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOANADMIN]    Script Date: 25/10/2017 3:49:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOANADMIN](
	[Tentaikhoan] [varchar](50) NOT NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[HotenAdmin] [nvarchar](100) NULL,
 CONSTRAINT [PK_TAIKHOANADMIN] PRIMARY KEY CLUSTERED 
(
	[Tentaikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'Phan Văn Minh', N'minh', N'123456', N'vanminhphan22@gmail.com', N'HCM', N'0123456789', CAST(N'2017-10-25 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAIRUOU] ON 

INSERT [dbo].[LOAIRUOU] ([MaLoaiRuou], [TenLoaiRuou]) VALUES (1, N'Rượu nội')
INSERT [dbo].[LOAIRUOU] ([MaLoaiRuou], [TenLoaiRuou]) VALUES (2, N'Rượu ngoại')
SET IDENTITY_INSERT [dbo].[LOAIRUOU] OFF
SET IDENTITY_INSERT [dbo].[NUOCNHAPKHAU] ON 

INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (1, N'Nước Pháp')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (2, N'Nước Đức')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (3, N'Nước Anh')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (4, N'Nước Mỹ')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (5, N'Rượu miền Bắc')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (6, N'Rượu miền Trung')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (7, N'Rượu miền Nam')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (8, N'Nước Úc')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (9, N'Nước Ý')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (10, N'Rượu từ Chi Lê')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (11, N'Bồ Đào Nha')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (12, N'Canada')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (13, N'Nước Bỉ')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (14, N'Nước Nga')
INSERT [dbo].[NUOCNHAPKHAU] ([MaNNK], [TenNNK]) VALUES (15, N'Rượu New Zealand')
SET IDENTITY_INSERT [dbo].[NUOCNHAPKHAU] OFF
SET IDENTITY_INSERT [dbo].[NHASANXUAT] ON 

INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (1, N'Bodeaux', N'Pháp', N'Nơi rượu được ra đời.', N'0999999')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (2, N'Fritz Haag', N'Đức', N'Nơi rượu được ra đời.', N'098674532')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (3, N'Champagne', N'Pháp', N'Nơi rượu được ra đời.', N'0999999')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (4, N'Chennin Blanc', N'Nam Phi', N'Nơi rượu được ra đời.', N'098674532')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (5, N'Dolce Vita', N'Ý', N'Nơi rượu được ra đời.', N'0999999')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (6, N'Port', N'Bồ Đào Nha', N'Nơi rượu được ra đời.', N'0999999')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (7, N'Cabernet', N'Chi-lê', N'Nơi rượu được ra đời.', N'098674532')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (8, N'Cava', N'Tây Ban Nha', N'Nơi rượu được ra đời.', N'0999999')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (9, N'Gallo', N'California', N'Nơi rượu được ra đời.', N'098674532')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (10, N'Chardonnay', N'Chi-lê', N'Nơi rượu được ra đời.', N'0999999')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (11, N'Almaden ', N'Mỹ', N'Nơi rượu được ra đời.', N'0999999')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (12, N'Argentina', N'Argentina', N'Nơi rượu được ra đời.', N'098674532')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (13, N'Malbec', N'Argentina', N'Nơi rượu được ra đời.', N'09345675')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (14, N'LEO', N'Argentina', N'Nơi rượu được ra đời.', N'09999456')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [Diachi], [Loigioithieu], [Dienthoai]) VALUES (15, N'Terrazas de los Andes', N'Argentina', N'Nơi rượu được ra đời.', N'011125255')
SET IDENTITY_INSERT [dbo].[NHASANXUAT] OFF
SET IDENTITY_INSERT [dbo].[RUOU] ON 

INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (1, N'Rap Special Reserva', CAST(390000 AS Decimal(18, 0)), N'Người Chile tự hào về giống nho Camernere mà họ cho là chỉ có tại Chile mới cho ra những trái nho ngon nhất.
Nó có tính chất gần giống hệt như Merlot, như một người đàn bà diễm lệ, đẫy đà hơi đứng tuổi nhưng rất ngọt ngào.
Mùi Vị: Hoa Hồng, Kẹo đậu phọng, anh đào, dâu đen.
Năm sản xuất: 2011', N'1.jpg', CAST(N'2017-10-25 00:00:00.000' AS DateTime), 35, 2, 10, 7, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (2, N'Corpalo Gran reserva', CAST(680000 AS Decimal(18, 0)), N'Nếu Shiraz được ví như người đàn ông lực lưỡng thì Merlot lại
 được ví nhưng người đàn bà yêu kiều, diễm lệ, hơi đẫy đà một tí nhưng rất hấp dẫn. Sự pha trộn giữa hai tạo nên một vị cân bằng tuyệt vời.
Mùi Vị: Hạt tiêu, dâu đen, anh đào, kẹo đậu phọng.
Năm sản xuất: 2011', N'2.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 35, 1, 10, 6, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (3, N'Mapola Gran reserva , Carbernet Sauvignon-merlot', CAST(730000 AS Decimal(18, 0)), N'Có vị lực lưỡng tráng kiện của Carbernet Sauvignon nhưng lại có 
pha lẫn với Merlot là 1 giống nho gần giống với Cab- Sau nhưng mềm mại hơn.
Mùi Vị: hoa hồng, anh đào, húng bạc hà, hạt tiêu, kẹo đậu phọng, mạch nha, mận đen
Năm sản xuất: 2013', N'3.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 40, 2, 12, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (4, N'Stagre limited edition', CAST(780000 AS Decimal(18, 0)), N'Dẫn đầu trong các loại nho đỏ, nó được gọi là giống nho quý phái nhất trên thế giới. Vị mạnh mẽ, lực lưỡng tráng kiện.
Mùi Vi: vani, hộp xì gà, cà phê, phúc bồn tử,sim đen, 
mảnh gọt bút chì, hạt tiêu nhẹ
Năm sản xuất: 2011', N'4.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 32, 2, 10, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (5, N'Mapola limited edition', CAST(760000 AS Decimal(18, 0)), N'Vỏ nho đen đậm chứa nhiều vị chát, nồng độ Alcohol khác cao. Xuất xứ từ xứ Cotes Du Rhone nhưng khi qua đến Chile nó lại tỏ ra hợp thổ nhưỡng nên sản sinh ra những trái nho chất lượng rất cao.
Mùi Vị : Hoa hồi, Hoa Lavender, dâu đen, mứt dâu, olive đen, chocolate, hạt tiêu
Năm sản xuất: 2012', N'5.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 25, 2, 10, 5, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (6, N'Valdivieso Variety Chardonnay', CAST(900000 AS Decimal(18, 0)), N'Là loại vang trắng của Chi lê, rất được ư chuộng tại các nước châu Á. Loại vang đầy hứa hẹn khi dùng kết hợp với các món ăn hải sản, gà, cá thịt gia cầm, Phô mai và các món ăn Việt Nam.', N'5.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 5, 2, 15, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (7, N'Remy Martin VSOP', CAST(780000 AS Decimal(18, 0)), N'Rémy Martin đã sản xuất loại cognac ngon nhất thế giới, đứng đầu là Louis XIII. Được "để già" đi trong những thùng gỗ sồi Limousine trong từ 40 năm đến 104 năm và rồi được đem ra pha với rượu mạnh, Louis XIII được quý chuộng do ở mùi hương có một không hai và ở cái vị hậu dường như cứ mãi vương vấn sau khi uống.', N'7.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 42, 2, 10, 2, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (8, N'Remy Martin Club', CAST(1550000 AS Decimal(18, 0)), N' Rémy Martin đã sản xuất loại cognac ngon nhất thế giới, đứng đầu là Louis XIII. Được "để già" đi trong những thùng gỗ sồi Limousine trong từ 40 năm đến 104 năm và rồi được đem ra pha với rượu mạnh, Louis XIII được quý chuộng do ở mùi hương có một không hai và ở cái vị hậu dường như cứ mãi vương vấn sau khi uống', N'8.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 50, 2, 14, 1, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (9, N'Remy Martin VSOP -TO', CAST(4700000 AS Decimal(18, 0)), N'Rémy Martin đã sản xuất loại cognac ngon nhất thế giới, đứng đầu là Louis XIII. Được "để già" đi trong những thùng gỗ sồi Limousine trong từ 40 năm đến 104 năm và rồi được đem ra pha với rượu mạnh, Louis XIII được quý chuộng do ở mùi hương có một không hai và ở cái vị hậu dường như cứ mãi vương vấn sau khi uống.', N'9.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 100, 1, 13, 8, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (10, N'Remy Martin - 3L', CAST(13500000 AS Decimal(18, 0)), N'Rémy Martin đã sản xuất loại cognac ngon nhất thế giới, đứng đầu là Louis XIII. Được "để già" đi trong những thùng gỗ sồi Limousine trong từ 40 năm đến 104 năm và rồi được đem ra pha với rượu mạnh, Louis XIII được quý chuộng do ở mùi hương có một không hai và ở cái vị hậu dường như cứ mãi vương vấn sau khi uống.', N'10.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 20, 2, 11, 9, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (11, N'Johnnie Double Black', CAST(1250000 AS Decimal(18, 0)), N'Johnnie Walker là một câu chuyện dài kể về một người đàn ông. Khi những thành tựu vĩ đại khiến con người trở thành huyền thoại, đó là John Walker. Huyền thoại về người đàn ông tiên phong, người sải bước những bước đi đầu tiên trên con đường chinh phục thế giới, được kể trong từng giọt siêu phẩm', N'11.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 5, 2, 10, 8, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (12, N'Johnnie Walker King GeorgeV', CAST(7350000 AS Decimal(18, 0)), N' Johnnie Walker là một câu chuyện dài kể về một người đàn ông. Khi những thành tựu vĩ đại khiến con người trở thành huyền thoại, đó là John Walker. Huyền thoại về người đàn ông tiên phong, người sải bước những bước đi đầu tiên trên con đường chinh phục thế giới, được kể trong từng giọt siêu phẩm
', N'12.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 15, 2, 7, 6, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (13, N'The John Walker', CAST(65500000 AS Decimal(18, 0)), N'Johnnie Walker là một câu chuyện dài kể về một người đàn ông. Khi những thành tựu vĩ đại khiến con người trở thành huyền thoại, đó là John Walker. Huyền thoại về người đàn ông tiên phong, người sải bước những bước đi đầu tiên trên con đường chinh phục thế giới, được kể trong từng giọt siêu phẩm', N'13.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 19, 2, 15, 5, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (14, N'Rượu John Vàng 1,75 Lít', CAST(2500000 AS Decimal(18, 0)), N'Johnnie Walker là một câu chuyện dài kể về một người đàn ông. Khi những thành tựu vĩ đại khiến con người trở thành huyền thoại, đó là John Walker. Huyền thoại về người đàn ông tiên phong, người sải bước những bước đi đầu tiên trên con đường chinh phục thế giới, được kể trong từng giọt siêu phẩm', N'14.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 25, 2, 14, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (15, N'John Walker & Sons Odyssey', CAST(26800000 AS Decimal(18, 0)), N'Johnnie Walker là một câu chuyện dài kể về một người đàn ông. Khi những thành tựu vĩ đại khiến con người trở thành huyền thoại, đó là John Walker. Huyền thoại về người đàn ông tiên phong, người sải bước những bước đi đầu tiên trên con đường chinh phục thế giới, được kể trong từng giọt siêu phẩm
', N'15.jpg', CAST(N'2017-10-25 00:00:00.000' AS DateTime), 1, 2, 12, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (16, N'Johnnie Walker King George V', CAST(12000000 AS Decimal(18, 0)), N'  Johnnie Walker là một câu chuyện dài kể về một người đàn ông. Khi những thành tựu vĩ đại khiến con người trở thành huyền thoại, đó là John Walker. Huyền thoại về người đàn ông tiên phong, người sải bước những bước đi đầu tiên trên con đường chinh phục thế giới, được kể trong từng giọt siêu phẩm', N'16.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 15, 2, 12, 2, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (17, N'Hennessy VSOP', CAST(1030000 AS Decimal(18, 0)), N'Hennesy nhà sản xuất Cognac nổi tiếng thế giới. Hennessy với lịch sử bắt đầu từ năm 1765 khi công ty được thành lập bởi Richard Hennessy – một quý tộc người Ai Len . Khởi đầu từ một công ty kinh doanh rượu cốt – eaux-de-vie, Hennessy đã trở thành nhãn hiệu Cognac thành công nhất được xuất khẩu trên toàn thế giới.', N'17.jpg', CAST(N'2017-10-25 00:00:00.000' AS DateTime), 10, 1, 13, 1, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (18, N' Rượu Vang Chile Lưới', CAST(165000 AS Decimal(18, 0)), N'Rượu vang (từ tiếng Pháp vin) là một loại thức uống có cồn được lên men từ nước nho hoặc các hoa quả khác. Sự cân bằng hóa học tự nhiên nho cho phép nho lên men không cần thêm các loại đường, axit, enzym, nước hoặc chất dinh dưỡng khác. Men tiêu thụ đường trong nho và chuyển đổi chúng thành rượu và carbon dioxit. Giống nho khác nhau và chủng nấm men khác nhau tạo thành các dạng khác nhau của rượu vang.', N'18.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 122, 2, 14, 2, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (19, N'Rượu Sâm Banh Nga', CAST(130000 AS Decimal(18, 0)), N'Rượu vang (từ tiếng Pháp vin) là một loại thức uống có cồn được lên men từ nước nho hoặc các hoa quả khác. Sự cân bằng hóa học tự nhiên nho cho phép nho lên men không cần thêm các loại đường, axit, enzym, nước hoặc chất dinh dưỡng khác. Men tiêu thụ đường trong nho và chuyển đổi chúng thành rượu và carbon dioxit. Giống nho khác nhau và chủng nấm men khác nhau tạo thành các dạng khác nhau của rượu vang.', N'19.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 200, 2, 14, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (20, N'Standa Vodka
', CAST(255000 AS Decimal(18, 0)), N'  Vodka nguyên là thứ rượu có nguồn gốc từ một số nước Đông Âu nhất là Nga, Ba Lan và Litva. Nó cũng có truyền thống lâu đời ở Bắc Âu. Các khu vực này thường được gọi là vùng Vodka (Vodka Belt) không chỉ vì Vodka có nguồn gốc ở đây mà còn vì đây là nơi sản xuất và tiêu thụ vodka nhiều nhất thế giới. Ở Nga có hẳn một bảo tàng về vodka.
', N'20.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 155, 2, 14, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (21, N'Blavod Vodka', CAST(320000 AS Decimal(18, 0)), N'Vodka nguyên là thứ rượu có nguồn gốc từ một số nước Đông Âu nhất là Nga, Ba Lan và Litva. Nó cũng có truyền thống lâu đời ở Bắc Âu. Các khu vực này thường được gọi là vùng Vodka (Vodka Belt) không chỉ vì Vodka có nguồn gốc ở đây mà còn vì đây là nơi sản xuất và tiêu thụ vodka nhiều nhất thế giới. Ở Nga có hẳn một bảo tàng về vodka.', N'21.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 200, 2, 14, 2, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (22, N'Smirnoff Đen', CAST(350000 AS Decimal(18, 0)), N'Vodka nguyên là thứ rượu có nguồn gốc từ một số nước Đông Âu nhất là Nga, Ba Lan và Litva. Nó cũng có truyền thống lâu đời ở Bắc Âu. Các khu vực này thường được gọi là vùng Vodka (Vodka Belt) không chỉ vì Vodka có nguồn gốc ở đây mà còn vì đây là nơi sản xuất và tiêu thụ vodka nhiều nhất thế giới. Ở Nga có hẳn một bảo tàng về vodka.', N'22.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 1000, 2, 14, 1, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (23, N'Vodka Ciroc', CAST(1050000 AS Decimal(18, 0)), N'   Vodka nguyên là thứ rượu có nguồn gốc từ một số nước Đông Âu nhất là Nga, Ba Lan và Litva. Nó cũng có truyền thống lâu đời ở Bắc Âu. Các khu vực này thường được gọi là vùng Vodka (Vodka Belt) không chỉ vì Vodka có nguồn gốc ở đây mà còn vì đây là nơi sản xuất và tiêu thụ vodka nhiều nhất thế giới. Ở Nga có hẳn một bảo tàng về vodka.', N'23.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 20, 2, 1, 8, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (24, N'Rượu Vang Grappa Platinum', CAST(1680000 AS Decimal(18, 0)), N'Rượu vang (từ tiếng Pháp vin) là một loại thức uống có cồn được lên men từ nước nho hoặc các hoa quả khác. Sự cân bằng hóa học tự nhiên nho cho phép nho lên men không cần thêm các loại đường, axit, enzym, nước hoặc chất dinh dưỡng khác. Men tiêu thụ đường trong nho và chuyển đổi chúng thành rượu và carbon dioxit. Giống nho khác nhau và chủng nấm men khác nhau tạo thành các dạng khác nhau của rượu vang.

    Champagne (được gọi là Champenois trong tiếng Pháp) rất muốn có được danh tiếng như các loại rượu vang do người vùng Bourgogne, láng giềng của họ ở phía nam, làm ra. Tuy nhiên, khí hậu phía bắc của vùng này đã gây khó khăn cho những Champenois khi làm rượu vang đỏ', N'24.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 25, 2, 9, 6, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (25, N' Rượu vang Alicanto', CAST(270000 AS Decimal(18, 0)), N' Rượu vang (từ tiếng Pháp vin) là một loại thức uống có cồn được lên men từ nước nho hoặc các hoa quả khác. Sự cân bằng hóa học tự nhiên nho cho phép nho lên men không cần thêm các loại đường, axit, enzym, nước hoặc chất dinh dưỡng khác. Men tiêu thụ đường trong nho và chuyển đổi chúng thành rượu và carbon dioxit. Giống nho khác nhau và chủng nấm men khác nhau tạo thành các dạng khác nhau của rượu vang.', N'25.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 100, 1, 7, 5, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (26, N'Glelivet 12 Years Old  ', CAST(850000 AS Decimal(18, 0)), N'Blended Scotch Whisky với hương vị đặc biệt và nồng nàn đã mang đến một thức uống thật tuyệt vời, một sự lựa chọn hoàn hảo để chào đón một ngày mới. Ngày nay, Blended Scotch Whisky trở nên rất phổ biến và có thể được tìm thấy tại hơn 200 quốc gia trên thế giới. Trở thành một trong những loại rượu được ưa chuộng trong nhiều thập kỉ qua.', N'26.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 52, 2, 4, 5, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (27, N' Dewars White Laber', CAST(350000 AS Decimal(18, 0)), N'Blended Scotch Whisky với hương vị đặc biệt và nồng nàn đã mang đến một thức uống thật tuyệt vời, một sự lựa chọn hoàn hảo để chào đón một ngày mới. Ngày nay, Blended Scotch Whisky trở nên rất phổ biến và có thể được tìm thấy tại hơn 200 quốc gia trên thế giới. Trở thành một trong những loại rượu được ưa chuộng trong nhiều thập kỉ qua.', N'27.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 14, 1, 8, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (28, N'Chivas Đĩa', CAST(1300000 AS Decimal(18, 0)), N'Chivas Regal tại Việt Nam được người dùng ưa chuộng, hãng không ngừng phát triển những dòng whisky của chính mình. Để đánh dấu cho sự thăng tiến trong những năm của thế kỷ XXI Chivas đã sáng tạo ra sản phẩm mang sự quí phái và sang trọng bậc nhất của thương hiệu Chivas. các dòng rượu bán chạy nhất như chivas 12 năm, chivas 18, hay chivas 21.', N'28.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 80, 2, 4, 6, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (29, N'Chivas 38 Năm - 0,7 L', CAST(13800000 AS Decimal(18, 0)), N'Chivas Regal tại Việt Nam được người dùng ưa chuộng, hãng không ngừng phát triển những dòng whisky của chính mình. Để đánh dấu cho sự thăng tiến trong những năm của thế kỷ XXI Chivas đã sáng tạo ra sản phẩm mang sự quí phái và sang trọng bậc nhất của thương hiệu Chivas. các dòng rượu bán chạy nhất như chivas 12 năm, chivas 18, hay chivas 21.
', N'29.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 23, 1, 15, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (30, N'Chivas 12 Năm Bé', CAST(55000 AS Decimal(18, 0)), N' Chivas Regal tại Việt Nam được người dùng ưa chuộng, hãng không ngừng phát triển những dòng whisky của chính mình. Để đánh dấu cho sự thăng tiến trong những năm của thế kỷ XXI Chivas đã sáng tạo ra sản phẩm mang sự quí phái và sang trọng bậc nhất của thương hiệu Chivas. các dòng rượu bán chạy nhất như chivas 12 năm, chivas 18, hay chivas 21.', N'30.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 41, 2, 14, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (31, N' Ballantine Finest', CAST(280000 AS Decimal(18, 0)), N'     Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'31.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 20, 1, 6, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (32, N'Ballantine''s 12 Năm', CAST(500000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'32.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 53, 2, 4, 1, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (33, N'Ballantine''s 30 Năm', CAST(4900000 AS Decimal(18, 0)), N'Ballantine’s 30 năm được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'33.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 50, 1, 8, 7, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (34, N'Ballantine''s 2 Lít', CAST(1050000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'34.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 52, 2, 4, 7, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (35, N'Rượu Ballantines Limited', CAST(3150000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'35.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 50, 2, 1, 8, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (36, N' Ballantine''s Christmas', CAST(880000 AS Decimal(18, 0)), N' Ballantine''s Christmas', N'36.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 42, 2, 1, 9, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (37, N'Ballantine''s 3 Lít', CAST(1650000 AS Decimal(18, 0)), N'Ballantine''s 3 Lít', N'37.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 345, 1, 6, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (134, N' Ballantine Finest', CAST(280000 AS Decimal(18, 0)), N'     Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'31.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 20, 1, 6, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (135, N'Ballantine''s 12 Năm', CAST(500000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'32.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 53, 2, 4, 1, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (136, N'Ballantine''s 30 Năm', CAST(4900000 AS Decimal(18, 0)), N'Ballantine’s 30 năm được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'33.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 50, 1, 8, 7, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (137, N'Ballantine''s 2 Lít', CAST(1050000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'34.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 52, 2, 4, 7, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (138, N'Rượu Ballantines Limited', CAST(3150000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'35.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 50, 2, 1, 8, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (139, N' Ballantine''s Christmas', CAST(880000 AS Decimal(18, 0)), N' Ballantine''s Christmas', N'36.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 42, 2, 1, 9, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (140, N'Ballantine''s 3 Lít', CAST(1650000 AS Decimal(18, 0)), N'Ballantine''s 3 Lít', N'37.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 345, 1, 7, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (141, N' Ballantine Finest', CAST(280000 AS Decimal(18, 0)), N'     Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'31.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 20, 1, 6, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (142, N'Ballantine''s 12 Năm', CAST(500000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'32.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 53, 2, 4, 1, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (143, N'Ballantine''s 30 Năm', CAST(4900000 AS Decimal(18, 0)), N'Ballantine’s 30 năm được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'33.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 50, 1, 8, 7, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (144, N'Ballantine''s 2 Lít', CAST(1050000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'34.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 52, 2, 6, 7, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (145, N'Rượu Ballantines Limited', CAST(3150000 AS Decimal(18, 0)), N'Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm. Ballantine’s 12 năm là loại whisky phong phú, trơn mượt và phức tạp, được pha trộn từ các single malt và các hạt ngũ cốc được đã được chọn lựa đặc biệt.', N'35.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 50, 2, 1, 8, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (146, N' Ballantine''s Christmas', CAST(880000 AS Decimal(18, 0)), N' Ballantine''s Christmas', N'36.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 42, 2, 1, 9, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (147, N'Ballantine''s 3 Lít', CAST(1650000 AS Decimal(18, 0)), N'Ballantine''s 3 Lít', N'37.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 345, 1, 7, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (148, N'ABC', CAST(1111111 AS Decimal(18, 0)), N'ZZZ', N'anhnen.jpg', CAST(N'2017-10-19 00:00:00.000' AS DateTime), 23, 1, 15, 15, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (149, N'Kawasaki', CAST(300000 AS Decimal(18, 0)), N'không có', N'anhnen.jpg', CAST(N'2017-10-18 00:00:00.000' AS DateTime), 45, 1, 11, 11, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (150, N' Ballantine Finest', CAST(280000 AS Decimal(18, 0)), N'     Ballantine’s được pha trộn từ Miltonduff và Glenburgie cũng như Whisky được chưng cất từ khoảng 50 năm.', N'38.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 20, 1, 2, 3, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (151, N'Hennessy VSOP', CAST(1030000 AS Decimal(18, 0)), N'Hennesy nhà sản xuất Cognac nổi tiếng thế giới. Với lịch sử bắt đầu từ năm 1765 khi công ty được thành lập bởi Richard Hennessy – một quý tộc người Ai Len.', N'39.jpg', CAST(N'2017-10-21 00:00:00.000' AS DateTime), 10, 2, 3, 1, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (152, N' Dewars redLaber', CAST(350000 AS Decimal(18, 0)), N'Blended Scotch Whisky với hương vị đặc biệt và nồng nàn đã mang đến một thức uống thật tuyệt vời, một sự lựa chọn hoàn hảo để chào đón một ngày mới. Ngày nay, Blended Scotch Whisky trở nên rất phổ biến và có thể được tìm thấy tại hơn 200 quốc gia trên thế giới. Trở thành một trong những loại rượu được ưa chuộng trong nhiều thập kỉ qua.', N'40.png', CAST(N'2017-10-20 00:00:00.000' AS DateTime), 14, 1, 5, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (153, N' Dewars greenLaber', CAST(350000 AS Decimal(18, 0)), N'Blended Scotch Whisky với hương vị đặc biệt và nồng nàn đã mang đến một thức uống thật tuyệt vời, một sự lựa chọn hoàn hảo để chào đón một ngày mới. Ngày nay, Blended Scotch Whisky trở nên rất phổ biến và có thể được tìm thấy tại hơn 200 quốc gia trên thế giới. Trở thành một trong những loại rượu được ưa chuộng trong nhiều thập kỉ qua.', N'41.png', CAST(N'2017-10-20 00:00:00.000' AS DateTime), 14, 1, 5, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (154, N' Dewars blackLaber', CAST(350000 AS Decimal(18, 0)), N'Blended Scotch Whisky với hương vị đặc biệt và nồng nàn đã mang đến một thức uống thật tuyệt vời, một sự lựa chọn hoàn hảo để chào đón một ngày mới. Ngày nay, Blended Scotch Whisky trở nên rất phổ biến và có thể được tìm thấy tại hơn 200 quốc gia trên thế giới. Trở thành một trong những loại rượu được ưa chuộng trong nhiều thập kỉ qua.', N'42.png', CAST(N'2017-10-20 00:00:00.000' AS DateTime), 14, 1, 5, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (155, N' Dewars White Laber', CAST(350000 AS Decimal(18, 0)), N'Blended Scotch Whisky với hương vị đặc biệt và nồng nàn đã mang đến một thức uống thật tuyệt vời, một sự lựa chọn hoàn hảo để chào đón một ngày mới. Ngày nay, Blended Scotch Whisky trở nên rất phổ biến và có thể được tìm thấy tại hơn 200 quốc gia trên thế giới. Trở thành một trong những loại rượu được ưa chuộng trong nhiều thập kỉ qua.', N'43.png', CAST(N'2017-10-20 00:00:00.000' AS DateTime), 14, 1, 5, 4, NULL)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (156, N'Aaaaaa', CAST(23423 AS Decimal(18, 0)), N'5555', N'6.jpg', CAST(N'2017-10-11 00:00:00.000' AS DateTime), 44, 2, 11, 15, 1)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (157, N'Aaaaaa', CAST(23423 AS Decimal(18, 0)), N'5555', N'6.jpg', CAST(N'2017-10-11 00:00:00.000' AS DateTime), 44, 2, 11, 15, 1)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (158, N'Aaaaaa', CAST(23423 AS Decimal(18, 0)), N'5555', N'6.jpg', CAST(N'2017-10-11 00:00:00.000' AS DateTime), 44, 2, 11, 15, 1)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (159, N'Aaaaaa', CAST(23423 AS Decimal(18, 0)), N'5555', N'6.jpg', CAST(N'2017-10-11 00:00:00.000' AS DateTime), 44, 2, 11, 15, 1)
INSERT [dbo].[RUOU] ([MaRuou], [TenRuou], [Giaban], [Mota], [AnhRuou], [Ngaycapnhat], [Soluongton], [MaLoaiRuou], [MaNNK], [MaNSX], [Vip]) VALUES (160, N'ttt', CAST(444 AS Decimal(18, 0)), N'hghfhgh', N'8.jpg', CAST(N'2017-10-27 00:00:00.000' AS DateTime), 54, 1, 11, 11, 1)
SET IDENTITY_INSERT [dbo].[RUOU] OFF
INSERT [dbo].[TAIKHOANADMIN] ([Tentaikhoan], [Matkhau], [HotenAdmin]) VALUES (N'admin', N'admin', N'Rio')
INSERT [dbo].[TAIKHOANADMIN] ([Tentaikhoan], [Matkhau], [HotenAdmin]) VALUES (N'admin1', N'admin1', N'Tú')
INSERT [dbo].[TAIKHOANADMIN] ([Tentaikhoan], [Matkhau], [HotenAdmin]) VALUES (N'admin2', N'admin2', N'Hổ')
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_DONDATHANG] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_RUOU] FOREIGN KEY([MaRuou])
REFERENCES [dbo].[RUOU] ([MaRuou])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_RUOU]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[RUOU]  WITH CHECK ADD  CONSTRAINT [FK_RUOU_LOAIRUOU] FOREIGN KEY([MaLoaiRuou])
REFERENCES [dbo].[LOAIRUOU] ([MaLoaiRuou])
GO
ALTER TABLE [dbo].[RUOU] CHECK CONSTRAINT [FK_RUOU_LOAIRUOU]
GO
ALTER TABLE [dbo].[RUOU]  WITH CHECK ADD  CONSTRAINT [FK_RUOU_NUOCNHAPKHAU] FOREIGN KEY([MaNNK])
REFERENCES [dbo].[NUOCNHAPKHAU] ([MaNNK])
GO
ALTER TABLE [dbo].[RUOU] CHECK CONSTRAINT [FK_RUOU_NUOCNHAPKHAU]
GO
ALTER TABLE [dbo].[RUOU]  WITH CHECK ADD  CONSTRAINT [FK_RUOU_NHASANXUAT] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NHASANXUAT] ([MaNSX])
GO
ALTER TABLE [dbo].[RUOU] CHECK CONSTRAINT [FK_RUOU_NHASANXUAT]
GO
USE [master]
GO
ALTER DATABASE [QLBANRUOU] SET  READ_WRITE 
GO
