/****** Object:  Default [DF_SpeseEsattori_Verificato]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[SpeseEsattori] ADD  CONSTRAINT [DF_SpeseEsattori_Verificato]  DEFAULT (0) FOR [Verificato]
GO
