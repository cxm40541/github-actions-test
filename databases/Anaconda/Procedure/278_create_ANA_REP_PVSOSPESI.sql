/****** Object:  StoredProcedure [dbo].[ANA_REP_PVSOSPESI]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[ANA_REP_PVSOSPESI] 
AS 
BEGIN
SELECT lsrser_lotto_key_id_ricev, lsrser_lotto_data_provv, lsrser_lotto_prog_provv,LSRPRO_CAUSALE
FROM LSRPRO, LSRSER_LOTTO a
WHERE lsrser_lotto_data_decor = 
 (SELECT MAX(lsrser_lotto_data_decor) FROM lsrser_lotto 
 WHERE lsrser_lotto_key_id_ricev = A.lsrser_lotto_key_id_ricev
 and lsrser_lotto_data_decor <= (select convert(char(8),getdate(),112))
 and lsrser_lotto_flag_validita = 'Y') 
and lsrser_lotto_flag_validita = 'Y' 
and lsrser_lotto_tipo_provv = 'S'
AND lsrser_lotto_key_id_ricev = lsrPRO_key_id_ricev
AND lsrser_lotto_tipo_provv = lsrpro_key_tipo_rec
AND lsrser_lotto_data_provv = lsrpro_key_data_provv
AND lsrser_lotto_prog_provv = lsrpro_key_prog_provv
AND lsrPRO_flag_validita = 'y'
AND LSRPRO_CAUSALE <> ''
 ORDER by 1
END
GO
