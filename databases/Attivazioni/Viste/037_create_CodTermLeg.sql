/****** Object:  View [dbo].[CodTermLeg]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.CodTermLeg    Script Date: 13/02/2002 15.45.14 ******/
CREATE view [dbo].[CodTermLeg] as
select a.id_piano, a.id_soggetto,a.fine,
  a.id_attivita, a.cod_avanzamento,a.progr_operazione, substring(RTrim(LTRIM(a.cod_appar)),3,9) as apparecchio,
  a.cod_appar,b.flag_provv, c.tipo_piano, d.id_record
from stato_avanzamento as a left outer join p_sort b on a.id_soggetto=b.id_soggetto,
  piani as c, legenda as d
where a.id_piano=c.id_piano
  and a.id_attivita=d.cod_attivita
  and a.cod_avanzamento=d.cod_avanzamento
  and c.tipo_piano=d.tipo_piano
  and d.id_record=10
GO
