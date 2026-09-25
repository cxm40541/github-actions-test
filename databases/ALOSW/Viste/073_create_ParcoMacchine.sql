/****** Object:  View [dbo].[ParcoMacchine]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ParcoMacchine]
AS
SELECT     1 AS TipoOggetto, move.scheda AS CodiceOggetto, schede.nome AS macchina, schede.prop AS Proprieta, schede.agente AS Associato, 
                      schede.matricola, schede.idmagazzino AS Magazzino, move.locale, move.movimentorif
FROM         move, schede
WHERE     schede.idscheda = move.scheda AND move.scheda > 0
UNION
SELECT     2 AS TipoOggetto, move.dedicato AS CodiceOggetto, dedicati.nome AS macchina, dedicati.prop AS Proprieta, dedicati.agente AS Associato, 
                      dedicati.matricola, idmagazzino AS Magazzino, move.locale, 0 AS movimentorif
FROM         move, dedicati
WHERE     dedicati.iddedicato = move.dedicato AND move.dedicato > 0
UNION
SELECT     15 AS TipoOggetto, move.distributore AS CodiceOggetto, distribut.nome AS macchina, distribut.prop AS Proprieta, distribut.agente AS Associato, 
                      distribut.matricola, distribut.idmagazzino AS Magazzino, move.locale, 0 AS movimentorif
FROM         move, distribut
WHERE     distribut.iddistributore = move.distributore AND move.distributore > 0
GO
