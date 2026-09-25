/****** Object:  View [dbo].[ParchiInstallati]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ParchiInstallati]
AS
SELECT     move.locale AS CodiceLocale, move.percentuale AS [% Esercente], 'Mobili' AS TipoOggetto, move.mobile AS CodiceOggetto, mobili.prop AS Proprieta, 
                      mobili.agente AS Associato
FROM         move, mobili
WHERE     mobili.idmobile = move.mobile AND move.mobile > 0
UNION
SELECT     move.locale AS CodiceLocale, move.percentuale AS [% Esercente], 'Schede' AS TipoOggetto, move.scheda AS CodiceOggetto, 
                      schede.prop AS Proprieta, schede.agente AS Associato
FROM         move, schede
WHERE     schede.idscheda = move.scheda AND move.scheda > 0
UNION
SELECT     move.locale AS CodiceLocale, move.percentuale AS [% Esercente], 'Dedicati' AS TipoOggetto, move.dedicato AS CodiceOggetto, 
                      dedicati.prop AS Proprieta, dedicati.agente AS Associato
FROM         move, dedicati
WHERE     dedicati.iddedicato = move.dedicato AND move.dedicato > 0
UNION
SELECT     move.locale AS CodiceLocale, move.percentuale AS [% Esercente], 'Distributori' AS TipoOggetto, move.distributore AS CodiceOggetto, 
                      distribut.prop AS Proprieta, distribut.agente AS Associato
FROM         move, distribut
WHERE     distribut.iddistributore = move.distributore AND move.distributore > 0
GO
