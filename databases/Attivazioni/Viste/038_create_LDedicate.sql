/****** Object:  View [dbo].[LDedicate]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.LDedicate    Script Date: 13/02/2002 15.45.14 ******/
CREATE view [dbo].[LDedicate] as
select a.id_soggetto, a.id_piano, a.fine, substring(a.cod_appar,3,8) as appar,
b.tipo_piano
from stato_avanzamento a,
piani b, legenda c 
where a.id_piano=b.id_piano
and a.id_attivita=c.cod_attivita
and a.cod_avanzamento=c.cod_avanzamento
and c.id_record=3
and b.tipo_piano=c.tipo_piano
GO
