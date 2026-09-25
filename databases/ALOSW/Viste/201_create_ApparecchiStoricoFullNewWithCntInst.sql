/****** Object:  View [dbo].[ApparecchiStoricoFullNewWithCntInst]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiStoricoFullNewWithCntInst] AS SELECT 
case when (idincasso = 0 and idInstMove = 0) then CASE WHEN (SELECT top 1 contatore1 from incassi i where i.CodiceOggetto = ciccio.CodiceOggetto and i.CodiceLocale = ciccio.IdLocale and i.data < ciccio.DataA order by data desc) is null then 0 else (SELECT top 1 contatore1 from incassi i where i.CodiceOggetto = ciccio.CodiceOggetto and i.CodiceLocale = ciccio.IdLocale and i.data < ciccio.DataA order by data desc) END else 0 end as cntInstMag1, 
case when (idincasso = 0 and idInstMove = 0) then CASE WHEN (SELECT top 1 Contatore2 from incassi i where i.CodiceOggetto = ciccio.CodiceOggetto and i.CodiceLocale = ciccio.IdLocale and i.data < ciccio.DataA order by data desc) IS NULL then 0 else (SELECT top 1 Contatore2 from incassi i where i.CodiceOggetto = ciccio.CodiceOggetto and i.CodiceLocale = ciccio.IdLocale and i.data < ciccio.DataA order by data desc) end else 0 end as cntInstMag2, 
case when (idincasso = 0 and idInstMove = 0) then CASE WHEN (SELECT top 1 idincasso from incassi i where i.CodiceOggetto = ciccio.CodiceOggetto and i.CodiceLocale = ciccio.IdLocale and i.data < ciccio.DataA order by data desc) IS NULL then 0 else (SELECT top 1 idincasso from incassi i where i.CodiceOggetto = ciccio.CodiceOggetto and i.CodiceLocale = ciccio.IdLocale and i.data < ciccio.DataA order by data desc) end else 0 end as IdLastIncMAG, 
(SELECT top 1 c.nomeconcessionario FROM incassi i LEFT JOIN appoincassi m on i.idincasso = m.idincasso LEFT JOIN Concessionari c on c.idconcessionario = m.IdConcessionario WHERE i.CodiceOggetto = ciccio.CodiceOggetto and i.CodiceLocale = ciccio.IdLocale AND i.data >= DataDa and TipoOggetto = 2) as ConcMAG, 
ciccio.* 
FROM ( 
SELECT 
case when idincasso = 0 then case when idmove is null then 0 else idmove end else 0 end as idInstMove, 
case when idincasso = 0 then CASE WHEN (select contatore1 from move where idmove = pino5.idmove) IS NULL THEN 0 ELSE (select contatore1 from move where idmove = pino5.idmove) END else 0 end as cntinstMove1, 
case when idincasso = 0 then CASE WHEN (select contatore2 from move where idmove = pino5.idmove) IS NULL THEN 0 ELSE (select contatore2 from move where idmove = pino5.idmove) END else 0 end as cntInstMove2, 
(SELECT nomeconcessionario from dedicati d LEFT JOIN Concessionari c ON d.IdConcessionario = c.idconcessionario WHERE  d.IdDedicato = Pino5.CodiceOggetto and TipoOggetto = 2) as ConcMOVE, 
pino5.* 
FROM ( 
Select 
CASE WHEN (Select top 1 idincasso FROM incassi i WHERE i.CodiceOggetto = apparecchistoricofullnew.CodiceOggetto and i.CodiceLocale = ApparecchiStoricoFullNew.IdLocale AND i.data >= DataDa) IS NULL THEN 0 ELSE (Select top 1 idincasso FROM incassi i WHERE i.CodiceOggetto = apparecchistoricofullnew.CodiceOggetto and i.CodiceLocale = ApparecchiStoricoFullNew.IdLocale AND i.data >= DataDa) END as idincasso, 
CASE WHEN (Select top 1 (Contatore1 - TotaleEntrate) FROM incassi i WHERE i.CodiceOggetto = apparecchistoricofullnew.CodiceOggetto and i.CodiceLocale = ApparecchiStoricoFullNew.IdLocale AND i.data >= DataDa order by data ) IS NULL THEN 0 ELSE (Select top 1 (Contatore1 - TotaleEntrate) FROM incassi i WHERE i.CodiceOggetto = apparecchistoricofullnew.CodiceOggetto and i.CodiceLocale = ApparecchiStoricoFullNew.IdLocale AND i.data >= DataDa order by data ) END as cntInst1, 
CASE WHEN (Select top 1 (Contatore2 - TotaleUscite) FROM incassi i WHERE i.CodiceOggetto = apparecchistoricofullnew.CodiceOggetto and i.CodiceLocale = ApparecchiStoricoFullNew.IdLocale AND i.data >= DataDa order by data) IS NULL THEN 0 ELSE (Select top 1 (Contatore2 - TotaleUscite) FROM incassi i WHERE i.CodiceOggetto = apparecchistoricofullnew.CodiceOggetto and i.CodiceLocale = ApparecchiStoricoFullNew.IdLocale AND i.data >= DataDa order by data) END as cntInst2, 
(SELECT top 1 c.nomeconcessionario FROM incassi i LEFT JOIN appoincassi m on i.idincasso = m.idincasso LEFT JOIN Concessionari c on c.idconcessionario = m.IdConcessionario WHERE i.CodiceOggetto = apparecchistoricofullnew.CodiceOggetto and i.CodiceLocale = ApparecchiStoricoFullNew.IdLocale AND i.data >= DataDa and TipoOggetto = 2) as ConcINC, 
apparecchistoricofullnew.*,locali.nome, Locali.Codice, Locali.Ind_Comune 
From apparecchistoricofullnew, Locali 
Where apparecchistoricofullnew.IdLocale = Locali.IdLocale 
) as Pino5 
) as ciccio
GO
