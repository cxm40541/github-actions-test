/****** Object:  StoredProcedure [dbo].[ANA_REP_STAT_CONATTIVE]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ANA_REP_STAT_CONATTIVE] 
@NOMEQUERY         	CHAR(30)
AS 
BEGIN
        --* CONTRATTI TITOLARE ATTUALE ATTIVE ***********************
	
	IF @NOMEQUERY = 'CONATTIVE_GENERALE'
	BEGIN

	--- GENERALE
		SELECT COUNT(*) FROM lsrcon_gev, LSRSER_GEV a
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSRSER_GEV_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND a.lsrser_GEV_flag_validita = 'Y'
		AND a.lsrser_GEV_STATO = '1'
		AND  lsrser_GEV_data_decor = 
			(SELECT MAX(lsrser_GEV_data_decor) FROM lsrser_GEV 
			where lsrser_GEV_key_id_ricev = a.lsrser_GEV_key_id_ricev
			 and  lsrser_GEV_data_decor <= (CONVERT(CHAR(8),GETDATE(),112))
			and  lsrser_GEV_flag_validita = 'Y')

	END 
	ELSE
	IF @NOMEQUERY = 'CONATTIVE_LOTTISTI'
	BEGIN

		-- LOTTISTI
		select COUNT(*) from lsrcon_gev, LSRSER_GEV a
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '3%'
		AND lsrcon_gev_FLAG_ANAG = '1' 
		AND LSRSER_GEV_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		 and  lsrser_GEV_flag_validita = 'Y'
		AND lsrser_GEV_STATO = '1'
		AND  lsrser_GEV_data_decor = 
			(select max(lsrser_GEV_data_decor) from lsrser_GEV 
			where lsrser_GEV_key_id_ricev = a.lsrser_GEV_key_id_ricev
			 and  lsrser_GEV_data_decor <= (CONVERT(CHAR(8),GETDATE(),112))
			and  lsrser_GEV_flag_validita = 'Y')
	END 
	ELSE
	IF @NOMEQUERY = 'CONATTIVE_TOTORICEVITORI'
	BEGIN

		--- TOTORICEVITORI
		select COUNT(*) from lsrcon_gev, LSRSER_GEV a
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '1%'		AND lsrcon_gev_FLAG_ANAG = '1' 
		AND LSRSER_GEV_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND  lsrser_GEV_flag_validita = 'Y'
		AND lsrser_GEV_STATO = '1'
		AND  lsrser_GEV_data_decor = 
			(select max(lsrser_GEV_data_decor) from lsrser_GEV 
			where lsrser_GEV_key_id_ricev = a.lsrser_GEV_key_id_ricev
			 and  lsrser_GEV_data_decor <= (CONVERT(CHAR(8),GETDATE(),112))
			and  lsrser_GEV_flag_validita = 'Y')

	END 
	ELSE
	IF @NOMEQUERY = 'CONATTIVE_POSGIALLO'
	BEGIN

		--- POS GIALLO
		select COUNT(*) from lsrcon_gev, LSRSER_GEV a
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
		AND lsrcon_gev_FLAG_ANAG = '1' 
		AND LSRSER_GEV_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO 
		AND  lsrser_GEV_flag_validita = 'Y'
		AND lsrser_GEV_STATO = '1'
		AND  lsrser_GEV_data_decor = 
			(select max(lsrser_GEV_data_decor) from lsrser_GEV 
			where lsrser_GEV_key_id_ricev = a.lsrser_GEV_key_id_ricev
			 and  lsrser_GEV_data_decor <= (CONVERT(CHAR(8),GETDATE(),112))
			and  lsrser_GEV_flag_validita = 'Y')
	END 
	ELSE
	IF @NOMEQUERY = 'CONATTIVE_POSMARRONE'
	BEGIN

		--- POS MARRONE
		select COUNT(*) from lsrcon_gev, LSRSER_GEV a
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '4%'
		AND lsrcon_gev_FLAG_ANAG = '1' 
		AND LSRSER_GEV_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO 
		AND lsrser_GEV_flag_validita = 'Y'
		AND lsrser_GEV_STATO = '1'
		AND  lsrser_GEV_data_decor = 
			(select max(lsrser_GEV_data_decor) from lsrser_GEV 
			where lsrser_GEV_key_id_ricev = a.lsrser_GEV_key_id_ricev
			 and  lsrser_GEV_data_decor <= (CONVERT(CHAR(8),GETDATE(),112))
			and  lsrser_GEV_flag_validita = 'Y')
	END 
	ELSE
	IF @NOMEQUERY = 'CONATTIVE_LOTTEL'
	BEGIN


		--- LOTTERIE TELEMATICHE
		select COUNT(*) from lsrcon_gev, LSRSER_GEV a
		WHERE lsrcon_gev_COD_LOTTO  LIKE 'LI%'
		AND lsrcon_gev_FLAG_ANAG = '1' 
		AND LSRSER_GEV_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO 
		AND  lsrser_GEV_flag_validita = 'Y'
		AND lsrser_GEV_STATO = '1'
		AND  lsrser_GEV_data_decor = 
			(select max(lsrser_GEV_data_decor) from lsrser_GEV 
			where lsrser_GEV_key_id_ricev = a.lsrser_GEV_key_id_ricev
			 and  lsrser_GEV_data_decor <= (CONVERT(CHAR(8),GETDATE(),112))
			and  lsrser_GEV_flag_validita = 'Y')
	END 
END
GO
