/****** Object:  View [dbo].[S2T_v_sinai]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[S2T_v_sinai] as

          select  codice_zucchetti_pos, 
                  codice_zucchetti_cliente, 
                  codice_lotto, 
                  lsrric_cod_amm as codice_amministrativo, 
                  null as forma_giuridica, 

                  case when left(codice_lotto,2) in ('A1','A2','A3','A4','A5','A6','A7','A8','B0','B1') 
                       then null
                       else lsrric_decod_ricev end as ragione_sociale,

                  case when left(codice_lotto,2) in ('A1','A2','A3','A4','A5','A6','A7','A8','B0','B1') 
                       then lsrric_indirizzo + ' GC'
                       else lsrric_indirizzo + '   ' end as indirizzo,

                  lsrric_cap as cap,
                  lsrric_comune_ricev as comune,
                  lsrric_prov_ricev as provincia,
                  lsrric_tel_ricevitoria as telefono,
                  isnull(lsrcon_GeV_cod_fisc,null) as codice_fiscale, 
                  isnull(lsrcon_GeV_partita_iva,null) as partita_iva,
                  '0' as eliminato,
                  null as datacontrattualizzato,
                  null as dataeliminato,
                  isnull(lsrcon_GeV_cognome, lsrtit_cognome) as lr_cognome,
                  isnull(lsrcon_GeV_nome, lsrtit_nome)  as lr_nome,
                  isnull(lsrcon_GeV_cod_fisc, lsrtit_codice_fiscale)  as lr_codicefiscale,
                  null as lr_luogonascita,
                  null as lr_provincianascita,
                  null as lr_datanascita,
                  null as lr_indirizzo,
                  null as lr_cap,
                  null as lr_localita,
                  null as lr_provincia,
                  null as lr_tipodocumento,
                  null as lr_numerodocumento,
                  null as lr_documentoemessoda,
                  null as lr_localitarilascio,
                  null as lr_datarilascio,

                  case when left(codice_lotto,2) in ('A1','A2','A3','A4','A5','A6','A7','A8','B0','B1') 
                       then lsrric_decod_ricev 
                       else null end as insegna,

                  case when left(codice_lotto,2) in ('A1','A2','A3','A4','A5','A6','A7','A8','B0','B1') 
                       then lsrric_indirizzo + ' GC'
                       else lsrric_indirizzo + '   ' end as indirizzo_pv,

                  lsrric_cap as cap_pv,
                  lsrric_comune_ricev as localita_pv,
                  lsrric_prov_ricev as provincia_pv,
                  lsrric_tel_ricevitoria as telefono_pv
            from dbo.s2t_v_lotto_sgi_zucchetti a, 
                  lsrcon_gev c, 
                  lsrric d,
                  lsrpvo e,
                  lsrtit f
            where a.codice_lotto = f.lsrtit_key_id_ricev
            and a.codice_lotto   = d.lsrric_key_id_ricev
            and a.codice_lotto  *= c.lsrcon_GeV_cod_lotto
            and a.codice_lotto  *= e.lsrpvo_key_id_ricev

            and lsrcon_GeV_flag_anag = 1
            and lsrric_flag_validita = 'Y' 
            and lsrric_decod_ricev <> 'RAGIONE SOCIALE'
            and lsrric_decod_ricev <> 'DENOMINAZIONE'
            and lsrric_indirizzo <> 'INDIRIZZO'
            and lsrric_comune_ricev not like 'XXX%'
            and lsrric_comune_ricev <> 'COMUNE'
            and lsrric_data_validita = (
                  select max(lsrric_data_validita) 
                  from lsrric xd
                  where lsrric_flag_validita = 'Y' 
                  and lsrric_decod_ricev <> 'RAGIONE SOCIALE'
                  and lsrric_decod_ricev <> 'DENOMINAZIONE'
                  and lsrric_indirizzo <> 'INDIRIZZO'
                  and lsrric_comune_ricev not like 'XXX%'
                  and lsrric_comune_ricev <> 'COMUNE'
                  and xd.lsrric_key_id_ricev = d.lsrric_key_id_ricev
            )

            and lsrtit_flag_validita = 'Y' 
            and lsrtit_cognome <> 'COGNOME'
            and lsrtit_data_validita = (
                  select max(lsrtit_data_validita) 
                  from lsrtit xf
                  where lsrtit_flag_validita = 'Y' 
                  and xf.lsrtit_key_id_ricev = f.lsrtit_key_id_ricev
                  and lsrtit_cognome <> 'COGNOME'
            )

            --and codice_zucchetti_cliente in (
            --    select distinct codice_zucchetti_cliente
            --    from s2t_client_inviati
            --    where azione = 'I'
            --)

            and codice_zucchetti_pos_numerico not in (
                  select codice_zucchetti_pos_numerico
                  from   dbo.s2t_zucchetti_pos
                  where codice_lotto like 'dum%'
            )

            --and (codice_zucchetti_pos_numerico > (
            --    select max(codice_zucchetti_pos_numerico)
            --    from   dbo.s2t_zucchetti_pos
            --    where codice_lotto like 'dum%'
            --)
            --or codice_lotto = 'B00570'
            --)

            and codice_zucchetti_cliente_numerico not in (
                  select codice_zucchetti_cliente_numerico
                  from   dbo.s2t_zucchetti_cliente
                  where codice_lotto like 'dum%'
            )

            --and (codice_zucchetti_cliente_numerico > (
            --    select max(codice_zucchetti_cliente_numerico)
            --    from   dbo.s2t_zucchetti_cliente
            --    where codice_lotto like 'dum%'
            --)
            --or codice_lotto = 'B00570'
            --)
GO
