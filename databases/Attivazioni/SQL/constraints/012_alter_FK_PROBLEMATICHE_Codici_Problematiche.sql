/****** Object:  ForeignKey [FK_PROBLEMATICHE_Codici_Problematiche]    Script Date: 11/17/2025 15:21:53 ******/
ALTER TABLE [dbo].[PROBLEMATICHE]  WITH CHECK ADD  CONSTRAINT [FK_PROBLEMATICHE_Codici_Problematiche] FOREIGN KEY([cod_problematica])
REFERENCES [dbo].[CODICI_PROBLEMATICHE] ([Cod_problematica])
GO
ALTER TABLE [dbo].[PROBLEMATICHE] CHECK CONSTRAINT [FK_PROBLEMATICHE_Codici_Problematiche]
GO
