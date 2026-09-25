/****** Object:  View [dbo].[Rilasci]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.Rilasci    Script Date: 13/02/2002 15.45.19 ******/
cREATE view [dbo].[Rilasci] as 
select a.id_piano, a.id_soggetto,a.fine,
  a.id_attivita, a.cod_avanzamento, a.progr_operazione,substring(a.cod_appar,3,9) as apparecchio,
  a.cod_appar,e.tipo_piano, f.id_record
from stato_avanzamento a 
  ,piani as e, legenda as f
where  a.id_piano=e.id_piano
  and a.id_attivita=f.cod_attivita
  and a.cod_avanzamento=f.cod_avanzamento
  and e.tipo_piano=f.tipo_piano
  and f.id_record=4
GO
