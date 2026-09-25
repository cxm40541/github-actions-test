/****** Object:  StoredProcedure [dbo].[ANA_REP_STAT_VECTIT]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ANA_REP_STAT_VECTIT] 
@NOMEQUERY         	CHAR(30)
AS 
BEGIN
--* CONTRATTI VECCHI TITOLARI *******************
	IF @NOMEQUERY = 'VECTIT_GENERALE'
	BEGIN
		--- GENERALE
		SELECT COUNT(*) 
		FROM lsrcon_gev
		WHERE  lsrcon_gev_flag_anag > '1' 

	END 
	ELSE
	IF @NOMEQUERY = 'VECTIT_LOTTISTI'
	BEGIN
		-- LOTTISTI  
		SELECT  COUNT(*) 
		FROM lsrcon_gev
		WHERE lsrcon_gev_flag_anag > '1'
                       AND LSRCON_GEV_KEY_ID_RICEV LIKE '3%'

	END 
	ELSE
	IF @NOMEQUERY = 'VECTIT_TOTORICEVITORI'
	BEGIN
		--- TOTORICEVITORI
		SELECT COUNT(*) 
		FROM lsrcon_gev
		WHERE lsrcon_gev_flag_anag > '1'
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '1%'

	END 
	ELSE
	IF @NOMEQUERY = 'VECTIT_POSGIALLO'
	BEGIN
		--- POS GIALLO
		SELECT COUNT(*) 
		FROM lsrcon_gev
		WHERE lsrcon_gev_flag_anag > '1'
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '9%'

	END 
	ELSE
	IF @NOMEQUERY = 'VECTIT_POSMARRONE'
	BEGIN
		--- POS MARRONE
		SELECT COUNT(*)
		 FROM lsrcon_gev
		WHERE lsrcon_gev_flag_anag > '1'
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '4%'

	END 
	ELSE
	IF @NOMEQUERY = 'VECTIT_LOTTEL'
	BEGIN

		--- LOTTERIE TELEMATICHE
		SELECT COUNT(*) 
		FROM lsrcon_gev
		WHERE lsrcon_gev_COD_LOTTO  LIKE 'LI%'  
		AND lsrcon_gev_flag_anag > '1'

	END 
END
GO
