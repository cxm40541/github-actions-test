/****** Object:  Default [DF_Ricambi_bTemporaneo]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[Ricambi] ADD  CONSTRAINT [DF_Ricambi_bTemporaneo]  DEFAULT (0) FOR [bTemporaneo]
GO
