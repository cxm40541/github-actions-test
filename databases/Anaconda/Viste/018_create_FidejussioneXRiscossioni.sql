/****** Object:  View [dbo].[FidejussioneXRiscossioni]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[FidejussioneXRiscossioni]
AS
SELECT 'Ricev' = lsrfid_F101_key_id_ricev, 'enteFide' =
        (SELECT lsrsoc_descrizione
      FROM lsrsoc
      WHERE CONVERT(numeric, lsrsoc_key_id_soc) 
           = CONVERT(numeric, lsrfid_F101_id_soc)), 
    'importo' = lsrfid_F101_importo, 
    'anno' = lsrfid_F101_anno_rif, 
    'dataDecorrenzaTitolare' = isNull
        ((SELECT data_validita
       FROM v_tit_decorr_prec
       WHERE key_id_ricev = lsrfid_F101_key_id_ricev), 0), 
    'Prodotto' = '02'
FROM lsrfid_F101
WHERE CONVERT(numeric, lsrfid_F101_flag_anag) = 1 AND 
    lsrfid_F101_anno_rif = year(getDate())
UNION
SELECT 'Ricev' = lsrfid_TRIS_key_id_ricev, 'enteFide' =
        (SELECT lsrsoc_descrizione
      FROM lsrsoc
      WHERE CONVERT(numeric, lsrsoc_key_id_soc) 
           = CONVERT(numeric, lsrfid_TRIS_id_soc)), 
    'importo' = lsrfid_TRIS_importo_pagato, 
    'anno' = lsrfid_TRIS_anno_rif, 
    'dataDecorrenzaTitolare' = isNull
        ((SELECT data_validita
       FROM v_tit_decorr_prec
       WHERE key_id_ricev = lsrfid_TRIS_key_id_ricev), 0), 
    'Prodotto' = '08'
FROM lsrfid_TRIS
WHERE CONVERT(numeric, lsrfid_TRIS_flag_anag) = 1 AND 
    lsrfid_TRIS_anno_rif = year(getDate())
GO
