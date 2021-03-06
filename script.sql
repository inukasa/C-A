USE [master]
GO
/****** Object:  Database [C&A]    Script Date: 2/7/2020 6:03:51 PM ******/
CREATE DATABASE [C&A]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'C&A', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER01\MSSQL\DATA\C&A.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'C&A_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER01\MSSQL\DATA\C&A_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [C&A] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [C&A].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [C&A] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [C&A] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [C&A] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [C&A] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [C&A] SET ARITHABORT OFF 
GO
ALTER DATABASE [C&A] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [C&A] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [C&A] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [C&A] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [C&A] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [C&A] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [C&A] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [C&A] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [C&A] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [C&A] SET  DISABLE_BROKER 
GO
ALTER DATABASE [C&A] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [C&A] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [C&A] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [C&A] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [C&A] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [C&A] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [C&A] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [C&A] SET RECOVERY FULL 
GO
ALTER DATABASE [C&A] SET  MULTI_USER 
GO
ALTER DATABASE [C&A] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [C&A] SET DB_CHAINING OFF 
GO
ALTER DATABASE [C&A] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [C&A] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [C&A] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'C&A', N'ON'
GO
ALTER DATABASE [C&A] SET QUERY_STORE = OFF
GO
USE [C&A]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [C&A]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[productID] [nvarchar](50) NOT NULL,
	[productQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[orderTotalPrice] [float] NULL,
	[dateCreate] [nvarchar](50) NULL,
	[dateConfirm] [nvarchar](50) NULL,
	[orderStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [int] NOT NULL,
	[orderID] [int] NULL,
	[productName] [nvarchar](50) NULL,
	[productQuantityOrder] [int] NULL,
	[productTotalPrice] [float] NULL,
	[productID] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [nvarchar](50) NOT NULL,
	[subcategoryID] [int] NOT NULL,
	[supplierID] [int] NOT NULL,
	[productName] [nvarchar](50) NULL,
	[productDescription] [nvarchar](max) NULL,
	[productFeedback] [nvarchar](max) NULL,
	[productRate] [int] NULL,
	[importDate] [datetime] NULL,
	[productSize] [nvarchar](50) NULL,
	[productColor] [nvarchar](50) NULL,
	[importPrice] [float] NULL,
	[exportPrice] [float] NULL,
	[productStatus] [nvarchar](50) NULL,
	[productIcon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[rateID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[rateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingInfor]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingInfor](
	[shipID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[shipPhone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[shipName] [nvarchar](50) NULL,
	[dateShip] [nvarchar](50) NULL,
 CONSTRAINT [PK_ShippingInfor] PRIMARY KEY CLUSTERED 
(
	[shipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[cartID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
	[productQuantityOrder] [int] NOT NULL,
	[productTotalPrice] [float] NOT NULL,
	[productPrice] [float] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[subcategoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryID] [int] NOT NULL,
	[subcategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[subcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierID] [int] IDENTITY(1,1) NOT NULL,
	[supplierName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](max) NULL,
	[gender] [nvarchar](50) NULL,
	[birthday] [nvarchar](50) NULL,
	[registerDate] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2/7/2020 6:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[typeID] [int] NOT NULL,
	[typeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'Đồ Nam')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'Đồ Nữ')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (3, N'Dụng cụ')
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'NA_ĐEN_XXL_NHÀ CUNG CẤP 1', 5)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SP0_Đ_XXL_NHÀ CUNG CẤP 1', 6)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SP0_ĐEN_L_NHÀ CUNG CẤP 1', 7)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SP0_ĐEN_XXL_NHÀ CUNG CẤP 1', 8)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SP1_ĐEN_XXL_NHÀ CUNG CẤP 3', 9)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SP1_XANH LÁXANH LÁ_L_NHÀ CUNG CẤP 3', 10)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SP4_Đ_M_NHÀ CUNG CẤP 3', 11)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SPM1_Đ_30_NHÀ CUNG CẤP 5', 12)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SPM2_Đ_30_NHÀ CUNG CẤP 1', 123)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SPM3_X_50_NHÀ CUNG CẤP 1', 23)
INSERT [dbo].[Inventory] ([productID], [productQuantity]) VALUES (N'SPT_VÀNG_50_NHÀ CUNG CẤP 2', 100)
INSERT [dbo].[Order] ([orderID], [userID], [orderTotalPrice], [dateCreate], [dateConfirm], [orderStatus]) VALUES (1, 8, 123124, N'12/24/2019 3:48:57 PM', N'12/24/2019 11:39:00 PM', N'Đã xử lý')
INSERT [dbo].[Order] ([orderID], [userID], [orderTotalPrice], [dateCreate], [dateConfirm], [orderStatus]) VALUES (2, 5, 0, N'12/24/2019 3:48:57 PM', N'12/24/2019 11:30:05 PM', N'Đã xử lý')
INSERT [dbo].[Order] ([orderID], [userID], [orderTotalPrice], [dateCreate], [dateConfirm], [orderStatus]) VALUES (3, 5, 1230456, N'12/24/2019 3:48:57 PM', N'12/24/2019 11:34:03 PM', N'Đã xử lý')
INSERT [dbo].[Order] ([orderID], [userID], [orderTotalPrice], [dateCreate], [dateConfirm], [orderStatus]) VALUES (4, 9, 123124, N'12/24/2019 3:48:57 PM', N'12/24/2019 11:39:02 PM', N'Hủy')
INSERT [dbo].[Order] ([orderID], [userID], [orderTotalPrice], [dateCreate], [dateConfirm], [orderStatus]) VALUES (5, 12, 3000000, N'1/30/2020 1:05:15 PM', N'Chưa xác nhận', N'Đang chờ xử lý')
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productName], [productQuantityOrder], [productTotalPrice], [productID]) VALUES (1, 3, N'gfgh', 1, 123456, N'AB_X_XL_ADDIDASS')
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productName], [productQuantityOrder], [productTotalPrice], [productID]) VALUES (2, 1, N'afa', 2, 22333, N'123')
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productName], [productQuantityOrder], [productTotalPrice], [productID]) VALUES (3, 4, N'aaaa', 3, 5144, N'sfd11')
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productName], [productQuantityOrder], [productTotalPrice], [productID]) VALUES (4, 5, N'San pham 0', 1, 3000000, N'SP0_Đ_XXL_NHÀ CUNG CẤP 1')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'AB_X_XL_ADDIDAS', 1, 1, N'San pham A', N'aaaaa', NULL, 30, NULL, N'XL', N'Xanh', 2000000, 2200000, N'Inactive', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'AB_X_XL_ADDIDASS', 1, 1, N'San pham B', N'aaaaa', NULL, 50, NULL, N'XL', N'Xanh', 1500000, 2000000, N'Inactive', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'NA_ĐEN_XXL_NHÀ CUNG CẤP 1', 0, 0, N'nike air', N'không có mô tả', NULL, 1, CAST(N'2019-12-24T17:13:54.757' AS DateTime), N'xxl', N'đen', NULL, NULL, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SP0_Đ_XXL_NHÀ CUNG CẤP 1', 0, 0, N'San pham 0', N'adsda', N', as, chán vc, ngu lol', 1, CAST(N'2019-12-21T23:09:50.000' AS DateTime), N'XXL', N'đen', 2000001, 3000000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SP0_ĐEN_L_NHÀ CUNG CẤP 1', 0, 0, N'san pham 0', N'không có mô tả', N', chán vc, ngu lol', 0, CAST(N'2019-12-24T16:27:12.000' AS DateTime), N'L', N'đen', 2000001, 3000000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SP0_ĐEN_XXL_NHÀ CUNG CẤP 1', 0, 0, N'san pham 0', N'không có mô tả', N', as, chán vc, ngu lol', 0, CAST(N'2019-12-24T16:40:17.660' AS DateTime), N'xxl', N'đen', 2000001, 3000000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SP1_ĐEN_XXL_NHÀ CUNG CẤP 3', 0, 2, N'san pham 10', N'không có mô tả', NULL, 0, CAST(N'2019-12-24T16:51:30.000' AS DateTime), N'xxl', N'đen', 2000000, 2200000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SP1_XANH LÁXANH LÁ_L_NHÀ CUNG CẤP 3', 0, 2, N'san pham 10', N'không có mô tả', NULL, 0, CAST(N'2019-12-24T16:49:44.000' AS DateTime), N'L', N'xanh lá', 2000000, 2200000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SP4_Đ_M_NHÀ CUNG CẤP 3', 3, 2, N'san pham 4', N'không có mô tả', NULL, 0, CAST(N'2019-12-21T23:16:24.967' AS DateTime), N'M', N'đen', 600000, 800000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SPM1_Đ_30_NHÀ CUNG CẤP 5', 0, 4, N'Sản phẩm mới 1', N'không có mô tả', NULL, 0, CAST(N'2019-12-22T17:43:39.613' AS DateTime), N'30', N'đen', 2000000, 2500000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SPM2_Đ_30_NHÀ CUNG CẤP 1', 0, 0, N'sản phẩm mới 2', N'không có mô tả', NULL, 0, CAST(N'2019-12-22T17:46:22.000' AS DateTime), N'30', N'đỏ', 500000, 100000, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SPM3_X_50_NHÀ CUNG CẤP 1', 0, 0, N'sản phẩm mới 3', N'không có mô tả', NULL, 0, CAST(N'2019-12-22T17:48:36.013' AS DateTime), N'50', N'xanh', NULL, NULL, N'Active', N'pi7.jpg')
INSERT [dbo].[Product] ([productID], [subcategoryID], [supplierID], [productName], [productDescription], [productFeedback], [productRate], [importDate], [productSize], [productColor], [importPrice], [exportPrice], [productStatus], [productIcon]) VALUES (N'SPT_VÀNG_50_NHÀ CUNG CẤP 2', 0, 1, N'không ảnh', N'không có mô tả', N', abcxyz', 0, CAST(N'2019-12-22T18:50:37.403' AS DateTime), N'50', N'vàng', NULL, NULL, N'Active', N'pi7.jpg')
INSERT [dbo].[Rating] ([rateID], [userID], [productID]) VALUES (0, 6, N'NA_ĐEN_XXL_NHÀ CUNG CẤP 1')
INSERT [dbo].[Rating] ([rateID], [userID], [productID]) VALUES (1, 10, N'SP0_Đ_XXL_NHÀ CUNG CẤP 1')
INSERT [dbo].[ShippingInfor] ([shipID], [orderID], [shipPhone], [address], [shipName], [dateShip]) VALUES (1, 2, N'09555555555', N'Số 36 ngõ 44 pháo đài láng', N'Nguyễn Minh Đức', NULL)
INSERT [dbo].[ShippingInfor] ([shipID], [orderID], [shipPhone], [address], [shipName], [dateShip]) VALUES (2, 3, N'09555555555', N'Số 36 ngõ 44 pháo đài láng', N'Nguyễn Minh Đức', NULL)
INSERT [dbo].[ShippingInfor] ([shipID], [orderID], [shipPhone], [address], [shipName], [dateShip]) VALUES (3, 1, N'09555555555', N'Số 36 ngõ 44 pháo đài láng', N'Nguyễn Minh Đức', NULL)
INSERT [dbo].[ShippingInfor] ([shipID], [orderID], [shipPhone], [address], [shipName], [dateShip]) VALUES (4, 4, N'09555555555', N'Số 36 ngõ 44 pháo đài láng', N'Nguyễn Minh Đức', NULL)
INSERT [dbo].[ShippingInfor] ([shipID], [orderID], [shipPhone], [address], [shipName], [dateShip]) VALUES (5, 5, N'0912312312', N'Tp. Việt Trì', N'Phạm Minh Tuấn', NULL)
INSERT [dbo].[ShoppingCart] ([cartID], [userID], [productID], [productQuantityOrder], [productTotalPrice], [productPrice]) VALUES (1, 6, N'SPM2_Đ_30_NHÀ CUNG CẤP 1', 5, 500000, 100000)
INSERT [dbo].[ShoppingCart] ([cartID], [userID], [productID], [productQuantityOrder], [productTotalPrice], [productPrice]) VALUES (2, 6, N'SP4_Đ_M_NHÀ CUNG CẤP 3', 3, 2400000, 800000)
INSERT [dbo].[ShoppingCart] ([cartID], [userID], [productID], [productQuantityOrder], [productTotalPrice], [productPrice]) VALUES (3, 6, N'SP4_Đ_M_NHÀ CUNG CẤP 3', 3, 2400000, 800000)
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (0, 1, N'Giày Vải Nam 1')
INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (1, 1, N'Giày Nam')
INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (2, 2, N'Giày Nữ')
INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (3, 2, N'Giày Da Nữ')
INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (4, 3, N'Bóng Rổ')
INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (5, 1, N'Quần Thể Thao Nam')
INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (6, 3, N'bóng đá')
INSERT [dbo].[SubCategory] ([subcategoryID], [categoryID], [subcategoryName]) VALUES (7, 3, N'bóng chuyền')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([supplierID], [supplierName], [email], [phone], [address]) VALUES (0, N'Nhà cung cấp 1', N'nhacungcap1@gmail.com', N'0961123797', N'Số 36 ngõ 44 pháo đài láng')
INSERT [dbo].[Supplier] ([supplierID], [supplierName], [email], [phone], [address]) VALUES (1, N'Nhà cung cấp 2', N'nhacungcap2@gmail.com', N'0961123797', N'Số 36 ngõ 50 Hồ chi minh')
INSERT [dbo].[Supplier] ([supplierID], [supplierName], [email], [phone], [address]) VALUES (2, N'nhà cung cấp 3', N'nhacungcap3@gmail.com', N'0961123797', N'Số 85, d3, phường hoàng mai')
INSERT [dbo].[Supplier] ([supplierID], [supplierName], [email], [phone], [address]) VALUES (3, N'nhà cung cấp 4', N'nhacungcap4@gmail.com', N'0812345895', N'phố hoa bằng')
INSERT [dbo].[Supplier] ([supplierID], [supplierName], [email], [phone], [address]) VALUES (4, N'nhà cung cấp 5', N'nhacungcap5@gmail.com', N'0978852079', N'Long biên, Hà Nội')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (0, 1, N'manager1', N'manager', N'Quan ly cua hang', NULL, N'0961123797', N'nhacungcap4@gmail.com', N'Nam', N'14/01/1995', N'12/22/2019 11:06:22 AM', N'Inactive')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (2, 2, N'Staff01', N'111111', N'Nguyễn Văn A', NULL, NULL, NULL, N'Nam', NULL, N'12/19/2019 2:08:05 AM', N'Inactive')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (5, 1, N'manager', N'111111', N'Nguyễn Minh ĐỨc', NULL, N'0961123797', NULL, N'Nam', NULL, N'12/22/2019 5:46:43 PM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (6, 3, N'Customer', N'111111', N'caigithe', NULL, NULL, NULL, N'Nữ', NULL, N'12/19/2019 9:22:37 AM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (8, 3, N'Customer02', N'customer', N'Nguyễn Văn C', NULL, NULL, NULL, N'Nam', NULL, N'12/19/2019 9:22:37 AM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (9, 3, N'Customer03', N'customer', N'Trần Thị E', NULL, NULL, NULL, N'Nữ', NULL, N'12/19/2019 9:22:37 AM', N'Inactive')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (10, 3, N'customerdemo', N'mkuln', N'Nguyễn Minh Đức', N'Số 36 ngõ 44 pháo đài láng h', N'095555555554', N'ducnmse05025@fpt.edu.vnn', N'Nữ', N'1997-01-14', N'12/24/2019 2:14:10 AM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (11, 3, N'customerdemo123', N'anvfy', N'Phạm Minh Tuấn', N'Tp. Việt Trì', N'0352598844', N'phivuxxx@gmail.com', N'Nam', N'2020-01-01', N'1/13/2020 3:34:30 AM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (12, 3, N'customerdemo123123', N'123123', N'Phạm Minh Tuấn', N'Tp. Việt Trì', N'0912312312', N'tuan23798@gmail.com34rtyrtyrtyAS', N'Nữ', N'2020-01-01', N'1/13/2020 3:50:16 AM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (13, 3, N'customerdemo1231231', N'123123', N'Phạm Minh Tuấn', N'Tp. Việt Trì', N'0913780585', N'tuan23df798@gmail.com', N'Nam', N'2020-01-15', N'1/21/2020 1:02:32 PM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (14, 3, N'customerdemo12312312324', N'123123', N'Phạm Minh Tuấn', N'Tp. Việt Trì', N'0914525652', N'tuanfg2sd3798@gmail.com', N'Nam', N'2020-01-14', N'1/21/2020 1:24:04 PM', N'Active')
INSERT [dbo].[User] ([userID], [typeID], [username], [password], [fullname], [address], [phone], [email], [gender], [birthday], [registerDate], [status]) VALUES (15, 3, N'customerdemo1231231231213', N'123123', N'Phạm Minh Tuấnzz', N'Tp. Việt Trì', N'0123121223', N'tuan23798@gmail.comdf', N'Nam', N'2020-01-08', N'1/30/2020 12:46:31 PM', N'Active')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserType] ([typeID], [typeName]) VALUES (1, N'manager')
INSERT [dbo].[UserType] ([typeID], [typeName]) VALUES (2, N'staff')
INSERT [dbo].[UserType] ([typeID], [typeName]) VALUES (3, N'customer')
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([subcategoryID])
REFERENCES [dbo].[SubCategory] ([subcategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([supplierID])
REFERENCES [dbo].[Supplier] ([supplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Product]
GO
ALTER TABLE [dbo].[ShippingInfor]  WITH CHECK ADD  CONSTRAINT [FK_ShippingInfor_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[ShippingInfor] CHECK CONSTRAINT [FK_ShippingInfor_Order]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_User]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([typeID])
REFERENCES [dbo].[UserType] ([typeID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
USE [master]
GO
ALTER DATABASE [C&A] SET  READ_WRITE 
GO
