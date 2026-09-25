/****** Object:  Table [dbo].[GEV_RMF_Giornaliero_NEW]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEV_RMF_Giornaliero_NEW](
	[Company] [varchar](10) NOT NULL,
	[Retailer Number] [char](7) NOT NULL,
	[Terminal Number] [char](2) NOT NULL,
	[External Retailer] [char](10) NOT NULL,
	[Retailer Status] [char](1) NOT NULL,
	[Retailer Action Code] [char](1) NOT NULL,
	[Terminal Status] [char](1) NOT NULL,
	[Terminal Action Code] [char](1) NOT NULL,
	[New Retailer Number] [char](7) NULL,
	[New External Retailer] [char](10) NULL,
	[Terminal Type] [char](1) NOT NULL,
	[Business Name] [char](30) NOT NULL,
	[Business Address] [char](50) NOT NULL,
	[Business City] [char](40) NOT NULL,
	[Business ZipCode] [char](5) NOT NULL,
	[Business Phone] [char](12) NOT NULL,
	[Tel Sell Rep] [char](3) NOT NULL,
	[DSR_NO] [char](9) NOT NULL,
	[Call Work Day] [char](1) NULL,
	[Order call Frequency] [char](2) NULL,
	[Contact Name] [char](30) NOT NULL,
	[Warehouse no] [char](2) NOT NULL,
	[Sales allowed] [char](1) NULL,
	[Payment type] [char](1) NOT NULL,
	[Bank Name] [char](30) NULL,
	[Industry Code] [char](4) NOT NULL,
	[Commercial Network] [char](1) NOT NULL,
	[Retailer Type] [char](1) NOT NULL,
	[Chain Head Number] [char](7) NULL,
	[Province] [char](20) NOT NULL,
	[Comment] [char](40) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
