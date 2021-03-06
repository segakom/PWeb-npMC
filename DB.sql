USE [RentCar]
GO
ALTER TABLE [dbo].[Cars] DROP CONSTRAINT [FK_Cars_Models]
GO
ALTER TABLE [dbo].[Cars] DROP CONSTRAINT [FK_Cars_Makes]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 3/19/2020 21:03:04 ******/
DROP TABLE [dbo].[Models]
GO
/****** Object:  Table [dbo].[Makes]    Script Date: 3/19/2020 21:03:04 ******/
DROP TABLE [dbo].[Makes]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3/19/2020 21:03:04 ******/
DROP TABLE [dbo].[Cars]
GO
USE [master]
GO
/****** Object:  Database [RentCar]    Script Date: 3/19/2020 21:03:04 ******/
DROP DATABASE [RentCar]
GO
/****** Object:  Database [RentCar]    Script Date: 3/19/2020 21:03:04 ******/
CREATE DATABASE [RentCar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentCar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RentCar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentCar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RentCar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RentCar] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentCar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentCar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentCar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentCar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentCar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentCar] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentCar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentCar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentCar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentCar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentCar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentCar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentCar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentCar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentCar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentCar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentCar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentCar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentCar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentCar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentCar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentCar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentCar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentCar] SET RECOVERY FULL 
GO
ALTER DATABASE [RentCar] SET  MULTI_USER 
GO
ALTER DATABASE [RentCar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentCar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentCar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentCar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentCar] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RentCar', N'ON'
GO
ALTER DATABASE [RentCar] SET QUERY_STORE = OFF
GO
USE [RentCar]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RentCar]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3/19/2020 21:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [uniqueidentifier] NOT NULL,
	[MakeId] [uniqueidentifier] NOT NULL,
	[ModelId] [uniqueidentifier] NOT NULL,
	[Production] [int] NOT NULL,
	[EnginePower] [decimal](6, 1) NULL,
	[Gearbox] [int] NOT NULL,
	[LuggageCapacity] [int] NOT NULL,
	[SeatsCount] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makes]    Script Date: 3/19/2020 21:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_Makes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 3/19/2020 21:03:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'8bcda04f-73e9-40c8-940d-02e42f233561', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'5226cac0-4a90-4219-a5ce-356046fffc0a', 2015, CAST(210.0 AS Decimal(6, 1)), 1, 150, 5, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://media.autoweek.nl/m/5vjye2sbnul7_600.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'630247c3-953b-4fc5-9325-09ba16b0a9e3', N'85963748-cf59-41c2-8f0b-44ccfca9cc0f', N'13eae3c6-e4b8-4e29-944a-4ee6642b4d91', 2015, CAST(180.0 AS Decimal(6, 1)), 1, 210, 4, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://article.images.consumerreports.org/f_auto/prod/content/dam/CRO%20Images%202019/Cars/April/CR-Cars-InlineHero-2019-Mazda3-f-4-19')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'5d2aa1fd-99a6-4927-9d96-13a0bbad5985', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'13eae3c6-e4b8-4e29-944a-4ee6642b4d91', 2012, CAST(190.0 AS Decimal(6, 1)), 1, 210, 8, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://article.images.consumerreports.org/f_auto/prod/content/dam/CRO-Images-2020/Cars/01Jan/CR-Cars-Inline-2020-Nissan-Sentra-f-1-20')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'3bd67946-8adc-4126-a54e-145e0dae99a5', N'c2309eb9-e5ec-48e7-9d84-9a2bdbb0f202', N'47809c70-8303-4027-b390-8cb920a26b04', 2006, CAST(130.0 AS Decimal(6, 1)), 1, 210, 4, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://cars.usnews.com/dims4/USNEWS/1cb4de2/2147483647/resize/640x420%3E/format/jpeg/quality/85/?url=https%3A%2F%2Fcars.usnews.com%2Fstatic%2Fimages%2Farticle%2F201809%2F127748%2F07_2018_Lexus_ES_350_640x420.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'96d78cde-fc9c-462d-ad23-25579f07b278', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'13eae3c6-e4b8-4e29-944a-4ee6642b4d91', 2020, CAST(190.0 AS Decimal(6, 1)), 1, 210, 2, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://cdn.gearpatrol.com/wp-content/uploads/2019/01/Complete-Audi-Buying-Guide-gear-patrol-lead-full.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'13d547f1-7dba-4f2b-9371-29787c2f0310', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'13eae3c6-e4b8-4e29-944a-4ee6642b4d91', 2006, CAST(130.0 AS Decimal(6, 1)), 1, 210, 4, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://images.hgmsites.net/lrg/audi-a6_100726069_l.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'd68292ae-3706-4d9b-ab09-311bedef234f', N'85963748-cf59-41c2-8f0b-44ccfca9cc0f', N'5226cac0-4a90-4219-a5ce-356046fffc0a', 2019, CAST(130.0 AS Decimal(6, 1)), 1, 210, 4, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://img.autobytel.com/car-reviews/autobytel/124312-10-affordable-sports-cars/2017-Honda-Civic-Si-Sedan-on-road_400_thb.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'bbfb535a-116d-40cf-b311-37b1dc47056d', N'c2309eb9-e5ec-48e7-9d84-9a2bdbb0f202', N'47809c70-8303-4027-b390-8cb920a26b04', 2009, CAST(190.0 AS Decimal(6, 1)), 1, 210, 4, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://www.automobilemag.com/uploads/sites/11/2019/09/2019-Subaru-WRX-STI-S209-on-track.jpg?fit=around%7C875:492')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'004ced3d-7114-4e0a-84f7-438b871ea541', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'781ad1e9-ddc4-4f17-a8d4-7a41ca06dbab', 2012, CAST(130.0 AS Decimal(6, 1)), 1, 210, 4, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://techcrunch.com/wp-content/uploads/2020/01/audi-aime-21.jpg?w=730&crop=1')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'3b8a361a-f035-46d0-91aa-4c4af9dc7fb9', N'85963748-cf59-41c2-8f0b-44ccfca9cc0f', N'5226cac0-4a90-4219-a5ce-356046fffc0a', 2012, CAST(190.0 AS Decimal(6, 1)), 1, 210, 8, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://cars.usnews.com/dims4/USNEWS/9709c2a/2147483647/resize/640x420%3E/format/jpeg/quality/85/?url=https%3A%2F%2Fcars.usnews.com%2Fstatic%2Fimages%2Farticle%2F201905%2F128111%2F2018_Honda_Accord_Touring_2366_640x420.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'29176626-645d-4a69-be1f-55d8e46dbc68', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'781ad1e9-ddc4-4f17-a8d4-7a41ca06dbab', 2019, CAST(190.0 AS Decimal(6, 1)), 1, 210, 4, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/2018_Audi_A8_50_TDi_Quattro_Automatic_3.0.jpg/1200px-2018_Audi_A8_50_TDi_Quattro_Automatic_3.0.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'3c507f1d-ca96-459a-8bc3-6188bca1b043', N'85963748-cf59-41c2-8f0b-44ccfca9cc0f', N'5226cac0-4a90-4219-a5ce-356046fffc0a', 2020, CAST(190.0 AS Decimal(6, 1)), 1, 210, 2, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://www.motortrend.com/uploads/sites/5/2019/11/2020-Mazda-CX-30-18.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'e22a1314-e96e-4db4-b894-b55c1cb150dc', N'c2309eb9-e5ec-48e7-9d84-9a2bdbb0f202', N'5226cac0-4a90-4219-a5ce-356046fffc0a', 2009, CAST(190.0 AS Decimal(6, 1)), 1, 210, 2, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://www.mercedes-benz.co.in/passengercars/mercedes-benz-cars/models/Sedan-range/sedan-range/latest-sedan/_jcr_content/contentgallerycontainer/par/contentgallery/par/contentgallerytile/image.MQ6.8.20190422141504.jpeg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'e485e23a-2306-4abc-8060-cfc2812290f1', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'47809c70-8303-4027-b390-8cb920a26b04', 2009, CAST(130.0 AS Decimal(6, 1)), 1, 210, 2, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-audi-q5-mmp-1-1566497427.jpg?crop=0.668xw:0.710xh;0.119xw,0.181xh&resize=640:*')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'ad9926e2-7a7b-4e96-91bb-d691cd625436', N'85963748-cf59-41c2-8f0b-44ccfca9cc0f', N'781ad1e9-ddc4-4f17-a8d4-7a41ca06dbab', 2018, CAST(180.0 AS Decimal(6, 1)), 1, 120, 4, N'
Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://m.kia.com/worldwide/vehicles/all-new-k900/images/gallery/img_overview1.jpg')
GO
INSERT [dbo].[Cars] ([Id], [MakeId], [ModelId], [Production], [EnginePower], [Gearbox], [LuggageCapacity], [SeatsCount], [Description], [Photo]) VALUES (N'a6e93eec-5294-456f-80ce-f4da0233b84e', N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'13eae3c6-e4b8-4e29-944a-4ee6642b4d91', 2015, CAST(180.0 AS Decimal(6, 1)), 1, 210, 2, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non maiores neque vero quasi cumque debitis magni repellat dolor quibusdam, odio eaque sapiente fugit, 
nemo ut ex ipsum incidunt? Assumenda, sint.', N'https://www.audi.com/content/dam/gbp2/experience-audi/models-and-technology/production-models/teaser/1920x1080-teaser-A_E-TRON_191044.jpg?imwidth=776&imdensity=1')
GO
INSERT [dbo].[Makes] ([Id], [Name]) VALUES (N'67a8da57-6b96-4cc4-b2f9-1b671129d5f7', N'Audi')
GO
INSERT [dbo].[Makes] ([Id], [Name]) VALUES (N'85963748-cf59-41c2-8f0b-44ccfca9cc0f', N'KIA')
GO
INSERT [dbo].[Makes] ([Id], [Name]) VALUES (N'c2309eb9-e5ec-48e7-9d84-9a2bdbb0f202', N'Mazda')
GO
INSERT [dbo].[Models] ([Id], [Name]) VALUES (N'5226cac0-4a90-4219-a5ce-356046fffc0a', N'Стандарт')
GO
INSERT [dbo].[Models] ([Id], [Name]) VALUES (N'13eae3c6-e4b8-4e29-944a-4ee6642b4d91', N'Премиум')
GO
INSERT [dbo].[Models] ([Id], [Name]) VALUES (N'781ad1e9-ddc4-4f17-a8d4-7a41ca06dbab', N'Эконом')
GO
INSERT [dbo].[Models] ([Id], [Name]) VALUES (N'47809c70-8303-4027-b390-8cb920a26b04', N'Микро автобус')
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Makes] FOREIGN KEY([MakeId])
REFERENCES [dbo].[Makes] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Makes]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Models] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Models]
GO
USE [master]
GO
ALTER DATABASE [RentCar] SET  READ_WRITE 
GO
