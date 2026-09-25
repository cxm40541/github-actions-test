/****** Object:  View [dbo].[OffLineCommutateDedicate]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.OffLineCommutateDedicate    Script Date: 13/02/2002 15.45.19 ******/
CREATE view [dbo].[OffLineCommutateDedicate] as
select OffLineCommutate.id_piano,OffLineCommutate.id_soggetto,
  OffLineCommutate.data_ordine, 
data_OffLine=  case 
  when Convert(Char(10),OffLineCommutate.fine,103)='01/01/1900' then''
  when OffLineCommutate.fine is null then ''
  else Convert(Char(10),OffLineCommutate.fine,103)
end,
apparecchio,
flag_provv,lsr01a_cognome,lsr01a_nome,
lsr01a_cod_amm,lsr01a_tab,lsr01a_tel_ricevitoria,lsr01a_tel_casa,
lsr01a_indirizzo,lsr01a_cap,lsr01a_comune_ricev,lsr01a_prov_ricev,
lsr01a_data_cessaz,lsr01a_stato,codor,sdlc,progr_terminale,lotto,
OffLineCommutate.id_record,OffLineCommutate.tipo_piano,OffLineCommutate.cod_appar,OffLineCommutate.progr_operazione,OffLineCommutate.id_attivita,OffLineCommutate.cod_avanzamento,
commutata=case
  when Convert(Char(10),OffLineCommutate.commutata,103)='01/01/1900' then''
  when OffLineCommutate.commutata is null then ''
  else Convert(Char(10),OffLineCommutate.commutata,103)
end,
Dedicata=case
 when Convert(Char(10),a.fine,103)='01/01/1900' then''
  when a.fine is null then ''
  else Convert(Char(10),a.fine,103)
end,
Rifiuti=case
  when Rifiuti is null then 0
  else rifiuti
end,
 GuastiLinea=case
  when GuastiLinea is null then 0
 else GuastiLinea
end,
Rilascio=case
 when Convert(Char(10),s.fine,103)='01/01/1900' then''
  when s.fine is null then ''
  else Convert(Char(10),s.fine,103)
end
From dbo.OffLineCommutate as OffLineCommutate LEFT OUTER JOIN LDedicate a
ON (OffLineCommutate.id_piano=a.id_piano
and OffLineCommutate.id_soggetto=a.id_soggetto)
LEFT OUTER JOIN Rifiuti b ON
(OffLineCommutate.id_piano=b.r_id_piano
and OffLineCommutate.id_soggetto=b.r_id_soggetto)
LEFT OUTER JOIN GuastiLinea c ON
(OffLineCommutate.id_piano=c.g_id_piano
and OffLineCommutate.id_soggetto=c.g_id_soggetto)
,stato_avanzamento s,legenda l,piani p
where s.id_soggetto=OffLineCommutate.id_soggetto
and s.id_piano=OffLineCommutate.id_piano
and s.id_attivita=l.cod_attivita
and s.cod_avanzamento=l.cod_avanzamento
and l.id_record=4
and s.id_piano=p.id_piano
and p.tipo_piano=l.tipo_piano
GO
