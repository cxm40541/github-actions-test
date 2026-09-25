/****** Object:  View [dbo].[M1OffLine]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.M1OffLine    Script Date: 13/02/2002 15.45.16 ******/
CREATE view [dbo].[M1OffLine] as
select a.id_soggetto, a.id_piano , a.id_attivita, a.cod_avanzamento, substring(a.cod_appar,3,9) as apparecchio,
OffLine=
 case 
    when Convert(Char(10),a.fine,103)='01/01/1900' then ''
    when a.fine is null then ''
    else Convert(Char(10),a.fine,103)
  end
from stato_avanzamento a, piani b, legenda c
where id_record=6
and a.id_piano=b.id_piano
and a.cod_avanzamento=c.cod_avanzamento
and a.id_attivita=c.cod_attivita
and b.tipo_piano=c.tipo_piano
GO
