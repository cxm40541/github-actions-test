/****** Object:  View [dbo].[SoggLeg]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.SoggLeg    Script Date: 13/02/2002 15.45.19 ******/
create view [dbo].[SoggLeg] as
select a.id_piano, a.id_soggetto, a.id_attivita, a.cod_avanzamento, a.fine, a.cod_appar,
  b.desc_piano,b.tipo_piano,
  c.id_record,
  d.flag_provv
from stato_avanzamento a left outer join p_sort d on (a.id_soggetto=d.id_soggetto), piani b, legenda c
where b.tipo_piano=c.tipo_piano
  and a.id_piano=b.id_piano  
  and a.id_attivita=c.cod_attivita
  and a.cod_avanzamento=c.cod_avanzamento
GO
