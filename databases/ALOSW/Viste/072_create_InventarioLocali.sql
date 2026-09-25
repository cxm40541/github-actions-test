/****** Object:  View [dbo].[InventarioLocali]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InventarioLocali]
AS
SELECT     move.locale AS IdLocale, 0 AS TipoOggetto, move.mobile AS CodiceOggetto, mobili.prop AS Proprieta, mobili.agente AS Associato, mobili.matricola, 
                      mobili.modello AS Macchina
FROM         move, mobili
WHERE     mobili.idmobile = move.mobile AND move.mobile > 0
UNION
SELECT     move.locale AS IdLocale, 1 AS TipoOggetto, move.scheda AS CodiceOggetto, schede.prop AS Proprieta, schede.agente AS Associato, schede.matricola, 
                      schede.nome AS Macchina
FROM         move, schede
WHERE     schede.idscheda = move.scheda AND move.scheda > 0
UNION
SELECT     move.locale AS IdLocale, 2 AS TipoOggetto, move.dedicato AS CodiceOggetto, dedicati.prop AS Proprieta, dedicati.agente AS Associato, 
                      dedicati.matricola, dedicati.nome AS Macchina
FROM         move, dedicati
WHERE     dedicati.iddedicato = move.dedicato AND move.dedicato > 0
UNION
SELECT     move.locale AS IdLocale, 15 AS TipoOggetto, move.distributore AS CodiceOggetto, distribut.prop AS Proprieta, distribut.agente AS Associato, 
                      distribut.matricola, distribut.nome AS Macchina
FROM         move, distribut
WHERE     distribut.iddistributore = move.distributore AND move.distributore > 0
GO
