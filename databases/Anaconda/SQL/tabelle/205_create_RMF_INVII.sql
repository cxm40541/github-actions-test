/****** Object:  Table [dbo].[RMF_INVII]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMF_INVII](
	[nome_file] [nvarchar](120) NULL,
	[tipo_record] [nvarchar](1) NULL,
	[nro_riga] [int] NULL,
	[Retailer_Number] [nvarchar](7) NULL,
	[Terminal_Number] [nvarchar](2) NULL,
	[External_Retailer] [nvarchar](7) NULL,
	[Retailer_Status] [nvarchar](1) NULL,
	[Retailer_Action_Code] [nvarchar](1) NULL,
	[Terminal_Status] [nvarchar](1) NULL,
	[Terminal_Action_Code] [nvarchar](1) NULL,
	[Terminal_Type] [nvarchar](1) NULL,
	[Business_Name] [nvarchar](30) NULL,
	[Business_Address] [nvarchar](50) NULL,
	[Business_City] [nvarchar](40) NULL,
	[Business_ZipCode] [nvarchar](5) NULL,
	[Business_Phone] [nvarchar](12) NULL,
	[TSR] [nvarchar](3) NULL,
	[Call_Work_Day] [nvarchar](1) NULL,
	[Order_Call_Frequency] [nvarchar](2) NULL,
	[Contact_Name] [nvarchar](30) NULL,
	[WareHouseNro] [nvarchar](2) NULL,
	[Sales_Allowed] [nvarchar](1) NULL,
	[Payment_Type] [nvarchar](1) NULL,
	[Bank_Name] [nvarchar](30) NULL,
	[Industry_Code] [nvarchar](4) NULL,
	[Commercial_Network] [nvarchar](1) NULL,
	[Retailer_Type] [nvarchar](1) NULL,
	[Province] [nvarchar](2) NULL,
	[Comment] [nvarchar](58) NULL,
	[Nome_File_RMF] [nvarchar](50) NULL,
	[Flag_Scartato] [bit] NULL,
	[Motivo_Scarto] [nvarchar](120) NULL,
	[Data_Inserimento] [varchar](50) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
