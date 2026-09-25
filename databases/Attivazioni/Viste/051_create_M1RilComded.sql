/****** Object:  View [dbo].[M1RilComded]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.M1RilComded    Script Date: 13/02/2002 15.45.18 ******/
CREATE view [dbo].[M1RilComded] as
select M1.id_piano,M1.id_soggetto,M1.apparecchio,M1.progr_operazione,M1.fine,M1.flag_provv,
  M1.lsr01a_cognome,M1.lsr01a_nome,
  M1.lsr01a_cod_amm,M1.lsr01a_tab,M1.lsr01a_tel_ricevitoria,M1.lsr01a_tel_casa,
  M1.lsr01a_indirizzo,M1.lsr01a_cap,M1.lsr01a_comune_ricev,M1.lsr01a_prov_ricev,M1.lsr01a_flag_esercizio,
  M1.lsr01a_data_cessaz,M1.lsr01a_stato,M1.codor,M1.sdlc,M1.progr_terminale,
  data_rilascio=  case 
    when Convert(Char(10),g.fine,103)='01/01/1900' then''
    when g.fine is null then ''
    else Convert(Char(10),g.fine,103)
  end,
commutata=case
  when Convert(Char(10),e.fine,103)='01/01/1900' then''
  when e.fine is null then ''
  else Convert(Char(10),e.fine,103)
end,
Dedicata=case
 when Convert(Char(10),a.fine,103)='01/01/1900' then''
  when a.fine is null then ''
  else Convert(Char(10),a.fine,103)
end,
f.OffLine,
Rifiuti=case
  when Rifiuti is null then 0
  else rifiuti
end
From M1  LEFT OUTER join Rilasci g
  ON (M1.id_piano=g.id_piano
  and M1.id_soggetto=g.id_soggetto
  and M1.apparecchio=g.apparecchio
)
  LEFT OUTER join Commutate e
  ON (M1.id_piano=e.id_piano
  and M1.id_soggetto=e.id_soggetto
  and M1.apparecchio=e.apparecchio
)
  LEFT OUTER JOIN LDedicate a
  ON (M1.id_piano=a.id_piano
  and M1.id_soggetto=a.id_soggetto
  and M1.apparecchio=a.appar
)
  LEFT OUTER JOIN Rifiuti b ON
  (M1.id_piano=b.r_id_piano
  and M1.id_soggetto=b.r_id_soggetto)
  LEFT OUTER join dbo.M1OffLine f
  ON (M1.id_piano=f.id_piano
  and M1.id_soggetto=f.id_soggetto
  and M1.apparecchio=f.apparecchio
)
GO
