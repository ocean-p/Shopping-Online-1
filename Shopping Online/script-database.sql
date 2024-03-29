USE [master]
GO
/****** Object:  Database [Assignment1_HongDaiDuong]    Script Date: 3/16/2021 3:26:28 PM ******/
CREATE DATABASE [Assignment1_HongDaiDuong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_HongDaiDuong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_HongDaiDuong.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment1_HongDaiDuong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_HongDaiDuong_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_HongDaiDuong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET QUERY_STORE = OFF
GO
USE [Assignment1_HongDaiDuong]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 3/16/2021 3:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[isAdmin] [int] NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/16/2021 3:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFood]    Script Date: 3/16/2021 3:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFood](
	[foodID] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
	[img] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[isDelete] [int] NULL,
	[categoryID] [int] NULL,
	[createTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblFood] PRIMARY KEY CLUSTERED 
(
	[foodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/16/2021 3:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] NOT NULL,
	[createDate] [nvarchar](50) NULL,
	[totalQuantity] [int] NULL,
	[totalPrice] [decimal](18, 0) NULL,
	[payment] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/16/2021 3:26:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderID] [int] NOT NULL,
	[foodID] [int] NOT NULL,
	[foodName] [nvarchar](50) NULL,
	[unitPrice] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[totalPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[foodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAccount] ([username], [password], [fullname], [isAdmin]) VALUES (N'abc123', N'123456', N'Nguyễn Văn A', 0)
INSERT [dbo].[tblAccount] ([username], [password], [fullname], [isAdmin]) VALUES (N'admin', N'123456', N'Trần C', 1)
INSERT [dbo].[tblAccount] ([username], [password], [fullname], [isAdmin]) VALUES (N'duong123', N'123456', N'Hồng Đại Dương', 1)
INSERT [dbo].[tblAccount] ([username], [password], [fullname], [isAdmin]) VALUES (N'test', N'123456', N'Nguyễn Văn B', 0)
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (1, N'Coffee')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (2, N'Cake')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (3, N'Milk Tea')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (4, N'Juice')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (1, N'bánh kem oreo', CAST(300000 AS Decimal(18, 0)), N'https://toplist.vn/images/800px/banh-kem-duc-phuc-468893.jpg', 3, 0, 2, N'Jan  9 2021  6:38PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (2, N'trà sữa trân châu', CAST(25000 AS Decimal(18, 0)), N'https://pozaatea.vn/wp-content/uploads/2018/04/tranchau-hoang-gia.png', 5, 0, 3, N'Jan  9 2021  6:38PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (3, N'nước ép táo hàn quốc', CAST(40000 AS Decimal(18, 0)), N'https://cf.shopee.vn/file/8195cc77d2b4fe540171702a31f038c5', 50, 1, 4, N'Jan  9 2021  9:38PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (4, N'cà phê sữa đá', CAST(20000 AS Decimal(18, 0)), N'https://f5cafe.com/wp-content/uploads/2020/06/ca_phe_sua_da.jpg', 100, 0, 1, N'Jan  9 2021  10:38PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (5, N'bánh su kem sữa tươi', CAST(35000 AS Decimal(18, 0)), N'https://www.richs.com.vn/images/cong-thuc/L%C3%A0m%20b%C3%A1nh/Su%20vo%20gion/_9990538.jpg', 100, 1, 2, N'Jan  9 2021  10:38PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (6, N'bánh waffle vị dâu', CAST(70000 AS Decimal(18, 0)), N'https://dep.com.vn/wp-content/uploads/2020/04/banh-waffle-yen-mach-2.jpg', 99, 0, 2, N'Jan  9 2021  10:38PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (7, N'pizza hải sản', CAST(120000 AS Decimal(18, 0)), N'https://aeonmall-binhduongcanary.com.vn/wp-content/uploads/2020/06/c02.png', 99, 0, 2, N'Jan  9 2021  10:38PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (8, N'trà sữa ô long bạc hà', CAST(28000 AS Decimal(18, 0)), N'https://pozaatea.vn/wp-content/uploads/2018/04/o-long-bac-ha.png', 43, 0, 3, N'Jan 12 2021  9:53PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (9, N'cà phê đen sài gòn', CAST(32000 AS Decimal(18, 0)), N'https://shipdoandemff.com/wp-content/uploads/2018/03/C%C3%A0-ph%C3%AA-%C4%91en-S%C3%A0i-G%C3%B2n-1.jpg', 50, 0, 1, N'Jan 12 2021  9:56PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (10, N'bánh gạo cay hàn quốc', CAST(40000 AS Decimal(18, 0)), N'https://monngondongian.com/wp-content/uploads/2019/03/banh-gao-cay.jpg', 49, 0, 2, N'Jan 17 2021  9:56AM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (11, N'sữa tươi trân châu đường đen', CAST(30000 AS Decimal(18, 0)), N'https://pozaatea.vn/wp-content/uploads/2019/01/ttduongden.png', 30, 0, 3, N'Jan 19 2021  7:30PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (12, N'trà sữa dừa', CAST(25000 AS Decimal(18, 0)), N'https://pozaatea.vn/wp-content/uploads/2019/01/tra-sua-dua.png', 49, 0, 3, N'Jan 19 2021  7:32PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (13, N'trà đào cam xả', CAST(20000 AS Decimal(18, 0)), N'https://pozaatea.vn/wp-content/uploads/2018/04/tra-dao-cam-xa.png', 50, 0, 4, N'Jan 19 2021  7:35PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (14, N'bánh cheesecake', CAST(30000 AS Decimal(18, 0)), N'https://binhduongngaynay.com/uploads/images/201026164620_cac-loai-banh-ngot-hot-nhat-viet-nam.webp', 50, 0, 2, N'Jan 19 2021  7:39PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (15, N'trà sữa nướng', CAST(32000 AS Decimal(18, 0)), N'https://pozaatea.vn/wp-content/uploads/2019/06/tra-sua-nuong-2.png', 20, 0, 3, N'Jan 19 2021  7:43PM')
INSERT [dbo].[tblFood] ([foodID], [name], [price], [img], [quantity], [isDelete], [categoryID], [createTime]) VALUES (16, N'trà vải cam dâu', CAST(40000 AS Decimal(18, 0)), N'https://www.thevivahouse.vn/wp-content/uploads/2018/12/sp12.jpg', 50, 0, 4, N'Jan 19 2021  7:45PM')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (1, N'16/01/2021 11:30:50', 2, CAST(60000 AS Decimal(18, 0)), N'COD', N'abc123', N'Hóc Môn')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (2, N'16/01/2021 11:33:25', 5, CAST(590000 AS Decimal(18, 0)), N'COD', N'abc123', N'Hóc Môn')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (3, N'16/01/2021 11:36:15', 6, CAST(620000 AS Decimal(18, 0)), N'COD', N'abc123', N'Hóc Môn')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (4, N'16/01/2021 11:47:51', 5, CAST(950000 AS Decimal(18, 0)), N'COD', N'abc123', N'Hóc Môn')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (5, N'19/01/2021 13:38:29', 2, CAST(160000 AS Decimal(18, 0)), N'COD', N'abc123', N'Hóc Môn')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (6, N'19/01/2021 19:49:31', 8, CAST(221000 AS Decimal(18, 0)), N'Momo', N'test', N'Hóc Môn')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (7, N'19/01/2021 19:57:58', 1, CAST(70000 AS Decimal(18, 0)), N'COD', N'test', N'Hóc Môn')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (8, N'16/03/2021 15:08:19', 2, CAST(325000 AS Decimal(18, 0)), N'COD', N'test', N'Quận 12')
INSERT [dbo].[tblOrder] ([orderID], [createDate], [totalQuantity], [totalPrice], [payment], [username], [address]) VALUES (9, N'16/03/2021 15:17:28', 4, CAST(1200000 AS Decimal(18, 0)), N'COD', N'test', N'Quận 12')
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (1, 3, N'nước ép táo hàn quốc', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (1, 4, N'cà phê sữa đá', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (2, 1, N'bánh kem oreo', CAST(300000 AS Decimal(18, 0)), 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (2, 2, N'trà sữa trân châu', CAST(25000 AS Decimal(18, 0)), 2, CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (2, 7, N'pizza hải sản', CAST(120000 AS Decimal(18, 0)), 2, CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (3, 1, N'bánh kem oreo', CAST(300000 AS Decimal(18, 0)), 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (3, 2, N'trà sữa trân châu', CAST(25000 AS Decimal(18, 0)), 1, CAST(25000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (3, 4, N'cà phê sữa đá', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (3, 5, N'bánh su kem sữa tươi', CAST(35000 AS Decimal(18, 0)), 1, CAST(35000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (3, 7, N'pizza hải sản', CAST(120000 AS Decimal(18, 0)), 2, CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (4, 1, N'bánh kem oreo', CAST(300000 AS Decimal(18, 0)), 3, CAST(900000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (4, 2, N'trà sữa trân châu', CAST(25000 AS Decimal(18, 0)), 2, CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (5, 7, N'pizza hải sản', CAST(120000 AS Decimal(18, 0)), 1, CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (5, 10, N'bánh gạo cay hàn quốc', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (6, 8, N'trà sữa ô long bạc hà', CAST(28000 AS Decimal(18, 0)), 7, CAST(196000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (6, 12, N'trà sữa dừa', CAST(25000 AS Decimal(18, 0)), 1, CAST(25000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (7, 6, N'bánh waffle vị dâu', CAST(70000 AS Decimal(18, 0)), 1, CAST(70000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (8, 1, N'bánh kem oreo', CAST(300000 AS Decimal(18, 0)), 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (8, 2, N'trà sữa trân châu', CAST(25000 AS Decimal(18, 0)), 1, CAST(25000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([orderID], [foodID], [foodName], [unitPrice], [quantity], [totalPrice]) VALUES (9, 1, N'bánh kem oreo', CAST(300000 AS Decimal(18, 0)), 4, CAST(1200000 AS Decimal(18, 0)))
ALTER TABLE [dbo].[tblFood]  WITH CHECK ADD  CONSTRAINT [FK_tblFood_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblFood] CHECK CONSTRAINT [FK_tblFood_tblCategory]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblAccount] FOREIGN KEY([username])
REFERENCES [dbo].[tblAccount] ([username])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblAccount]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblFood] FOREIGN KEY([foodID])
REFERENCES [dbo].[tblFood] ([foodID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblFood]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
USE [master]
GO
ALTER DATABASE [Assignment1_HongDaiDuong] SET  READ_WRITE 
GO
