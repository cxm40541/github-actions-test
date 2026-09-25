/****** Object:  View [dbo].[ViewSpostamenti2]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewSpostamenti2]
AS
SELECT     Spostamenti.IdSpostamento, dedicati.Nome AS AppoNome, 'Dedicato' AS AppoTipo, societa.ragionesociale, dedicati.matricola, dedicati.identificativo, 
                      dedicati.nullaosta, partipologiamonopoli.descrizionetm, societa.idsocieta, dedicati.iddedicato AS AppoId
FROM         ((dedicati LEFT JOIN
                      partipologiamonopoli ON partipologiamonopoli.idpartm = dedicati.partipologiamonopoli) INNER JOIN
                      spostamenti ON spostamenti.iddedicato = dedicati.iddedicato) INNER JOIN
                      societa ON societa.idsocieta = spostamenti.idsocieta
UNION
SELECT     Spostamenti.IdSpostamento, Mobili.Modello AS AppoNome, 'Mobile' AS AppoTipo, societa.ragionesociale, mobili.matricola, mobili.identificativo, 
                      mobili.nullaosta, partipologiamonopoli.descrizionetm, societa.idsocieta, mobili.idmobile AS AppoId
FROM         ((Mobili LEFT JOIN
                      partipologiamonopoli ON partipologiamonopoli.idpartm = mobili.partipologiamonopoli) INNER JOIN
                      spostamenti ON spostamenti.idmobile = mobili.idmobile) INNER JOIN
                      societa ON societa.idsocieta = spostamenti.idsocieta
GO
