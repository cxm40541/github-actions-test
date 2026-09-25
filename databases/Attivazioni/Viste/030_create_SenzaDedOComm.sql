/****** Object:  View [dbo].[SenzaDedOComm]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.SenzaDedOComm    Script Date: 13/02/2002 15.45.19 ******/
create view [dbo].[SenzaDedOComm] as
select DISTINCT(a.id_piano), a.id_soggetto
from stato_avanzamento a,
piani b,
legenda c
,condiviso.dbo.lsr01a d
where a.id_piano=b.id_piano
and b.tipo_piano=c.tipo_piano
and a.id_attivita=c.cod_attivita
and a.cod_avanzamento=c.cod_avanzamento
and id_record=2
and a.id_soggetto=d.lsr01a_key_id_ricev
and CONVERT(char(10),a.fine,103)='01/01/1900'
and a.id_soggetto in (
select a.id_soggetto
from stato_avanzamento a
,piani b,
legenda c
where a.id_piano=b.id_piano
and b.tipo_piano=c.tipo_piano
and a.id_attivita=c.cod_attivita
and a.cod_avanzamento=c.cod_avanzamento
and id_record=3
and CONVERT(char(10),a.fine,103)='01/01/1900'
)
GO
