/****** Object:  StoredProcedure [dbo].[Daily_Report_CONI]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE        PROCEDURE [dbo].[Daily_Report_CONI] AS
DECLARE @anno AS CHAR(4),
                @annocorr AS CHAR(4)
 
SELECT @annocorr = YEAR(GETDATE())
SELECT @anno = year (dateadd(year,-1,getdate()))--'2003'  ----SOLO PER TABELLA FIDEJUSSIONI
 
SELECT  lsrtit_coni_key_id_ricev AS Ricev,
        lsrtit_coni_codice_coni AS Codice_CONI,
        lsr01a_tab_giochi_11 AS Stato_Vos,
        lsrtit_coni_cognome AS Cognome,
        lsrtit_coni_nome AS Nome,
        lsrtit_coni_denominazione AS Denominazione,
        lsr01a_indirizzo AS Indirizzo,
        lsr01a_comune_ricev AS Comune,
        lsr01a_cap AS CAP,
        lsr01a_prov_ricev AS Prov,
        lsr01a_tel_ricevitoria as Tel_Ricev,
        lsr01a_tel_casa as Tel_Casa,
        lsrcon_coni.lsrcon_coni_key_data_ins AS Contratto,
        lsrnuo_coni_data_accettazione AS Nullaosta,
        --lsrfid_coni.lsrfid_coni_key_data_ins AS Fidejussione,
      --  lsrsoc.lsrsoc_descrizione AS Fidejussione,
         data_inizio_val AS RID,
        -- lsrrin_coni_data_rinuncia as Rinuncia,
	-- MODIFICA DEL 30/08/2005: SE E' IMPOSTATA LA DATA RINUCIA DELLA RINUNCIA
	-- NON LA VISUALIZZO
	Rinuncia = 
		case lsrrin_coni_data_rinuncia_rinuncia 
		WHEN '' then lsrrin_coni_data_rinuncia
		else ''
                end,
         x.lsrsoc_descrizione as fid_anno_prec,
         y.lsrsoc_descrizione as fid_anno_corr,
	lsrtlp_st.lsrtlp_st_data_rilascio as tulps
        --lto0aa_data_inizio_val AS RID
 
FROM lsrtit_coni a
 
LEFT OUTER JOIN lsrnuo_coni
ON lsrtit_coni_key_id_ricev = lsrnuo_coni.lsrnuo_coni_key_id_ricev
AND (lsrnuo_coni.lsrnuo_coni_fk_data_ins_tit + lsrnuo_coni.lsrnuo_coni_fk_ora_ins_tit =
     lsrtit_coni_key_data_ins + lsrtit_coni_key_ora_ins)
AND lsrnuo_coni_flag_anag = '1'
AND lsrnuo_coni_data_accettazione <> '00000000'
AND lsrnuo_coni_data_accettazione IS NOT NULL
 
LEFT OUTER JOIN lsrcon_coni
ON lsrtit_coni_key_id_ricev = lsrcon_coni.lsrcon_coni_key_id_ricev
AND (lsrcon_coni.lsrcon_coni_fk_data_ins_tit + lsrcon_coni.lsrcon_coni_fk_ora_ins_tit =
         lsrtit_coni_key_data_ins + lsrtit_coni_key_ora_ins)
and lsrcon_coni_flag_anag = '1'
 
LEFT OUTER JOIN lsrfid_coni v
ON lsrtit_coni_key_id_ricev = v.lsrfid_coni_key_id_ricev
AND (v.lsrfid_coni_fk_data_ins_tit + v.lsrfid_coni_fk_ora_ins_tit =
         lsrtit_coni_key_data_ins + lsrtit_coni_key_ora_ins)
AND (v.lsrfid_coni_anno_rif = @anno)
AND v.lsrfid_coni_flag_anag = '1'
 
LEFT OUTER JOIN lsrsoc x ON v.lsrfid_coni_id_soc = x.lsrsoc_key_id_soc
 
LEFT OUTER JOIN lsrfid_coni c
ON lsrtit_coni_key_id_ricev = c.lsrfid_coni_key_id_ricev
AND (c.lsrfid_coni_fk_data_ins_tit + c.lsrfid_coni_fk_ora_ins_tit =
         lsrtit_coni_key_data_ins + lsrtit_coni_key_ora_ins)
AND (c.lsrfid_coni_anno_rif = @annocorr)
AND c.lsrfid_coni_flag_anag = '1'
 
LEFT OUTER JOIN lsrsoc y ON c.lsrfid_coni_id_soc = y.lsrsoc_key_id_soc
 
LEFT OUTER JOIN riscossioni.dbo.deleghebanca_pv
ON lsrtit_coni_key_id_ricev = cod_lottomatica
AND (data_fine_val = '99999999'
and cod_prodotto = '11' )
 
LEFT OUTER JOIN condiviso.dbo.lsr01a
ON lsrtit_coni_key_id_ricev = lsr01a_key_id_ricev
 
LEFT OUTER JOIN lsrser_coni
ON lsrtit_coni_key_id_ricev = lsrser_coni_key_id_ricev
AND lsrser_coni_data_decor =
        (SELECT MAX(lsrser_coni_data_decor) FROM lsrser_coni A
         WHERE A.lsrser_coni_key_id_ricev = lsrser_coni_key_id_ricev
         AND A.lsrser_coni_key_id_ricev =lsrtit_coni_key_id_ricev
         AND lsrser_coni_flag_validita = 'Y')
 AND lsrser_coni_flag_validita = 'Y'

LEFT OUTER JOIN lsrtlp_st
ON lsrtit_coni_key_id_ricev = lsrtlp_st.lsrtlp_st_key_id_ricev
AND (lsrtlp_st.lsrtlp_st_fk_data_ins_tit + lsrtlp_st.lsrtlp_st_fk_ora_ins_tit =
         lsrtit_coni_key_data_ins + lsrtit_coni_key_ora_ins)
and lsrtlp_st_flag_anag = '1'


LEFT OUTER JOIN lsrrin_coni
ON lsrtit_coni_key_id_ricev = lsrrin_coni.lsrrin_coni_key_id_ricev
AND (lsrrin_coni.lsrrin_coni_fk_data_ins_tit + lsrrin_coni.lsrrin_coni_fk_ora_ins_tit    =
         lsrtit_coni_key_data_ins + lsrtit_coni_key_ora_ins)
AND lsrrin_coni_flag_anag = '1'
 
WHERE (a.lsrtit_coni_flag_validita = 'Y' AND a.lsrtit_coni_flag_anag = '1')
 
AND a.lsrtit_coni_data_validita =
        (
        SELECT MAX(b.lsrtit_coni_data_validita)
        FROM lsrtit_coni b
        WHERE b.lsrtit_coni_key_id_ricev = a.lsrtit_coni_key_id_ricev
        AND b.lsrtit_coni_flag_validita = 'Y'
        AND b.lsrtit_coni_flag_anag = '1'
        AND b.lsrtit_coni_data_validita <= convert(char(8),getdate(),112)
)
 
ORDER BY 1
GO
