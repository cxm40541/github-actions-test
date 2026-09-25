/****** Object:  View [dbo].[ViewLastContDistr]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewLastContDistr] AS SELECT * FROM ( SELECT distribut.iddistributore AS MYID, 'Distributore' AS Tipologia, distribut.Nome, distribut.Matricola, move.contatore1, move.contatore2, move.contatore3, move.contatore4, locali.nome as NomeLocale, ditte.nome as Associato, (SELECT Max(data) FROM Incassi WHERE Incassi.codiceoggetto = Move.distributore AND Incassi.TipoOggetto = 15) AS DataIncasso FROM ((move INNER JOIN distribut ON move.distributore = distribut.Iddistributore) left join locali on locali.idlocale = move.locale) left join ditte on ditte.idagente=distribut.agente Where distribut.DataFine Is Null Union SELECT distribut.iddistributore AS MYID, 'Distributore' AS Tipologia, distribut.nome, distribut.matricola, relcontatori.contatore1,relcontatori.contatore2, relcontatori.contatore3, relcontatori.contatore4, 'Magazzino' as NomeLocale, ditte.nome as Associato, (SELECT Max(data) FROM Incassi WHERE Incassi.codiceoggetto = distribut.Iddistributore AND Incassi.TipoOggetto = 15 ) AS DataIncasso FROM (
distribut LEFT JOIN relcontatori ON relcontatori.id = distribut.Iddistributore) left join ditte on ditte.idagente=distribut.agente WHERE relcontatori.tipo =15 AND distribut.iddistributore NOT IN (SELECT Move.distributore FROM Move WHERE move.distributore=distribut.iddistributore) AND distribut.DataFine IS NULL ) as pippo Where 1 = 1
GO
