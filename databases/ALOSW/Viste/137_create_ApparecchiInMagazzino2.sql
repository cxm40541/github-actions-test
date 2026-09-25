/****** Object:  View [dbo].[ApparecchiInMagazzino2]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiInMagazzino2]
AS
SELECT     'Scheda' AS Tipo, 'SCH' AS TipoOggettoDesc, 1 AS TipoOggetto, idscheda AS CodiceOggetto, nome AS macchina, prop AS Proprieta, '' AS identificativo, 
                      '' AS nullaosta, agente AS Associato, matricola, idmagazzino AS Magazzino, 3 AS Ordinamento
FROM         schede
WHERE     datafine IS NULL AND idscheda NOT IN
                          (SELECT     scheda
                            FROM          move
                            WHERE      scheda = schede.idscheda)
UNION
SELECT     'New Slot' AS Tipo, 'NSL' AS TipoOggettoDesc, 2 AS TipoOggetto, iddedicato AS CodiceOggetto, nome AS macchina, prop AS Proprieta, 
                      dedicati.identificativo, dedicati.nullaosta, agente AS Associato, matricola, idmagazzino AS Magazzino, 0 AS Ordinamento
FROM         dedicati
WHERE     datafine IS NULL AND iddedicato NOT IN
                          (SELECT     dedicato
                            FROM          move
                            WHERE      dedicato = dedicati.iddedicato) AND Partipologiamonopoli = 1
UNION
SELECT     'Gioco' AS Tipo, 'GIO' AS TipoOggettoDesc, 2 AS TipoOggetto, iddedicato AS CodiceOggetto, nome AS macchina, prop AS Proprieta, 
                      dedicati.identificativo, dedicati.nullaosta, agente AS Associato, matricola, idmagazzino AS Magazzino, 1 AS Ordinamento
FROM         dedicati
WHERE     datafine IS NULL AND iddedicato NOT IN
                          (SELECT     dedicato
                            FROM          move
                            WHERE      dedicato = dedicati.iddedicato) AND (Partipologiamonopoli <> 1 OR
                      partipologiamonopoli IS NULL)
UNION
SELECT     'Distributore' AS Tipo, 'DIS' AS TipoOggettoDesc, 15 AS TipoOggetto, iddistributore AS CodiceOggetto, nome AS macchina, prop AS Proprieta, 
                      '' AS identificativo, '' AS nullaosta, agente AS Associato, matricola, idmagazzino AS Magazzino, 4 AS Ordinamento
FROM         distribut
WHERE     datafine IS NULL AND iddistributore NOT IN
                          (SELECT     distributore
                            FROM          move
                            WHERE      distributore = distribut.iddistributore)
UNION
SELECT     'Mobile' AS Tipo, 'MOB' AS TipoOggettoDesc, 0 AS TipoOggetto, idmobile AS CodiceOggetto, modello AS macchina, prop AS Proprieta, 
                      mobili.identificativo, mobili.nullaosta, agente AS Associato, matricola, idmagazzino AS Magazzino, 2 AS Ordinamento
FROM         mobili
WHERE     datafine IS NULL AND idmobile NOT IN
                          (SELECT     mobile
                            FROM          move
                            WHERE      mobile = mobili.idmobile)
UNION
SELECT     'Accessorio' AS Tipo, 'ACC' AS TipoOggettoDesc, 3 AS TipoOggetto, IdAccessorio AS CodiceOggetto, Nome AS macchina, prop AS Proprieta, 
                      '' AS identificativo, '' AS nullaosta, '' AS Associato, matricola, idmagazzino AS Magazzino, 5 AS Ordinamento
FROM         Accessori
WHERE     IdAccessorio NOT IN
                          (SELECT     Accessorio
                            FROM          move
                            WHERE      accessorio = accessori.idaccessorio)
GO
