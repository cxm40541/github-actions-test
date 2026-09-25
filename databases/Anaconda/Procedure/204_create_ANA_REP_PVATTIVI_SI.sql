/****** Object:  StoredProcedure [dbo].[ANA_REP_PVATTIVI_SI]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     PROCEDURE [dbo].[ANA_REP_PVATTIVI_SI] 
AS 
BEGIN

SELECT 
lsrser_tris_key_id_ricev, 
lsrtit_coni_codice_coni,
lsrtit_coni_cognome, 
lsrtit_coni_nome, 
lsrric_decod_ricev as denominazione,
lsrric_indirizzo,
lsrric_comune_ricev,
lsrric_cap,
lsrric_prov_ricev,
lsrric_tel_ricevitoria,
lsrtit_coni_tel_casa,
tlsrcon_GS.lsrcon_GS_data_contratto ,
tlsrnuo_GS.lsrnuo_GS_data_accettazione, 
tlsrnuo_GS.lsrnuo_GS_data_nulla_osta,
'', -- Data RID  ?????? DA AGGIUNGERE 
tLSRRIN_CONI.lsrrin_coni_data_rinuncia ,
tFideussioneAnnoPrec.lsrsoc_descrizione,
tFideussioneAnnoCorr.lsrsoc_descrizione, 
tlsrtlp_GS.lsrtlp_GS_data_rilascio

FROM lsrric A 
             left outer join 
	    (SELECT  lsrcon_GS_key_id_ricev,lsrcon_GS_data_contratto ,lsrcon_GS_flag_anag 
	     FROM lsrcon_GS 
             WHERE lsrcon_GS_flag_anag = '1' AND lsrcon_GS_CODICE_SERVIZIO = '08') as tlsrcon_GS
             ON (lsrric_key_id_ricev = tlsrcon_GS.lsrcon_GS_key_id_ricev) 

             left outer join 
	    (SELECT lsrnuo_GS_key_id_ricev, lsrnuo_GS_data_nulla_osta, lsrnuo_GS_data_accettazione from lsrnuo_GS 
             WHERE lsrnuo_GS_flag_anag = '1' AND lsrNUO_GS_CODICE_SERVIZIO = '08') as tlsrnuo_GS 
             ON (lsrric_key_id_ricev = tlsrnuo_GS.lsrnuo_GS_key_id_ricev) 

--             left outer join 
--     	    (SELECT data_inizio_val
--             FROM riscossioni.dbo.deleghebanca_pv  
--             WHERE data_fine_val = '99999999' 
--             and cod_prodotto = '11') as tlsrnuo_coni 
--             ON (lsrric_key_id_ricev = tlsrnuo_coni.lsrnuo_coni_key_id_ricev)

             left outer join 
	    (SELECT lsrrin_coni_data_rinuncia, LSRRIN_CONI_FLAG_ANAG, LSRRIN_CONI_KEY_ID_RICEV
             FROM LSRRIN_CONI
             WHERE  LSRRIN_CONI_FLAG_ANAG = '1' AND LSRRIN_CONI_CODICE_SERVIZIO = '11') AS tLSRRIN_CONI
             ON (lsrric_key_id_ricev = tLSRRIN_CONI.LSRRIN_CONI_KEY_ID_RICEV) 

             left outer join 
	    (SELECT lsrsoc_descrizione,lsrfid_coni_anno_rif,lsrfid_coni_key_id_ricev
	     FROM lsrfid_coni, lsrsoc 
             WHERE lsrfid_coni_FLAG_ANAG = '1'
             AND lsrfid_coni_anno_rif = (CONVERT(CHAR(4),GETDATE(),112)  -1) 
             AND lsrfid_coni_id_soc = lsrsoc_key_id_soc) AS tFideussioneAnnoPrec
             ON (lsrric_key_id_ricev = tFideussioneAnnoPrec.lsrfid_coni_key_id_ricev ) 

             left outer join 
	    (SELECT lsrsoc_descrizione,lsrfid_coni_anno_rif,lsrfid_coni_key_id_ricev
	     FROM lsrfid_coni, lsrsoc 
             WHERE lsrfid_coni_FLAG_ANAG = '1'
             AND lsrfid_coni_anno_rif = (CONVERT(CHAR(4),GETDATE(),112) ) 
             AND lsrfid_coni_id_soc = lsrsoc_key_id_soc) AS tFideussioneAnnoCorr
             ON (lsrric_key_id_ricev = tFideussioneAnnoCorr.lsrfid_coni_key_id_ricev ) 

             left outer join 
	    (SELECT lsrtlp_GS_data_rilascio,lsrtlp_GS_key_id_ricev
 	     FROM lsrtlp_GS 
             WHERE lsrtlp_GS_flag_anag = '1' AND lsrtlp_GS_CODICE_SERVIZIO = '08') AS tlsrtlp_GS
             ON (lsrric_key_id_ricev = tlsrtlp_GS.lsrtlp_GS_key_id_ricev ) 

, lsrtit_coni B, lsrser_tris D
WHERE lsrric_key_id_ricev = lsrtit_coni_key_id_ricev 
 and lsrric_key_id_ricev = lsrser_tris_key_id_ricev 
 and (lsrric_data_validita + lsrric_ora_validita) = 
  (SELECT MAX(lsrric_data_validita + lsrric_ora_validita) 
   from lsrric 
   where lsrric_key_id_ricev = A.lsrric_key_id_ricev
   and  lsrric_data_validita <= convert(char(8),getdate(),112)
   and  lsrric_flag_validita = 'Y')
   and (lsrtit_coni_data_validita + lsrtit_coni_ora_validita) = 
  (select max((lsrtit_coni_data_validita + lsrtit_coni_ora_validita)) from lsrtit_coni 
   where lsrtit_coni_key_id_ricev = B.lsrtit_coni_key_id_ricev
   and  lsrtit_coni_data_validita <= convert(char(8),getdate(),112)
   and  lsrtit_coni_flag_validita = 'Y')
   and  lsrric_flag_validita = 'Y'
   and  lsrtit_coni_flag_validita = 'Y'
   and lsrser_tris_data_decor = 
   (SELECT MAX(lsrser_tris_data_decor) FROM lsrser_tris 
    WHERE lsrser_tris_key_id_ricev = D.lsrser_tris_key_id_ricev
    and lsrser_tris_data_decor <= (select convert(char(8),getdate(),112))
    and lsrser_tris_flag_validita = 'Y') 
    and lsrser_tris_flag_validita = 'Y' 
    and lsrser_tris_stato =  '1'
END
GO
