CREATE DATABASE 
DWSakila
GO
USE [DWSakila]
GO
/****** Object:  User [NT SERVICE\MSSQLServerOLAPService]    Script Date: 21/10/2024 18:03:10 ******/
CREATE USER [NT SERVICE\MSSQLServerOLAPService] FOR LOGIN [NT SERVICE\MSSQLServerOLAPService] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT SERVICE\MSSQLServerOLAPService]
GO
/****** Object:  Table [dbo].[DimAddresses]    Script Date: 21/10/2024 18:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAddresses](
	[AddressSKey] [int] NOT NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[PostalCode] [varchar](10) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_DimAddresses] PRIMARY KEY CLUSTERED 
(
	[AddressSKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomers]    Script Date: 21/10/2024 18:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomers](
	[CustomerSKey] [int] NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[Email] [varchar](50) NULL,
	[AddressSKey] [int] NULL,
 CONSTRAINT [PK_DimCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerSKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDates]    Script Date: 21/10/2024 18:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDates](
	[DateSKey] [int] NOT NULL,
	[Year] [int] NULL,
	[Quarter] [tinyint] NULL,
	[MonthNumber] [tinyint] NULL,
	[MonthName] [nvarchar](50) NULL,
	[WeekNumber] [smallint] NULL,
	[DayOfMonthNumber] [smallint] NULL,
	[WeekDayName] [nvarchar](50) NULL,
	[DayOfYearNumber] [smallint] NULL,
 CONSTRAINT [PK_DimDates] PRIMARY KEY CLUSTERED 
(
	[DateSKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimFilms]    Script Date: 21/10/2024 18:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFilms](
	[FilmSKey] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ReleaseYear] [varchar](4) NULL,
	[Language] [char](20) NOT NULL,
	[RentalRate] [decimal](4, 2) NOT NULL,
	[Length] [smallint] NULL,
	[Rating] [varchar](10) NULL,
	[Categories] [varchar](150) NULL,
 CONSTRAINT [PK_DimFilms] PRIMARY KEY CLUSTERED 
(
	[FilmSKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStaff]    Script Date: 21/10/2024 18:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStaff](
	[StaffSKey] [tinyint] NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[Email] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
	[StoreSKey] [int] NULL,
	[CountryName] [varchar](50) NULL,
 CONSTRAINT [PK_DimStaff] PRIMARY KEY CLUSTERED 
(
	[StaffSKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStores]    Script Date: 21/10/2024 18:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStores](
	[StoreSKey] [int] NOT NULL,
	[ManagerFirstName] [varchar](45) NULL,
	[ManagerLastName] [varchar](45) NOT NULL,
	[AddressSKey] [int] NULL,
 CONSTRAINT [PK_DimStores] PRIMARY KEY CLUSTERED 
(
	[StoreSKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactRentals]    Script Date: 21/10/2024 18:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactRentals](
	[RentalSKey] [int] NOT NULL,
	[CustomerSKey] [int] NULL,
	[FilmSKey] [int] NULL,
	[RentalDateSKey] [int] NULL,
	[ReturnDateSKey] [int] NULL,
	[PaymentDateSKey] [int] NULL,
	[StaffSKey] [tinyint] NULL,
	[Amount] [decimal](5, 2) NULL,
 CONSTRAINT [PK_FactRentals] PRIMARY KEY CLUSTERED 
(
	[RentalSKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimCustomers]  WITH CHECK ADD  CONSTRAINT [FK_DimCustomers_DimAddresses] FOREIGN KEY([AddressSKey])
REFERENCES [dbo].[DimAddresses] ([AddressSKey])
GO
ALTER TABLE [dbo].[DimCustomers] CHECK CONSTRAINT [FK_DimCustomers_DimAddresses]
GO
ALTER TABLE [dbo].[DimStaff]  WITH CHECK ADD  CONSTRAINT [FK_DimStaff_DimStores1] FOREIGN KEY([StoreSKey])
REFERENCES [dbo].[DimStores] ([StoreSKey])
GO
ALTER TABLE [dbo].[DimStaff] CHECK CONSTRAINT [FK_DimStaff_DimStores1]
GO
ALTER TABLE [dbo].[DimStores]  WITH CHECK ADD  CONSTRAINT [FK_DimStores_DimAddresses1] FOREIGN KEY([AddressSKey])
REFERENCES [dbo].[DimAddresses] ([AddressSKey])
GO
ALTER TABLE [dbo].[DimStores] CHECK CONSTRAINT [FK_DimStores_DimAddresses1]
GO
ALTER TABLE [dbo].[FactRentals]  WITH CHECK ADD  CONSTRAINT [FK_FactRentals_DimCustomers] FOREIGN KEY([CustomerSKey])
REFERENCES [dbo].[DimCustomers] ([CustomerSKey])
GO
ALTER TABLE [dbo].[FactRentals] CHECK CONSTRAINT [FK_FactRentals_DimCustomers]
GO
ALTER TABLE [dbo].[FactRentals]  WITH CHECK ADD  CONSTRAINT [FK_FactRentals_DimDates] FOREIGN KEY([RentalDateSKey])
REFERENCES [dbo].[DimDates] ([DateSKey])
GO
ALTER TABLE [dbo].[FactRentals] CHECK CONSTRAINT [FK_FactRentals_DimDates]
GO
ALTER TABLE [dbo].[FactRentals]  WITH CHECK ADD  CONSTRAINT [FK_FactRentals_DimDates1] FOREIGN KEY([ReturnDateSKey])
REFERENCES [dbo].[DimDates] ([DateSKey])
GO
ALTER TABLE [dbo].[FactRentals] CHECK CONSTRAINT [FK_FactRentals_DimDates1]
GO
ALTER TABLE [dbo].[FactRentals]  WITH CHECK ADD  CONSTRAINT [FK_FactRentals_DimDates2] FOREIGN KEY([PaymentDateSKey])
REFERENCES [dbo].[DimDates] ([DateSKey])
GO
ALTER TABLE [dbo].[FactRentals] CHECK CONSTRAINT [FK_FactRentals_DimDates2]
GO
ALTER TABLE [dbo].[FactRentals]  WITH CHECK ADD  CONSTRAINT [FK_FactRentals_DimFilms] FOREIGN KEY([FilmSKey])
REFERENCES [dbo].[DimFilms] ([FilmSKey])
GO
ALTER TABLE [dbo].[FactRentals] CHECK CONSTRAINT [FK_FactRentals_DimFilms]
GO
ALTER TABLE [dbo].[FactRentals]  WITH CHECK ADD  CONSTRAINT [FK_FactRentals_DimStaff] FOREIGN KEY([StaffSKey])
REFERENCES [dbo].[DimStaff] ([StaffSKey])
GO
ALTER TABLE [dbo].[FactRentals] CHECK CONSTRAINT [FK_FactRentals_DimStaff]
GO