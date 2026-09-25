/****** Object:  View [dbo].[T6]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.T6    Script Date: 13/02/2002 15.45.20 ******/
CREATE view [dbo].[T6] as 
select a.id_piano, a.id_soggetto,a.fine,
  a.id_attivita, a.cod_avanzamento, a.progr_operazione,substring(a.cod_appar,3,9) as apparecchio,
  a.cod_appar,
flag_provv=case
    when d.flag_provv is null then  99
    else d.flag_provv
  end
, e.tipo_piano, f.id_record,
  b.lsr01a_cognome, b.lsr01a_nome, b.lsr01a_cod_amm,
  b.lsr01a_tab, b.lsr01a_tel_ricevitoria, b.lsr01a_tel_casa,
  b.lsr01a_indirizzo, b.lsr01a_cap, b.lsr01a_comune_ricev,
  b.lsr01a_prov_ricev,b.lsr01a_data_cessaz, b.lsr01a_stato,
  c.codor, c.sdlc, c.progr_terminale, c.lotto, c.data_ordine
from stato_avanzamento a left outer join p_sort d on a.id_soggetto=d.id_soggetto
  left outer join condiviso.dbo.lsr01a b on a.id_soggetto=b.lsr01a_key_id_ricev
  left outer join dbo.collegamenti_terminali c on (substring(a.cod_appar,3,9)=c.nter AND a.id_soggetto=c.id_lottomatica),
  piani as e, legenda as f
where  a.id_piano=e.id_piano
  and a.id_attivita=f.cod_attivita
  and a.cod_avanzamento=f.cod_avanzamento
  and e.tipo_piano=f.tipo_piano
  and f.id_record=4
GO
