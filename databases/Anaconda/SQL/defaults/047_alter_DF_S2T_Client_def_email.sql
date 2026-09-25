/****** Object:  Default [DF_S2T_Client_def_email]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[S2T_Client] ADD  CONSTRAINT [DF_S2T_Client_def_email]  DEFAULT ([dbo].[S2T_ValoreDefault]('email')) FOR [def_email]
GO
