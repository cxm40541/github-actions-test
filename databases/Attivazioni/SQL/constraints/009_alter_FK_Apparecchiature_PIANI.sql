/****** Object:  ForeignKey [FK_Apparecchiature_PIANI]    Script Date: 11/17/2025 15:21:53 ******/
ALTER TABLE [dbo].[APPARECCHIATURE]  WITH CHECK ADD  CONSTRAINT [FK_Apparecchiature_PIANI] FOREIGN KEY([id_piano])
REFERENCES [dbo].[PIANI] ([ID_PIANO])
GO
ALTER TABLE [dbo].[APPARECCHIATURE] CHECK CONSTRAINT [FK_Apparecchiature_PIANI]
GO
