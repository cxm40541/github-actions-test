/****** Object:  View [dbo].[M1]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.M1    Script Date: 13/02/2002 15.45.16 ******/
CREATE view [dbo].[M1] as
select a.id_piano, a.id_soggetto,a.fine,
  a.id_attivita, a.cod_avanzamento,a.progr_operazione, substring(RTrim(LTRIM(a.cod_appar)),3,9) as apparecchio,
  a.cod_appar,flag_provv=case
    when b.flag_provv is null then  99
    else b.flag_provv
  end
, c.tipo_piano, d.id_record,
  f.lsr01a_cognome,f.lsr01a_nome,
  f.lsr01a_cod_amm,f.lsr01a_tab,f.lsr01a_tel_ricevitoria,f.lsr01a_tel_casa,
  f.lsr01a_indirizzo,f.lsr01a_cap,f.lsr01a_comune_ricev,f.lsr01a_prov_ricev,f.lsr01a_flag_esercizio,
  f.lsr01a_data_cessaz,f.lsr01a_stato,g.codor,g.sdlc,g.progr_terminale,
  Rifiuti1=case
    when Rifiuti is null then 0
    else rifiuti
  end
from stato_avanzamento as a left outer join p_sort b on a.id_soggetto=b.id_soggetto
  left outer join condiviso.dbo.lsr01a f on a.id_soggetto=f.lsr01a_key_id_ricev
  left outer join dbo.collegamenti_terminali g on substring(RTrim(LTRIM(a.cod_appar)),3,9)=g.nter and a.id_soggetto=g.id_lottomatica
  LEFT OUTER JOIN Rifiuti h ON
 (a.id_piano=h.r_id_piano
 and a.id_soggetto=h.r_id_soggetto),
  piani as c, legenda as d
where a.id_piano=c.id_piano
  and a.id_attivita=d.cod_attivita
  and a.cod_avanzamento=d.cod_avanzamento
  and c.tipo_piano=d.tipo_piano
  and d.id_record=19
GO
