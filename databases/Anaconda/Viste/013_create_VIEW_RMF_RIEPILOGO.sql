/****** Object:  View [dbo].[VIEW_RMF_RIEPILOGO]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_RMF_RIEPILOGO]
AS
SELECT     dbo.RMF_INVII.nome_file, dbo.RMF_INVII.tipo_record, dbo.RMF_INVII.nro_riga, dbo.RMF_INVII.Retailer_Number, 
                      dbo.RMF_INVII.Terminal_Number, dbo.RMF_INVII.External_Retailer, dbo.RMF_INVII.Retailer_Status, 
                      dbo.RMF_INVII.Retailer_Action_Code, dbo.RMF_INVII.Terminal_Status, dbo.RMF_INVII.Terminal_Action_Code, 
                      dbo.RMF_INVII.Terminal_Type, dbo.RMF_INVII.Business_Name, dbo.RMF_INVII.Business_Address, dbo.RMF_INVII.Business_City, 
                      dbo.RMF_INVII.Business_ZipCode, dbo.RMF_INVII.Business_Phone, dbo.RMF_INVII.TSR, dbo.RMF_INVII.Call_Work_Day, 
                      dbo.RMF_INVII.Order_Call_Frequency, dbo.RMF_INVII.Contact_Name, dbo.RMF_INVII.WareHouseNro, dbo.RMF_INVII.Sales_Allowed, 
                      dbo.RMF_INVII.Payment_Type, dbo.RMF_INVII.Bank_Name, dbo.RMF_INVII.Industry_Code, dbo.RMF_INVII.Commercial_Network, 
                      dbo.RMF_INVII.Retailer_Type, dbo.RMF_INVII.Province, dbo.RMF_INVII.Comment, dbo.RMF_INVII.Nome_File_RMF, 
                      dbo.RMF_INVII.Flag_Scartato, dbo.RMF_INVII.Motivo_Scarto, dbo.RMF_INVII.Data_Inserimento, 
                      dbo.VIEW_RMF_LOG.EXCEPTION_NAME, dbo.VIEW_RMF_LOG.EXCEPTION_TEXT
FROM         dbo.RMF_INVII LEFT OUTER JOIN
                      dbo.VIEW_RMF_LOG ON RIGHT('000000000' + CONVERT(VARCHAR, dbo.RMF_INVII.nro_riga), 9) 
                      = dbo.VIEW_RMF_LOG.MODULE_MESSAGE_TEXT AND dbo.RMF_INVII.nome_file = dbo.VIEW_RMF_LOG.PARAMETER_VALUE
WHERE     (dbo.VIEW_RMF_LOG.EXCEPTION_NAME IS NOT NULL) AND (dbo.VIEW_RMF_LOG.EXCEPTION_TEXT IS NOT NULL)
GO
