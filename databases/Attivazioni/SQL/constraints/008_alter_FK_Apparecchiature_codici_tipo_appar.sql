/****** Object:  ForeignKey [FK_Apparecchiature_codici_tipo_appar]    Script Date: 11/17/2025 15:21:53 ******/
ALTER TABLE [dbo].[APPARECCHIATURE]  WITH CHECK ADD  CONSTRAINT [FK_Apparecchiature_codici_tipo_appar] FOREIGN KEY([cod_tipo_appar])
REFERENCES [dbo].[CODICI_TIPO_APPAR] ([cod_tipo_appar])
GO
ALTER TABLE [dbo].[APPARECCHIATURE] CHECK CONSTRAINT [FK_Apparecchiature_codici_tipo_appar]
GO
