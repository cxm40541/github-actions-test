/****** Object:  ForeignKey [FK_consuntivi_PIANI]    Script Date: 11/17/2025 15:21:53 ******/
ALTER TABLE [dbo].[CONSUNTIVI]  WITH CHECK ADD  CONSTRAINT [FK_consuntivi_PIANI] FOREIGN KEY([id_piano])
REFERENCES [dbo].[PIANI] ([ID_PIANO])
GO
ALTER TABLE [dbo].[CONSUNTIVI] CHECK CONSTRAINT [FK_consuntivi_PIANI]
GO
