/****** Object:  View [dbo].[CodTerm]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.CodTerm    Script Date: 13/02/2002 15.45.14 ******/
CREATE view [dbo].[CodTerm] as
select a.id_piano, a.id_soggetto,
cod =
case  when d.cod_tipo_appar is null then CONVERT(char(2),0)
  else CONVERT(CHAR(2),d.cod_tipo_appar)
end 
 ,Descapp=
case when d.desc_tipo_appar is null then ''
  else d.desc_tipo_appar
end,
 a.id_attivita, a.cod_avanzamento, substring(a.cod_appar,3,9) as apparecchio,
 a.cod_appar,b.cod_amm, c.tipo_piano, c.note, substring(b.cod_amm,1,2) as prov
from stato_avanzamento as a
     LEFT OUTER JOIN TermDesc d on   (a.cod_appar=d.cod_appar and a.id_piano=d.id_piano) 
, soggetti_del_piano as b, piani as c
, legenda e --?
where a.id_piano=b.id_piano
 and a.id_soggetto=b.id_soggetto    
 and a.id_piano=c.id_piano
--?
 and e.tipo_piano=c.tipo_piano 
 and e.id_record=19 
 and a.id_attivita=e.cod_attivita
 and a.cod_avanzamento=e.cod_avanzamento 
 and substring(a.id_soggetto,2,1)<>'X'
--?
GO
