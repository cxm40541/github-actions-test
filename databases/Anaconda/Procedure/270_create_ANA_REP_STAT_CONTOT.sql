/****** Object:  StoredProcedure [dbo].[ANA_REP_STAT_CONTOT]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ANA_REP_STAT_CONTOT] 
@NOMEQUERY         	CHAR(30)
AS 
BEGIN
--*********************************************************
--*TOTALI CONTRATTI 
--*********************************************************
	IF @NOMEQUERY = 'TOTCON_GENERALE'
	BEGIN
		--- GENERALE
		select  COUNT(*) FROM lsrcon_gev

	END 
	ELSE
	IF @NOMEQUERY = 'TOTCON_LOTTISTI'
	BEGIN
		
		-- LOTTISTI
                select COUNT(*) from lsrcon_gev
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '3%'

	END 
	ELSE
	IF @NOMEQUERY = 'TOTCON_TOTORICEVITORI'
	BEGIN

		--- TOTORICEVITORI
		select COUNT(*) from lsrcon_gev
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '1%'

	END 
	ELSE
	IF @NOMEQUERY = 'TOTCON_POSGIALLO'
	BEGIN

		--- POS GIALLO
		select COUNT(*) from lsrcon_gev
                 WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
	END 
	ELSE
	IF @NOMEQUERY = 'TOTCON_POSMARRONE'
	BEGIN

		--- POS MARRONE
		select COUNT(*) from lsrcon_gev
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '4%'
	END 
	ELSE
	IF @NOMEQUERY = 'TOTCON_LOTTEL'
	BEGIN

		--- LOTTERIE TELEMATICHE
		select COUNT(*) from lsrcon_gev
		WHERE lsrcon_gev_COD_LOTTO  LIKE 'LI%'
	END 
END
GO
