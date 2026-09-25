/****** Object:  View [dbo].[Commutate]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.Commutate    Script Date: 13/02/2002 15.45.14 ******/
CREATE view [dbo].[Commutate] as
select DISTINCT(a.id_piano), a.id_soggetto, a.fine,substring(a.cod_appar,3,9) as apparecchio
from stato_avanzamento a,
piani b,
legenda c
where a.id_piano=b.id_piano
and b.tipo_piano=c.tipo_piano
and a.id_attivita=c.cod_attivita
and a.cod_avanzamento=c.cod_avanzamento
and id_record=2
GO
