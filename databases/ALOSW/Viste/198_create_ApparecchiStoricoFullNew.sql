/****** Object:  View [dbo].[ApparecchiStoricoFullNew]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiStoricoFullNew] AS 
SELECT  Categoria, Tipo, IdLocale, TipoOggetto, TipoOggettoDesc, CodiceOggetto, Proprieta, Associato, matricola, Modello, identificativo, nullaosta, TM, idmove, IdStorico, IdPadre, DataDa, 
DataA, DataCreazione, fornitore, costruttore, IdMagazzino, Ordinamento, OrdinamentoCategoria  
FROM ApparecchiInstallati2  
UNION SELECT Categoria, Tipo, IdLocale, TipoOggetto, TipoOggettoDesc, CodiceOggetto, Proprieta, 
Associato, matricola, Modello, identificativo, nullaosta, TM, idmove, idstorico, IdPadre, DataDa, 
DataA, datacreazione, fornitore, costruttore, idmagazzino, Ordinamento, OrdinamentoCategoria 
FROM ApparecchiStorico2
GO
