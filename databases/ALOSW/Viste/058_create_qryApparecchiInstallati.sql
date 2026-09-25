/****** Object:  View [dbo].[qryApparecchiInstallati]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qryApparecchiInstallati] AS 
SELECT     'NSL' AS Categoria, 'New Slot' AS Tipo, dbo.Move.Locale AS IdLocale, 2 AS TipoOggetto, 'NSL' AS TipoOggettoDesc, dbo.Move.Dedicato AS CodiceOggetto, 
                      dbo.Dedicati.Prop AS Proprieta, dbo.Dedicati.Agente AS Associato, dbo.Dedicati.Matricola, dbo.Dedicati.Nome AS Modello, dbo.Dedicati.Identificativo, 
                      dbo.Dedicati.NullaOsta, 1 AS TM, dbo.Move.IdMove, NULL AS IdStorico, 0 AS IdPadre, dbo.Move.DataCambio AS DataDa, NULL AS DataA, dbo.Dedicati.DataCreazione, 
                      dbo.Dedicati.Fornitore, dbo.Dedicati.Costruttore, dbo.Dedicati.IdMagazzino, 0 AS Ordinamento, 0 AS OrdinamentoCategoria
FROM         dbo.Move INNER JOIN
                      dbo.Dedicati ON dbo.Move.Dedicato = dbo.Dedicati.IdDedicato
WHERE     (dbo.Dedicati.ParTipologiaMonopoli = 1) AND (dbo.Move.Dedicato > 0)
UNION
SELECT     'C7A' AS Categoria, 'Gioco' AS Tipo, Move_8.Locale AS IdLocale, 2 AS TipoOggetto, 'GIO' AS TipoOggettoDesc, Move_8.Dedicato AS CodiceOggetto, 
                      Dedicati_3.Prop AS Proprieta, Dedicati_3.Agente AS Associato, Dedicati_3.Matricola, Dedicati_3.Nome AS Modello, Dedicati_3.Identificativo, Dedicati_3.NullaOsta, 
                      Dedicati_3.ParTipologiaMonopoli AS TM, Move_8.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_8.DataCambio AS DataDa, NULL AS DataA, 
                      Dedicati_3.DataCreazione, Dedicati_3.Fornitore, Dedicati_3.Costruttore, Dedicati_3.IdMagazzino, 1 AS Ordinamento, 1 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_8 INNER JOIN
                      dbo.Dedicati AS Dedicati_3 ON Move_8.Dedicato = Dedicati_3.IdDedicato
WHERE     (Dedicati_3.ParTipologiaMonopoli = 2) AND (Move_8.Dedicato > 0)
UNION
SELECT     'C7C' AS Categoria, 'Gioco' AS Tipo, Move_7.Locale AS IdLocale, 2 AS TipoOggetto, 'GIO' AS TipoOggettoDesc, Move_7.Dedicato AS CodiceOggetto, 
                      Dedicati_2.Prop AS Proprieta, Dedicati_2.Agente AS Associato, Dedicati_2.Matricola, Dedicati_2.Nome AS Modello, Dedicati_2.Identificativo, Dedicati_2.NullaOsta, 
                      Dedicati_2.ParTipologiaMonopoli AS TM, Move_7.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_7.DataCambio AS DataDa, NULL AS DataA, 
                      Dedicati_2.DataCreazione, Dedicati_2.Fornitore, Dedicati_2.Costruttore, Dedicati_2.IdMagazzino, 1 AS Ordinamento, 2 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_7 INNER JOIN
                      dbo.Dedicati AS Dedicati_2 ON Move_7.Dedicato = Dedicati_2.IdDedicato
WHERE     (Dedicati_2.ParTipologiaMonopoli = 4) AND (Move_7.Dedicato > 0)
UNION
SELECT     'MEC' AS Categoria, 'Gioco' AS Tipo, Move_6.Locale AS IdLocale, 2 AS TipoOggetto, 'GIO' AS TipoOggettoDesc, Move_6.Dedicato AS CodiceOggetto, 
                      Dedicati_1.Prop AS Proprieta, Dedicati_1.Agente AS Associato, Dedicati_1.Matricola, Dedicati_1.Nome AS Modello, Dedicati_1.Identificativo, Dedicati_1.NullaOsta, 
                      Dedicati_1.ParTipologiaMonopoli AS TM, Move_6.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_6.DataCambio AS DataDa, NULL AS DataA, 
                      Dedicati_1.DataCreazione, Dedicati_1.Fornitore, Dedicati_1.Costruttore, Dedicati_1.IdMagazzino, 1 AS Ordinamento, 3 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_6 INNER JOIN
                      dbo.Dedicati AS Dedicati_1 ON Move_6.Dedicato = Dedicati_1.IdDedicato
WHERE     (Dedicati_1.ParTipologiaMonopoli > 4 OR
                      Dedicati_1.ParTipologiaMonopoli IS NULL) AND (Move_6.Dedicato > 0)
UNION
SELECT     'NSL' AS Categoria, 'Mobile' AS Tipo, Move_5.Locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, Move_5.Mobile AS CodiceOggetto, 
                      dbo.Mobili.Prop AS Proprieta, dbo.Mobili.Agente AS Associato, dbo.Mobili.Matricola, dbo.Mobili.Modello, dbo.Mobili.Identificativo, dbo.Mobili.NullaOsta, 
                      dbo.Mobili.ParTipologiaMonopoli AS TM, Move_5.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_5.DataCambio AS DataDa, NULL AS DataA, 
                      dbo.Mobili.DataCreazione, dbo.Mobili.Fornitore, dbo.Mobili.Costruttore, dbo.Mobili.IdMagazzino, 2 AS Ordinamento, 0 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_5 INNER JOIN
                      dbo.Mobili ON Move_5.Mobile = dbo.Mobili.IdMobile
WHERE     (Move_5.Mobile > 0) AND (dbo.Mobili.ParTipologiaMonopoli = 1)
UNION
SELECT     'C7A' AS Categoria, 'Mobile' AS Tipo, Move_4.Locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, Move_4.Mobile AS CodiceOggetto, 
                      Mobili_3.Prop AS Proprieta, Mobili_3.Agente AS Associato, Mobili_3.Matricola, Mobili_3.Modello, Mobili_3.Identificativo, Mobili_3.NullaOsta, 
                      Mobili_3.ParTipologiaMonopoli AS TM, Move_4.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_4.DataCambio AS DataDa, NULL AS DataA, Mobili_3.DataCreazione, 
                      Mobili_3.Fornitore, Mobili_3.Costruttore, Mobili_3.IdMagazzino, 2 AS Ordinamento, 1 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_4 INNER JOIN
                      dbo.Mobili AS Mobili_3 ON Move_4.Mobile = Mobili_3.IdMobile
WHERE     (Move_4.Mobile > 0) AND (Mobili_3.ParTipologiaMonopoli = 2)
UNION
SELECT     'C7C' AS Categoria, 'Mobile' AS Tipo, Move_3.Locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, Move_3.Mobile AS CodiceOggetto, 
                      Mobili_2.Prop AS Proprieta, Mobili_2.Agente AS Associato, Mobili_2.Matricola, Mobili_2.Modello, Mobili_2.Identificativo, Mobili_2.NullaOsta, 
                      Mobili_2.ParTipologiaMonopoli AS TM, Move_3.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_3.DataCambio AS DataDa, NULL AS DataA, Mobili_2.DataCreazione, 
                      Mobili_2.Fornitore, Mobili_2.Costruttore, Mobili_2.IdMagazzino, 2 AS Ordinamento, 2 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_3 INNER JOIN
                      dbo.Mobili AS Mobili_2 ON Move_3.Mobile = Mobili_2.IdMobile
WHERE     (Move_3.Mobile > 0) AND (Mobili_2.ParTipologiaMonopoli = 4)
UNION
SELECT     'MEC' AS Categoria, 'Mobile' AS Tipo, Move_2.Locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, Move_2.Mobile AS CodiceOggetto, 
                      Mobili_1.Prop AS Proprieta, Mobili_1.Agente AS Associato, Mobili_1.Matricola, Mobili_1.Modello, Mobili_1.Identificativo, Mobili_1.NullaOsta, 
                      Mobili_1.ParTipologiaMonopoli AS TM, Move_2.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_2.DataCambio AS DataDa, NULL AS DataA, Mobili_1.DataCreazione, 
                      Mobili_1.Fornitore, Mobili_1.Costruttore, Mobili_1.IdMagazzino, 2 AS Ordinamento, 3 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_2 INNER JOIN
                      dbo.Mobili AS Mobili_1 ON Move_2.Mobile = Mobili_1.IdMobile
WHERE     (Move_2.Mobile > 0) AND (Mobili_1.ParTipologiaMonopoli > 4 OR
                      Mobili_1.ParTipologiaMonopoli IS NULL)
UNION
SELECT     'SCH' AS Categoria, 'Scheda' AS Tipo, FirstMove.Locale AS IdLocale, 1 AS TipoOggetto, 'SCH' AS TipoOggettoDesc, FirstMove.Scheda AS CodiceOggetto, 
                      dbo.Schede.Prop AS Proprieta, dbo.Schede.Agente AS Associato, dbo.Schede.Matricola, dbo.Schede.Nome AS Modello, '' AS identificativo, '' AS nullaosta, NULL 
                      AS TM, FirstMove.IdMove, NULL AS IdStorico,
                          (SELECT     Mobile
                            FROM          dbo.Move AS SecondMove
                            WHERE      (IdMove = FirstMove.MovimentoRif)) AS IdPadre, FirstMove.DataCambio AS DataDa, NULL AS DataA, dbo.Schede.DataCreazione, dbo.Schede.Fornitore, 
                      dbo.Schede.Costruttore, dbo.Schede.IdMagazzino, 3 AS Ordinamento, 4 AS OrdinamentoCategoria
FROM         dbo.Move AS FirstMove INNER JOIN
                      dbo.Schede ON FirstMove.Scheda = dbo.Schede.IdScheda
WHERE     (FirstMove.Scheda > 0)
UNION
SELECT     'DIS' AS Categoria, 'Distributore' AS Tipo, Move_1.Locale AS IdLocale, 15 AS TipoOggetto, 'DIS' AS TipoOggettoDesc, Move_1.Distributore AS CodiceOggetto, 
                      dbo.Distribut.Prop AS Proprieta, dbo.Distribut.Agente AS Associato, dbo.Distribut.Matricola, dbo.Distribut.Nome AS Modello, '' AS identificativo, '' AS nullaosta, NULL 
                      AS TM, Move_1.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move_1.DataCambio AS DataDa, NULL AS DataA, dbo.Distribut.DataCreazione, dbo.Distribut.Fornitore, 
                      dbo.Distribut.Costruttore, dbo.Distribut.IdMagazzino, 4 AS Ordinamento, 5 AS OrdinamentoCategoria
FROM         dbo.Move AS Move_1 INNER JOIN
                      dbo.Distribut ON Move_1.Distributore = dbo.Distribut.IdDistributore
WHERE     (Move_1.Distributore > 0)
GO
