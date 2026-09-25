/****** Object:  StoredProcedure [dbo].[ANA_REP_STAT_NOFIDNORID]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ANA_REP_STAT_NOFIDNORID] 
@NOMEQUERY         	CHAR(40)
AS 
BEGIN

        IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDCC_GEN'
	BEGIN	
		--*******************************************************
		--*******CONTRATTI TITOLARE ATTUALE NON ATTIVE *********
		--******* No Fid e Rid con Pbls CCIAA
		--*******************************************************
		--- GENERALE
		SELECT  count(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND  A.lsr01A_TAB_GIOCHI_09 = '0'
AND 
(
(
lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%PROTESTAT%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
OR 
(
  lsrcon_Gev_note Like '%RIV%VISUR%CAMERAL%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
 And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
 And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ*ATTIV%' 
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
And lsrcon_Gev_note Like '%ATTIV%CES%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
And lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
)
		AND lsrcon_gev_COD_LOTTO NOT IN (
		SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
		WHERE lsrFID_gev_FLAG_ANAG = '1' 
                AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
		)
		AND lsrcon_gev_COD_LOTTO NOT IN (
		 SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 AND LCR01A_TIPO_GIOCO='09'
		 AND LCR01A_KEY_DATA_FINE_VAL = '99999999'
		)

	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDCC_LOT'
	BEGIN


		--LOTTISTI
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND (ISNUMERIC(lsrcon_gev_COD_LOTTO) = 0)
            AND LSRCON_GEV_KEY_ID_RICEV LIKE '3%'
		AND  lsr01A_TAB_GIOCHI_09 = '0'
AND 
(
(
lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%PROTESTAT%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
OR 
(
  lsrcon_Gev_note Like '%RIV%VISUR%CAMERAL%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
 And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
 And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ*ATTIV%' 
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
And lsrcon_Gev_note Like '%ATTIV%CES%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
And lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
)

		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')

	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDCC_TRICEV'
	BEGIN

		--- TOTORICEVITORI
		SELECT  COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '1%'
		AND  lsr01A_TAB_GIOCHI_09 = '0'
AND 
(
(
lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%PROTESTAT%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
OR 
(
  lsrcon_Gev_note Like '%RIV%VISUR%CAMERAL%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
 And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
 And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ*ATTIV%' 
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
And lsrcon_Gev_note Like '%ATTIV%CES%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
And lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
)

		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')


	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDCC_POSGIA'
	BEGIN

		--- POS GIALLO
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND lsr01A_TAB_GIOCHI_09 = '0'
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
AND 
(
(
lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%PROTESTAT%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
OR 
(
  lsrcon_Gev_note Like '%RIV%VISUR%CAMERAL%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
 And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
 And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ*ATTIV%' 
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
And lsrcon_Gev_note Like '%ATTIV%CES%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
And lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
)

		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1'
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112)) 
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')


	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDCC_POSMAR'
	BEGIN

		--- POS MARRONE
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND lsr01A_TAB_GIOCHI_09 = '0'
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '4%'
AND 
(
(
lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%PROTESTAT%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
OR 
(
  lsrcon_Gev_note Like '%RIV%VISUR%CAMERAL%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
 And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
 And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ*ATTIV%' 
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
And lsrcon_Gev_note Like '%ATTIV%CES%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
And lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
)

		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')

	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDCC_LOTTEL'
	BEGIN

		--- LOTTERIE TELEMATICHE
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND lsr01A_TAB_GIOCHI_09 = '0'
		AND lsrcon_gev_COD_LOTTO  LIKE 'LI%'
AND 
(
(
lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PROTESTAT%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%PROTESTAT%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
OR 
(
  lsrcon_Gev_note Like '%RIV%VISUR%CAMERAL%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%'
And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
 And lsrcon_Gev_note Like '%PRIV%VISUR%CAMERAL%'
 And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ*ATTIV%' 
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%'
And lsrcon_Gev_note Like '%ATT%PREGIUDIZIEVOL%'
And lsrcon_Gev_note Not Like '%RINUNC%' 
)
OR 
(
  lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
And lsrcon_Gev_note Like '%ATTIV%CES%'
And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
And lsrcon_Gev_note Like '%ATTIV%CES%' 
And lsrcon_Gev_note Not Like '%RINUNC%'
)
)


		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')


	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDNOCC_GEN'
	BEGIN

		--*******CONTRATTI TITOLARE ATTUALE NON ATTIVE *********
		--******* No Fid e Rid no Pbls CCIAA
		--- GENERALE
		SELECT  count(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND A.LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND  A.lsr01A_TAB_GIOCHI_09 = '0'
AND 
( 
      lsrcon_Gev_note is NULL
      OR
      (lsrcon_Gev_note Not Like '%ATT%PREGIUDIZIEVOL%' 
	And lsrcon_Gev_note Not Like '%ATTIV%CES%' 
        And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
        And lsrcon_Gev_note Not Like '%PRIV%VISUR%CAMERAL%' 
	And lsrcon_Gev_note Not Like '%PROTESTAT%' 
        And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
        And lsrcon_Gev_note Not Like '%RINUNC%'
       )
    )

		AND lsrcon_gev_COD_LOTTO NOT IN (
		SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
		WHERE lsrFID_gev_FLAG_ANAG = '1'
                AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112)) 
		)
		AND lsrcon_gev_COD_LOTTO NOT IN (
		 SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 AND LCR01A_TIPO_GIOCO='09'
		 AND LCR01A_KEY_DATA_FINE_VAL = '99999999'
		)

	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDNOCC_LOT'
	BEGIN

		--LOTTISTI
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND (ISNUMERIC(lsrcon_gev_COD_LOTTO) = 0)
            AND LSRCON_GEV_KEY_ID_RICEV LIKE '3%'
 		AND  lsr01A_TAB_GIOCHI_09 = '0'
AND 
( 
      lsrcon_Gev_note is NULL
      OR
      (lsrcon_Gev_note Not Like '%ATT%PREGIUDIZIEVOL%' 
	And lsrcon_Gev_note Not Like '%ATTIV%CES%' 
        And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
        And lsrcon_Gev_note Not Like '%PRIV%VISUR%CAMERAL%' 
	And lsrcon_Gev_note Not Like '%PROTESTAT%' 
        And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
        And lsrcon_Gev_note Not Like '%RINUNC%'
       )
    )
		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1'
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112)) 
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')

	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDNOCC_TRICEV'
	BEGIN

		--- TOTORICEVITORI
		SELECT  COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '1%'
		AND  lsr01A_TAB_GIOCHI_09 = '0'
AND 
( 
      lsrcon_Gev_note is NULL
      OR
      (lsrcon_Gev_note Not Like '%ATT%PREGIUDIZIEVOL%' 
	And lsrcon_Gev_note Not Like '%ATTIV%CES%' 
        And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
        And lsrcon_Gev_note Not Like '%PRIV%VISUR%CAMERAL%' 
	And lsrcon_Gev_note Not Like '%PROTESTAT%' 
        And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
        And lsrcon_Gev_note Not Like '%RINUNC%'
       )
    )
		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')

	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDNOCC_POSGIA'
	BEGIN

		--- POS GIALLO
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND lsr01A_TAB_GIOCHI_09 = '0'
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
AND 
( 
      lsrcon_Gev_note is NULL
      OR
      (lsrcon_Gev_note Not Like '%ATT%PREGIUDIZIEVOL%' 
	And lsrcon_Gev_note Not Like '%ATTIV%CES%' 
        And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
        And lsrcon_Gev_note Not Like '%PRIV%VISUR%CAMERAL%' 
	And lsrcon_Gev_note Not Like '%PROTESTAT%' 
        And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
        And lsrcon_Gev_note Not Like '%RINUNC%'
       )
    )
		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')

	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDNOCC_POSMAR'
	BEGIN

		--- POS MARRONE
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND lsr01A_TAB_GIOCHI_09 = '0'
		AND LSRCON_GEV_KEY_ID_RICEV LIKE '4%'
AND 
( 
      lsrcon_Gev_note is NULL
      OR
      (lsrcon_Gev_note Not Like '%ATT%PREGIUDIZIEVOL%' 
	And lsrcon_Gev_note Not Like '%ATTIV%CES%' 
        And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
        And lsrcon_Gev_note Not Like '%PRIV%VISUR%CAMERAL%' 
	And lsrcon_Gev_note Not Like '%PROTESTAT%' 
        And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
        And lsrcon_Gev_note Not Like '%RINUNC%'
       )
    )
		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')


	END 
	ELSE
	IF @NOMEQUERY = 'CONNOATT_NOFIDNORIDNOCC_LOTTEL'
	BEGIN

		--- LOTTERIE TELEMATICHE
		SELECT COUNT(*) FROM lsrcon_gev, CONDIVISO.DBO.LSR01A A
		WHERE  lsrcon_gev_FLAG_ANAG = '1' 
		AND LSR01A_KEY_ID_RICEV = lsrcon_gev_COD_LOTTO
		AND lsr01A_TAB_GIOCHI_09 = '0'
		AND lsrcon_gev_COD_LOTTO  LIKE 'LI%'
AND 
( 
      lsrcon_Gev_note is NULL
      OR
      (lsrcon_Gev_note Not Like '%ATT%PREGIUDIZIEVOL%' 
	And lsrcon_Gev_note Not Like '%ATTIV%CES%' 
        And lsrcon_Gev_note Not Like '%NESSUN%SERVIZ%ATTIV%' 
        And lsrcon_Gev_note Not Like '%PRIV%VISUR%CAMERAL%' 
	And lsrcon_Gev_note Not Like '%PROTESTAT%' 
        And lsrcon_Gev_note Not Like '%REVOC%LTM%' 
        And lsrcon_Gev_note Not Like '%RINUNC%'
       )
    )
		AND lsrcon_gev_COD_LOTTO NOT IN (
			SELECT lsrFID_gev_COD_LOTTO  FROM lsrFID_gev
			WHERE lsrFID_gev_FLAG_ANAG = '1' 
                        AND lsrfid_gev_anno_rif = Year(CONVERT(CHAR, GETDATE(), 112))
			)
			AND lsrcon_gev_COD_LOTTO NOT IN (
		 	SELECT DISTINCT LCR01A_KEY_ID_RICEV AS RICEV FROM Riscossioni.dbo.LCR01A
		 	WHERE LCR01A_DATA_INIZIO_VAL <= CONVERT(CHAR, GETDATE(), 112)
		 	AND LCR01A_TIPO_GIOCO='09'
		 	AND LCR01A_KEY_DATA_FINE_VAL = '99999999')

	END 
END
GO
