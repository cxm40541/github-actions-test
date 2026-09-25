/****** Object:  Default [DF_S2T_movimenti_giornalieri_tipo_operazione]    Script Date: 11/17/2025 15:18:29 ******/
ALTER TABLE [dbo].[S2T_movimenti_giornalieri] ADD  CONSTRAINT [DF_S2T_movimenti_giornalieri_tipo_operazione]  DEFAULT (0) FOR [tipo_operazione]
GO
