/****** Object:  View [dbo].[ParchiTotali]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ParchiTotali]
AS
SELECT     'Mobili Totali' AS TipoOggetto, IdMobile AS CodiceOggetto, prop AS Proprieta, agente AS Associato
FROM         mobili
WHERE     DataFine IS NULL
UNION
SELECT     'Schede Totali' AS TipoOggetto, IdScheda AS CodiceOggetto, prop AS Proprieta, agente AS Associato
FROM         Schede
WHERE     DataFine IS NULL
UNION
SELECT     'Dedicati Totali' AS TipoOggetto, IdDedicato AS CodiceOggetto, prop AS Proprieta, agente AS Associato
FROM         Dedicati
WHERE     DataFine IS NULL
UNION
SELECT     'Distributori Totali' AS TipoOggetto, IdDistributore AS CodiceOggetto, prop AS Proprieta, agente AS Associato
FROM         distribut
WHERE     DataFine IS NULL
UNION
SELECT     'Mobili Installati' AS TipoOggetto, move.mobile AS CodiceOggetto, mobili.prop AS Proprieta, mobili.agente AS Associato
FROM         move, mobili
WHERE     mobili.idmobile = move.mobile AND move.mobile > 0
UNION
SELECT     'Schede Installate' AS TipoOggetto, move.scheda AS CodiceOggetto, schede.prop AS Proprieta, schede.agente AS Associato
FROM         move, schede
WHERE     schede.idscheda = move.scheda AND move.scheda > 0
UNION
SELECT     'Dedicati Installati' AS TipoOggetto, move.dedicato AS CodiceOggetto, dedicati.prop AS Proprieta, dedicati.agente AS Associato
FROM         move, dedicati
WHERE     dedicati.iddedicato = move.dedicato AND move.dedicato > 0
UNION
SELECT     'Distributori Installati' AS TipoOggetto, move.distributore AS CodiceOggetto, distribut.prop AS Proprieta, distribut.agente AS Associato
FROM         move, distribut
WHERE     distribut.iddistributore = move.distributore AND move.distributore > 0
GO
