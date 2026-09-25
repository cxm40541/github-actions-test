/****** Object:  View [dbo].[DedOComm]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.DedOComm    Script Date: 13/02/2002 15.45.14 ******/
CREATE view [dbo].[DedOComm] as
select DISTINCT(a.id_soggetto), a.id_piano, a.fine
from stato_avanzamento a left outer join p_sort d on (a.id_soggetto=d.id_soggetto), piani b, legenda c
where b.tipo_piano=c.tipo_piano
  and a.id_piano=b.id_piano  
  and a.id_attivita=c.cod_attivita
  and a.cod_avanzamento=c.cod_avanzamento
  and (c.id_record=2 or c.id_record=3)
and CONVERT(char(10),a.fine,103)+LTRIM(RTRIM(a.id_soggetto))+LTRIM(RTRIM(a.id_piano))
in (
select CONVERT(char(10),(Min(a.fine)),103)+LTRIM(RTRIM(a.id_soggetto))+LTRIM(RTRIM(a.id_piano))
from 
  stato_avanzamento a, piani b, legenda c
where b.tipo_piano=c.tipo_piano
  and a.id_piano=b.id_piano  
  and a.id_attivita=c.cod_attivita
  and a.cod_avanzamento=c.cod_avanzamento
  and (c.id_record=2 or c.id_record=3)
  and CONVERT(char(10),a.fine,103)<>'01/01/1900'
group by a.id_piano, a.id_soggetto)
group by a.id_piano, a.id_soggetto,a.fine
GO
