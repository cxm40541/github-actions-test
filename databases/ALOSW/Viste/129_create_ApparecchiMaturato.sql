/****** Object:  View [dbo].[ApparecchiMaturato]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiMaturato] AS SELECT 'NSL' AS Categoria, 'New Slot' AS Tipo, Move.Locale AS IdLocale, 2 AS TipoOggetto,  
 'NSL' AS TipoOggettoDesc, Move.Dedicato AS CodiceOggetto, dedicati.Prop AS Proprieta,  
 dedicati.Agente AS Associato, dedicati.Matricola, dedicati.Nome AS Modello, dedicati.Identificativo,  dedicati.NullaOsta, 1 AS TM, Move.IdMove, NULL AS IdStorico, 0 AS IdPadre, Move.DataCambio AS DataDa,  NULL AS DataA, dedicati.DataCreazione, dedicati.Fornitore, dedicati.Costruttore, dedicati.IdMagazzino, 0 AS Ordinamento, 0 AS OrdinamentoCategoria, dedicati.Genere AS TipoMobile, ParTipoScheda.TextTS AS TipoScheda, Move.contatore1 AS InstCont1, Move.contatore2 AS InstCont2, Move.contatore3 AS InstCont3, Move.contatore4 AS InstCont4 FROM (Move INNER JOIN dedicati ON dedicati.IdDedicato = Move.Dedicato) LEFT OUTER JOIN ParTipoScheda ON ParTipoScheda.IdParTS = dedicati.ParTipoScheda Where (dedicati.ParTipologiaMonopoli = 1) And (Move.Dedicato > 0)
GO
