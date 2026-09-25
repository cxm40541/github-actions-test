/****** Object:  View [dbo].[OffLineCommutate]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.OffLineCommutate    Script Date: 13/02/2002 15.45.18 ******/
CREATE view [dbo].[OffLineCommutate] as
select a.id_piano
,a.id_soggetto
,a.fine
,a.id_attivita
,a.cod_avanzamento
,a.progr_operazione
,a.apparecchio
,a.cod_appar
,a.flag_provv
,a.tipo_piano
,a.id_record
,a.lsr01a_cognome
,a.lsr01a_nome
,a.lsr01a_cod_amm
,a.lsr01a_tab
,a.lsr01a_tel_ricevitoria
,a.lsr01a_tel_casa
,a.lsr01a_indirizzo
,a.lsr01a_cap
,a.lsr01a_comune_ricev
,a.lsr01a_prov_ricev
,a.lsr01a_data_cessaz
,a.lsr01a_stato
,a.codor
,a.sdlc
,a.progr_terminale
,a.lotto
,a.data_ordine,
commutate.fine as commutata      
from OffLine a LEFT outer join Commutate 
ON (a.id_soggetto=commutate.id_soggetto and
 a.id_piano=commutate.id_piano)
GO
