/****** Object:  Default [DF_S2T_movimenti_giornalieri_carta]    Script Date: 11/17/2025 15:18:29 ******/
ALTER TABLE [dbo].[S2T_movimenti_giornalieri] ADD  CONSTRAINT [DF_S2T_movimenti_giornalieri_carta]  DEFAULT (0) FOR [carta]
GO
