USE [master]
GO
/****** Object:  Database [HouseRentDB]    Script Date: 5/2/2017 10:40:30 AM ******/
CREATE DATABASE [HouseRentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HouseRentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HouseRentDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HouseRentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HouseRentDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HouseRentDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HouseRentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HouseRentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HouseRentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HouseRentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HouseRentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HouseRentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HouseRentDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HouseRentDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HouseRentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HouseRentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HouseRentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HouseRentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HouseRentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HouseRentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HouseRentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HouseRentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HouseRentDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HouseRentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HouseRentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HouseRentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HouseRentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HouseRentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HouseRentDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HouseRentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HouseRentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HouseRentDB] SET  MULTI_USER 
GO
ALTER DATABASE [HouseRentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HouseRentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HouseRentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HouseRentDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HouseRentDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/2/2017 10:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 5/2/2017 10:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nvarchar](max) NOT NULL,
	[SurroundingArea] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Areas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/2/2017 10:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CommentText] [nvarchar](max) NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 5/2/2017 10:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HouseName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Floor] [int] NOT NULL,
	[Bedroom] [int] NOT NULL,
	[Dining] [bit] NOT NULL,
	[Drawing] [bit] NOT NULL,
	[Kitchen] [bit] NOT NULL,
	[Additional] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[Approval] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ApprovedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
	[HireStatus] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Rent] [int] NOT NULL,
	[RentStatus] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SearchHistories]    Script Date: 5/2/2017 10:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KeyWord] [nvarchar](max) NULL,
	[Ip] [nvarchar](max) NULL,
	[RoomFilter] [nvarchar](max) NULL,
	[PriceFilter] [nvarchar](max) NULL,
	[CategoryFilter] [nvarchar](max) NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.SearchHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/2/2017 10:40:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[UserStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201705012016453_InitialCreate', N'HouseRentMVC.HouseRentDBContext', 0x1F8B0800000000000400ED5BCD6EDC3610BE17E83B083AB58063D9CEA5357613D8EBB83112FFC0EBB8675AE2AE854AA44A518EF7D97AE823F5153AD42F4949BBA2A4B51DC3C8C53B223F0E87C399D1A7C97FFFFC3BF9F81806D60366B14FC9D4DEDFDDB32D4C5CEAF96439B513BE78F79BFDF1C3CF3F4D3E79E1A3755B8C7B2FC6C14C124FED7BCEA343C789DD7B1CA27837F45D4663BAE0BB2E0D1DE451E7606FEF77677FDFC100610396654DAE13C2FD10A73FE0E78C1217473C41C139F57010E77278324F51AD0B14E238422E9EDA9F6912E36B4CF8F9EDCCB68E021F810E731C2C6C0B114239E2A0E1E1B718CF39A364398F4080829B558461DC020531CE353FAC8677DDC4DE81D884534D2CA0DC24E6343404DC7F9F5BC5D1A7F7B2AD5D5A0DECF609ECCB5762D7A9EDA6F611C3C8B6F4850E6701138354B3EE8AC13B962CDA29CF1E5C44FCDBB16649C01386A704279CA160C7BA4AEE02DFFD825737F42F4CA62409025927D00A9E2902105D311A61C657D778916B7AE6D996A3CE73F489E534694EB68F33C2DF1FD8D6052C8EEE025C1EB9B4E739A70CFF8109668863EF0A718E19111838355A6D756D2D611CF157B122F8195C16DB3A478F5F3159F2FBA90D7FDAD6A9FF88BD42926BF18DF870B7601267096ED072FDCAF384319A107137B3E3DCAE0213A7F2A2B5BE35A36108B6EBEC5EF9F8370F6B59EB8AC67CF37AEB312000B2A118F939DDE0473E82AFAD5FEBC6AF6ED409582DFB3D8E7F0A7B76764E31F8CD335BD64ACDF23CC1EFC8F3188EE3A75FF8EA9E127C918477983DFDE2A701A56CD82D3EC61EA3341C0672E29374C719C631A50146C41C85A1EF23C07CF139144464280C78942F2E050AB61EDD6670DB9694ADB6BED0511431FA50EDA867E087EA02C28388C38631B94DA391C072C58E57C3F627AAA7A1C9F1B3CFE01503F1241E98A8236F345B5FA755D8106D0482BAABADB9EA59889663E4915E25C11C23E6DE7FF6A12410B7B2636DA0CC7A2B125AD6025DFEA4CCDBBE03455B5FE21A12E7A91FF05152FF863283F92E7EA2B58A74F444CB6DB3B617EF399DEFAF18FC766D5BD612C621CF52DA5FA138FE3E4EC4F8A16A7B18FE3CEF52E2A8B792E5D75FDB19251CF9E09FF2DBA4B88827C7E2514A33D46E32E89A5FE6385F51DD5A063DC75CAAED605B951E193BBC9B3166CEFAC939E3D134BF24B9364008FEA0697E46426C982C17183E6E82D10A970D78E2A09B50B2A8D97472E519551CBC9391F00559EFB4B0F593731445E044127B9F4BAC7946DDCFDECDCD99ED30C370DCB881E02EB52D5702B34059A93D1507EB4172653187FC83EE9070E39917D6863578648B818B0565A7D3734065F662B4F85BF3FD826FD76757E63B851D09D74B37874B0D724EBF362DFD6A8202C41A72C98C064948DAF2D1BAD915EB2D6354D2EE4835165B06AC3DACE34E1CCD2EBAD99D9ADDB5ACAB1F62A7232E4343EF532E2288F941B7CEDCCE5917FCB38C50C8BAA3140CB48C52C8BAA3281CB40CA53CE88E97D59E32502679317E96E58FDE4E96A619730F6B9EB61DF79248641944121B84A5821556A25221347079B91054FC5E7ED01D2FE76D65A45CD41DA3246E659452D81DA7E06E65984266805270B70A4C21EC8E5392B7324E29343AF992BDD50EBF941B849992A055624C2935D0AB646015AD4AA9814E320BABA8253F30D5AC09507D62ACE1B16EB64A6C5660E871A59019C416899555828B243748613237ABE431F94177BC8C9F9581AE1B5E29362134ED4F967747CB2958259467A217930EF537A2DE89517D7132CF901BE66F27559654AA122C0BA1C141479A169191D3492CA8E27492DC20D5CA44A7926AE507E6A1BB09527FF68AEAC4ECD5BEF775481900F35BD03C6D3BCE5F1192FA2B0431AC122B8251F1B752FA8C7562C9012AA5622935B356536690E54FECBC354E491F52AE5E724B1A8734C9F99CCD6DA13582271B625B60A607DF13E4CE7C15731CEE8A01BBF3BF8359E0A7C9B718708E88BFC031CF587EFB606FFF40EB2F7D39BD9E4E1C7B418786CF27FF4CE10B8B6EFC10D1E373BD4C949307918A11FB25448FBF8ED54569026ADC19F93ACE41ED4B4C9718D495D807A1A127B1F5E44CBF4D8A9A9E8FDD77F83A8EBED6F837EC0E6ACD7CC3C01A3EE20D03549AEEFA38A9D672D707426DB8BBF37B20A8CD767D20B446BB3E10F526BB41D7556FA41B04A637CBF58A47F556B98E61A44D9F91C06AAD727D76A736CAF541A8B7C9F5CA1BF526B9DE86919BE4FAE8526F911BE4844A1B9C0152CF56B7D7918EB416B36107108D02536F151B04D7D00E364AE01C11729BA5539D67F8617D55EFAB1A58EC68BD522FAD74D27A9A86A1D5FB94460B907A2F52BD41A48585935FAFDBBA8C32EE016EC51D05C53305F3BEA46E0D48EBFA8F9AC0ABBEA50EDD49ADCD494DC8793B9341DFD26A73D752D342B5D6A70EAD4DAD9D4D4D0BE4BD503D9B9EEA44D4C491FF17F3E404C7FEB28210FFA799605794BE156831E68C2C68E1EAB02359A362887613CE31471063D111E3FE02B91C1EBBF00295D6F7B7284860C827B8C5DE19B94C7894F0A338C6E15DA07C819B38EBD74F3BBB549D279791F8158FB10550D31769E2921C277EE0957A9F36A48916087149F3C80C5ACDB988D0CB55897401C1AC1B506EBE131C61E2A57442180500165F92397AC07D7403F7FA8A97C85D157C623BC8E68350CD3E39F1D192A130CE31AAF9F0137CD80B1F3FFC0FAA0250BBCC3F0000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Areas] ON 

INSERT [dbo].[Areas] ([Id], [AreaName], [SurroundingArea]) VALUES (2, N'Mirpur-10', N'Mirpur-2,Mipur-13,Mirpur-11,Kazipara,Purobi')
INSERT [dbo].[Areas] ([Id], [AreaName], [SurroundingArea]) VALUES (3, N'Mirpur-1', N'Mirpur-2,Technical')
INSERT [dbo].[Areas] ([Id], [AreaName], [SurroundingArea]) VALUES (4, N'Mirpur-14', N'Kochukhet,Vashantek,Mirpur-13,Kafrul')
INSERT [dbo].[Areas] ([Id], [AreaName], [SurroundingArea]) VALUES (5, N'ECB chottor', N'Matikata,Kalsi,Manikdi,Cantonment')
INSERT [dbo].[Areas] ([Id], [AreaName], [SurroundingArea]) VALUES (6, N'Kalsi', N'Purobi,Pallabi,Mirpur-12,Mirpur-11')
INSERT [dbo].[Areas] ([Id], [AreaName], [SurroundingArea]) VALUES (7, N'Purobi', N'Mirpur-11,Kalsi,Pallabi,Mirpur-10')
INSERT [dbo].[Areas] ([Id], [AreaName], [SurroundingArea]) VALUES (8, N'Mirpur-11', N'Mirpur-10,Mipur-12,Mirpur-2,Purobi')
SET IDENTITY_INSERT [dbo].[Areas] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [PostId], [UserId], [CommentText], [Time]) VALUES (1, 4, 5, N'dd', CAST(0x0000A7670054517D AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (1, N'Karim Villa', N'Mirpur 10', N'01743349711', 2, 3, 1, 1, 1, N'All Time Electricity', N'Family,Bachelor', 1, CAST(0x0000A76700344832 AS DateTime), CAST(0x0000A76700344832 AS DateTime), 5, 3, 0, CAST(0x0000A76700344832 AS DateTime), 12500, N'Fixed', N'201705020310211651489334736images.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (2, N'Sagor Villa', N'Mirpur 10', N'01743349711', 2, 4, 1, 1, 1, N'N/A', N'Family,Bachelor,Office', 1, CAST(0x0000A7670035867C AS DateTime), CAST(0x0000A7670035867C AS DateTime), 1, 3, 0, CAST(0x0000A7670035867C AS DateTime), 4, N'Negotiable', N'201705020314527721489338807white(2).jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (3, N'Molla Cottage ', N'Purobi', N'01743349711', 5, 4, 1, 1, 1, N'Bla', N'Family,Bachelor', 1, CAST(0x0000A767003611A0 AS DateTime), CAST(0x0000A767003611A0 AS DateTime), 5, 7, 0, CAST(0x0000A767003611A0 AS DateTime), 15000, N'Fixed', N'201705020316515031489338511download (1).jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (4, N'Nayeem villa', N'mirpur', N'01743349711', 3, 3, 1, 1, 0, N'bla', N'Family,Bachelor', 1, CAST(0x0000A76700372F21 AS DateTime), CAST(0x0000A76700372F21 AS DateTime), 5, 6, 0, CAST(0x0000A76700372F21 AS DateTime), 455, N'Negotiable', N'201705020320551391489340272waye_sangshad_2.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (5, N'bla house', N'bla', N'01743349711', 2, 4, 1, 1, 0, N'bla', N'Family,Bachelor', 1, CAST(0x0000A76700982BE4 AS DateTime), CAST(0x0000A76700982BE4 AS DateTime), 5, 7, 0, CAST(0x0000A76700982BE4 AS DateTime), 14000, N'Negotiable', N'201705020914023481489340564b166328e82a488eea596232c43d1a055.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (6, N'Ahsan villa', N'blank', N'01743349711', 10, 1, 1, 1, 0, N'bla', N'Family,Bachelor', 0, CAST(0x0000A76700A982DC AS DateTime), CAST(0x0000A76700A982DC AS DateTime), 5, 2, 0, CAST(0x0000A76700A982DC AS DateTime), 21000, N'Negotiable', N'201705021017102561489340564b166328e82a488eea596232c43d1a055.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (7, N'rahmat monjil', N'bla', N'01743349711', 3, 4, 1, 1, 0, N'bla', N'Family,Bachelor', 1, CAST(0x0000A76700A9BB7B AS DateTime), CAST(0x0000A76700A9BB7B AS DateTime), 5, 3, 0, CAST(0x0000A76700A9BB7B AS DateTime), 17500, N'Negotiable', N'201705021017585831489949961FB_IMG_1489949810719.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (8, N'khondokar villa', N'nai', N'01743349711', 3, 5, 1, 1, 1, N'bla', N'Family,Bachelor', 1, CAST(0x0000A76700A9EA74 AS DateTime), CAST(0x0000A76700A9EA74 AS DateTime), 5, 3, 0, CAST(0x0000A76700A9EA74 AS DateTime), 160000, N'Fixed', N'201705021018386651489340477exterior11.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (9, N'keya menttion', N'No', N'01743349711', 3, 4, 0, 0, 0, N'no', N'Family', 1, CAST(0x0000A76700AA1F0C AS DateTime), CAST(0x0000A76700AA1F0C AS DateTime), 5, 3, 0, CAST(0x0000A76700AA1F0C AS DateTime), 17500, N'Fixed', N'201705021019235431489442892images.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (10, N'khalek vilaa', N'unknow', N'01743349711', 3, 3, 1, 1, 0, N'ccc', N'Family,Bachelor', 1, CAST(0x0000A76700AA6725 AS DateTime), CAST(0x0000A76700AA6725 AS DateTime), 5, 4, 0, CAST(0x0000A76700AA6725 AS DateTime), 4, N'Negotiable', N'201705021020250731489338807white(2).jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (11, N'ismail villa', N'mirpur', N'01743349711', 4, 4, 0, 0, 0, N'blqa', N'Family,Bachelor', 1, CAST(0x0000A76700AA9BD3 AS DateTime), CAST(0x0000A76700AA9BD3 AS DateTime), 5, 4, 0, CAST(0x0000A76700AA9BD3 AS DateTime), 15600, N'Negotiable', N'201705021021100221489340272waye_sangshad_2.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (12, N'rahmat palace', N'mirpur', N'01743349711', 3, 4, 0, 0, 0, N'no', N'Family', 1, CAST(0x0000A76700AAF01D AS DateTime), CAST(0x0000A76700AAF01D AS DateTime), 5, 5, 0, CAST(0x0000A76700AAF01D AS DateTime), 13000, N'Fixed', N'201705021022219111489340646bangabhaban_dhaka_bangladesh.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (13, N'rahmat palace', N'mirpur', N'01743349711', 3, 4, 0, 0, 0, N'no', N'Family', 1, CAST(0x0000A76700AAF0BF AS DateTime), CAST(0x0000A76700AAF0BF AS DateTime), 5, 5, 0, CAST(0x0000A76700AAF0BF AS DateTime), 13000, N'Fixed', N'201705021022224941489340646bangabhaban_dhaka_bangladesh.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (14, N'raja villa', N'mohammadour', N'01743349711', 4, 4, 1, 0, 1, N'al fascility', N'Family,Bachelor', 1, CAST(0x0000A76700AB4B92 AS DateTime), CAST(0x0000A76700AB4B92 AS DateTime), 5, 5, 0, CAST(0x0000A76700AB4B92 AS DateTime), 17000, N'Fixed', N'201705021023399791489443419HL_stanking_6_677x380_FitToBoxSmallDimension_Center.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (15, N'khalek uddin building', N'NO', N'01743349711', 3, 3, 0, 0, 0, N'NO', N'Family,Bachelor', 1, CAST(0x0000A76700AB8DA2 AS DateTime), CAST(0x0000A76700AB8DA2 AS DateTime), 5, 6, 0, CAST(0x0000A76700AB8DA2 AS DateTime), 20000, N'Negotiable', N'201705021024363711489340220house-005.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (16, N'Rear House', N'no', N'01743349711', 4, 3, 1, 1, 0, N'no', N'Family,Bachelor', 1, CAST(0x0000A76700AC1257 AS DateTime), CAST(0x0000A76700AC1257 AS DateTime), 5, 6, 0, CAST(0x0000A76700AC1257 AS DateTime), 16000, N'Negotiable', N'201705021026296141489338807white(2).jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (17, N'rabbi house ', N'no', N'01743349711', 3, 3, 1, 1, 0, N'no', N'Family,Bachelor', 1, CAST(0x0000A76700AC5A9A AS DateTime), CAST(0x0000A76700AC5A9A AS DateTime), 5, 7, 0, CAST(0x0000A76700AC5A9A AS DateTime), 17000, N'Negotiable', N'201705021027312721489334736images.jpg')
INSERT [dbo].[Posts] ([Id], [HouseName], [Address], [PhoneNumber], [Floor], [Bedroom], [Dining], [Drawing], [Kitchen], [Additional], [Category], [Approval], [CreatedDate], [ApprovedDate], [CreatedBy], [AreaId], [HireStatus], [UpdatedDate], [Rent], [RentStatus], [Image]) VALUES (18, N'Last House', N'mirpur', N'01743349711', 3, 4, 1, 1, 0, N':o', N'Family,Bachelor', 1, CAST(0x0000A76700AC9A81 AS DateTime), CAST(0x0000A76700AC9A81 AS DateTime), 5, 7, 0, CAST(0x0000A76700AC9A81 AS DateTime), 25500, N'Fixed', N'201705021028258041489340477maxresdefault.jpg')
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[SearchHistories] ON 

INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (1, N'Mirpur-10', N'192.168.0.118', N'', N'', N'', CAST(0x0000A76700482561 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (2, N'', N'192.168.0.118', N'2', N'5000-10000', N'Family', CAST(0x0000A767004869F7 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (3, N'Mirpur-10', N'192.168.0.118', N'', N'', N'', CAST(0x0000A7670048D115 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (4, N'Mirpur-10', N'192.168.0.118', N'', N'', N'', CAST(0x0000A7670049130C AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (5, N'Mirpur-10', N'192.168.0.118', N'4', N'10000-15000', N'Family', CAST(0x0000A76700491995 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (6, N'', N'192.168.0.118', N'0', N'15000-20000', N'', CAST(0x0000A767007B8743 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (7, N'', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A767007B8BC8 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (8, N'', N'192.168.0.118', N'5', N'15000-20000', N'', CAST(0x0000A767007BAAFF AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (9, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A76700842A0D AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (10, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A7670085BA7E AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (11, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A7670086018C AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (12, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A76700868197 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (13, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A76700868846 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (14, N'', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A7670086904C AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (15, N'mi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A76700869BAD AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (16, N'Mi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A7670086A023 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (17, N'Mi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A7670086A1A9 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (18, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A7670086D409 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (19, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A76700873161 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (20, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999999', N'', CAST(0x0000A7670087F401 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (21, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A767008860DF AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (22, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'Family', CAST(0x0000A767008868A3 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (23, N'', N'192.168.0.118', N'0', N'0-9999999', N'Family', CAST(0x0000A76700886F08 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (24, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A76700935E29 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (25, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A7670093DF5D AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (26, N'Purobi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A7670093E7D9 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (27, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A767009420F5 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (28, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A767009475E6 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (29, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A7670094BAF5 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (30, N'Kalsi', N'192.168.0.118', N'0', N'0-9999999', N'', CAST(0x0000A7670094DFB7 AS DateTime))
INSERT [dbo].[SearchHistories] ([Id], [KeyWord], [Ip], [RoomFilter], [PriceFilter], [CategoryFilter], [Time]) VALUES (31, N'Kalsi', N'::1', N'0', N'0-9999999', N'', CAST(0x0000A76700AD01AA AS DateTime))
SET IDENTITY_INSERT [dbo].[SearchHistories] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [PhoneNumber], [FullName], [UserStatus]) VALUES (1, N'nayeem00', N'1234', N'01743349711', N'Nayeem Hossain', N'admin')
INSERT [dbo].[Users] ([Id], [Username], [Password], [PhoneNumber], [FullName], [UserStatus]) VALUES (2, N'demo', N'1234', N'01743349711', N'Nayeem Hossain', N'user')
INSERT [dbo].[Users] ([Id], [Username], [Password], [PhoneNumber], [FullName], [UserStatus]) VALUES (3, N'Anower', N'1234', N'01743349711', N'Anower hossain', N'user')
INSERT [dbo].[Users] ([Id], [Username], [Password], [PhoneNumber], [FullName], [UserStatus]) VALUES (4, N'Sagor', N'1234', N'01743349711', N'Sagor al Manun', N'user')
INSERT [dbo].[Users] ([Id], [Username], [Password], [PhoneNumber], [FullName], [UserStatus]) VALUES (5, N'nayeem', N'1234', N'01743349711', N'Nayeem Hossain', N'user')
INSERT [dbo].[Users] ([Id], [Username], [Password], [PhoneNumber], [FullName], [UserStatus]) VALUES (6, N'nayeemfff', N'1234', N'01743349711', N'Nayeem Hossain', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [HouseRentDB] SET  READ_WRITE 
GO
