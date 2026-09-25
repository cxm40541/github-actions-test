/****** Object:  View [dbo].[NomiMacchine2]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NomiMacchine2] AS  SELECT 1 AS TipoOggetto,idscheda AS CodiceOggetto,Nome AS NomeOggetto, Matricola AS MatricolaOggetto FROM schede UNION SELECT 2 AS TipoOggetto,iddedicato AS CodiceOggetto,Nome AS NomeOggetto, Matricola AS MatricolaOggetto FROM dedicati UNION SELECT 15 AS TipoOggetto,iddistributore AS CodiceOggetto,Nome AS NomeOggetto, Matricola AS MatricolaOggetto FROM distribut union select 20 as TipoOggetto, 0 as codiceoggetto, 'Sconto' as nomeoggetto, 'Sconto' as matricolaOggetto From incassi where incassi.tipooggetto = 20
GO
