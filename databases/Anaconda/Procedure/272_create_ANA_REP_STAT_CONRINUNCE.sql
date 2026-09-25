/****** Object:  StoredProcedure [dbo].[ANA_REP_STAT_CONRINUNCE]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ANA_REP_STAT_CONRINUNCE] 
@NOMEQUERY         	CHAR(30)
AS 
BEGIN
		--* CONTRATTI TITOLARE ATTUALE RINUNCE ***********************

	IF @NOMEQUERY = 'CONRINUNCE_GENERALE'
	BEGIN

		--- GENERALE
		
	SELECT COUNT(*) FROM lsrcon_gev, 
                CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND  A.lsr01A_TAB_GIOCHI_09 IN ('0', '2')
		AND 
(LSRCON_GEV_NOTE LIKE '%RINUNC%' OR LSRCON_GEV_NOTE
                             LIKE '%REVOC%LTM%' OR LSRCON_GEV_NOTE LIKE '%NESSUN%SERV%ATTIV%') 


	END 
	ELSE
	IF @NOMEQUERY = 'CONRINUNCE_LOTTISTI'
	BEGIN

	-- LOTTISTI
		select COUNT(*) from lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE 
                   LSRCON_GEV_KEY_ID_RICEV LIKE '1%'
		   AND lsrcon_gev_FLAG_ANAG = '1' 
	           AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO                  		                       
                   AND  A.lsr01A_TAB_GIOCHI_09 IN ('0', '2')
                   AND (LSRCON_GEV_NOTE LIKE '%RINUNC%' OR LSRCON_GEV_NOTE  
                           LIKE '%REVOC%LTM%' OR LSRCON_GEV_NOTE LIKE '%NESSUN%SERV%ATTIV%')
	END 
	ELSE
	IF @NOMEQUERY = 'CONRINUNCE_TOTORICEVITORI'
	BEGIN

		--- TOTORICEVITORI
		select COUNT(*) from lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE 
                   LSRCON_GEV_KEY_ID_RICEV LIKE '1%'
		   AND lsrcon_gev_FLAG_ANAG = '1' 
	           AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO                  		                       
                   AND  A.lsr01A_TAB_GIOCHI_09 IN ('0', '2')
                   AND (LSRCON_GEV_NOTE LIKE '%RINUNC%' OR LSRCON_GEV_NOTE  
                       LIKE '%REVOC%LTM%' OR LSRCON_GEV_NOTE LIKE '%NESSUN%SERV%ATTIV%')
	END 
	ELSE
	IF @NOMEQUERY = 'CONRINUNCE_POSGIALLO'
	BEGIN
		--- POS GIALLO
		select COUNT(*) from lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
		AND lsrcon_gev_FLAG_ANAG = '1' 
	        AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO                  		                       
                AND  A.lsr01A_TAB_GIOCHI_09 IN ('0', '2')
                AND (LSRCON_GEV_NOTE LIKE '%RINUNC%' 
                OR LSRCON_GEV_NOTE  LIKE '%REVOC%LTM%' 
                OR LSRCON_GEV_NOTE LIKE '%NESSUN%SERV%ATTIV%')

	END 
	ELSE
	IF @NOMEQUERY = 'CONRINUNCE_POSMARRONE'
	BEGIN

		--- POS MARRONE
		select COUNT(*) from lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '4%'
		AND lsrcon_gev_FLAG_ANAG = '1' 
                AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO                  		                       
                AND  A.lsr01A_TAB_GIOCHI_09 IN ('0', '2')
                AND (LSRCON_GEV_NOTE LIKE '%RINUNC%' OR LSRCON_GEV_NOTE  
                LIKE '%REVOC%LTM%' OR LSRCON_GEV_NOTE LIKE '%NESSUN%SERV%ATTIV%')

	END 
	ELSE
	IF @NOMEQUERY = 'CONRINUNCE_LOTTEL'
	BEGIN
		--- LOTTERIE TELEMATICHE
		select COUNT(*) from lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE lsrcon_gev_COD_LOTTO  LIKE 'LI%'
		AND lsrcon_gev_FLAG_ANAG = '1' 
                AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO                  		                       AND  A.lsr01A_TAB_GIOCHI_09 IN ('0', '2')
                AND (LSRCON_GEV_NOTE LIKE '%RINUNC%' 
                OR LSRCON_GEV_NOTE  LIKE '%REVOC%LTM%' OR LSRCON_GEV_NOTE LIKE '%NESSUN%SERV%ATTIV%')

	END 
END
GO
