/****** Object:  View [dbo].[t6CommutateDedicate]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.t6CommutateDedicate    Script Date: 13/02/2002 15.45.20 ******/
CREATE view [dbo].[t6CommutateDedicate] as
select t6Commutate.id_piano,t6Commutate.id_soggetto,t6Commutate.data_ordine, 
data_rilascio=  case 
  when Convert(Char(10),t6Commutate.fine,103)='01/01/1900' then''
  when t6Commutate.fine is null then ''
  else Convert(Char(10),t6Commutate.fine,103)
end,
id_attivita,cod_avanzamento,apparecchio,progr_operazione,
cod_appar,flag_provv,t6Commutate.tipo_piano,id_record,lsr01a_cognome,lsr01a_nome,
lsr01a_cod_amm,lsr01a_tab,lsr01a_tel_ricevitoria,lsr01a_tel_casa,
lsr01a_indirizzo,lsr01a_cap,lsr01a_comune_ricev,lsr01a_prov_ricev,
lsr01a_data_cessaz,lsr01a_stato,codor,sdlc,progr_terminale,lotto,
commutata=case
  when Convert(Char(10),t6Commutate.commutata,103)='01/01/1900' then''
  when t6Commutate.commutata is null then ''
  else Convert(Char(10),t6Commutate.commutata,103)
end,
Dedicata=case
 when Convert(Char(10),a.fine,103)='01/01/1900' then''
  when a.fine is null then ''
  else Convert(Char(10),a.fine,103)
end,
Rifiuti=case
  when Rifiuti is null then 0
  else rifiuti
end
,
 GuastiLinea=case
  when GuastiLinea is null then 0
 else GuastiLinea
end
From T6Commutate LEFT OUTER JOIN LDedicate a
ON (T6Commutate.id_piano=a.id_piano
and T6Commutate.id_soggetto=a.id_soggetto)
LEFT OUTER JOIN Rifiuti b ON
(T6Commutate.id_piano=b.r_id_piano
and T6Commutate.id_soggetto=b.r_id_soggetto)
LEFT OUTER JOIN GuastiLinea c ON
(T6Commutate.id_piano=c.g_id_piano
and T6Commutate.id_soggetto=c.g_id_soggetto)
GO
