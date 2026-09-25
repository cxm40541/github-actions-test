/****** Object:  View [dbo].[T2]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.T2    Script Date: 13/02/2002 15.45.19 ******/
CREATE view [dbo].[T2] as 
select a.id_piano, a.id_soggetto,a.fine,
  a.id_attivita, a.cod_avanzamento, a.progr_operazione,a.apparecchio,
  a.cod_appar,
  flag_provv=case
    when a.flag_provv is null then  99
    else a.flag_provv
  end
, a.tipo_piano, a.id_record,
  b.lsr01a_cognome, b.lsr01a_nome, b.lsr01a_cod_amm,
  b.lsr01a_tab, b.lsr01a_tel_ricevitoria, b.lsr01a_tel_casa,
  b.lsr01a_indirizzo, b.lsr01a_cap, b.lsr01a_comune_ricev,
  b.lsr01a_prov_ricev,b.lsr01a_data_cessaz, b.lsr01a_stato,
  c.codor, c.sdlc, c.progr_terminale, c.lotto, c.data_ordine
from CodTermLeg a 
  left outer join condiviso.dbo.lsr01a b on a.id_soggetto=b.lsr01a_key_id_ricev  
  left outer join dbo.collegamenti_terminali c on a.apparecchio=c.nter 
where a.id_record=10
GO
