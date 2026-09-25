/****** Object:  StoredProcedure [dbo].[ANA_REP_RIEPSETTCONT]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE        PROCEDURE [dbo].[ANA_REP_RIEPSETTCONT]
@NOMEQUERY       CHAR(30)   
AS
BEGIN


IF @NOMEQUERY = 'TITATTLOTTO'
BEGIN
	-- Lotto_Attuali_Titolari
	select COUNT(*) from lsrcon_gev
	WHERE
              LSRCON_GEV_KEY_ID_RICEV LIKE '3%'
	AND lsrcon_gev_FLAG_ANAG = '1'    

END 
ELSE
IF @NOMEQUERY = 'TITATTGS'
BEGIN
	--- GS_Attuali_Titolari
	select  COUNT(*) from lsrcon_gev
	WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '1%'
	AND lsrcon_gev_FLAG_ANAG = '1' 

END
ELSE
IF @NOMEQUERY = 'TITATTPOSGIALLO'
BEGIN
	--- Pos_Giallo_Attuali_Titolari
	select COUNT(*) from lsrcon_gev
	WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
	AND lsrcon_gev_FLAG_ANAG = '1' 

END
ELSE
IF @NOMEQUERY = 'TITATTPOSMARRONE'
BEGIN
	--- Pos_Marrone_Attivi
	select  COUNT(*) from lsrcon_gev, CONDIVISO.DBO.LSR01A
	WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '4%'
	AND lsrcon_gev_FLAG_ANAG = '1' 
	AND lsrcon_gev_COD_LOTTO = LSR01A_KEY_ID_RICEV
	AND LSR01A_TAB_GIOCHI_09 = '1'
END
ELSE
IF @NOMEQUERY = 'TITNOATTPOSMARRONE'
BEGIN

	--- Pos_Marrone_nON_Attivi
	select  COUNT(*) from lsrcon_gev, CONDIVISO.DBO.LSR01A
	WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '4%'
	AND lsrcon_gev_FLAG_ANAG = '1' 
	AND lsrcon_gev_COD_LOTTO = LSR01A_KEY_ID_RICEV
	AND LSR01A_TAB_GIOCHI_09 IN ( '0', '2')

END
ELSE


IF @NOMEQUERY = 'TITVECLOTTO'
BEGIN

	--- Lotto_Vecchi_Titolari (NON ESISTE IN LSRCON_GEV CONTRATTO COPN FLAG ANAG = 1)
	SELECT COUNT(*)
	FROM lsrcon_gev
	WHERE  LSRCON_GEV_KEY_ID_RICEV LIKE '3%'
	AND lsrcon_gev_FLAG_ANAG > '1'
	AND  lsrcon_gev_COD_LOTTO NOT IN (
	select DISTINCT(lsrcon_gev_COD_LOTTO) from lsrcon_gev
	WHERE 
            LSRCON_GEV_KEY_ID_RICEV LIKE '3%'
	AND lsrcon_gev_FLAG_ANAG = '1')


END
ELSE
IF @NOMEQUERY = 'TITVECGS'
BEGIN

	--GS_Vecchi_TitolarI
	select COUNT(*) from lsrcon_gev
	WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '1%'
	AND lsrcon_gev_FLAG_ANAG > '1'
	AND  lsrcon_gev_COD_LOTTO NOT IN (
		select DISTINCT(lsrcon_gev_COD_LOTTO) from lsrcon_gev
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '1%'
		AND lsrcon_gev_FLAG_ANAG = '1')


END
ELSE
IF @NOMEQUERY = 'TITVECPOSGIALLO'
BEGIN
	--Pos_Giallo_Vecchi_Titolari
	select COUNT(*) from lsrcon_gev
	WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
	AND lsrcon_gev_FLAG_ANAG > '1'
	AND  lsrcon_gev_COD_LOTTO NOT IN (
		select DISTINCT(lsrcon_gev_COD_LOTTO) from lsrcon_gev
		WHERE LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
           AND lsrcon_gev_FLAG_ANAG = '1')

END
ELSE

IF @NOMEQUERY = 'DELTA_TITVECPOSGIALLOCC'
BEGIN
	-- DELTA TITOLARI POS GIALLO PROBLEMATICHE CC
	select COUNT(*) from lsrcon_gev
	WHERE  LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
	AND lsrcon_gev_FLAG_ANAG = '1' 
	AND (
	    (lsrcon_gev_NOTE NOT LIKE '%rinunc%' AND lsrcon_gev_NOTE NOT LIKE '%revoc%ltm%' AND lsrcon_gev_NOTE NOT LIKE '%esente%' AND lsrcon_gev_NOTE NOT LIKE '%in fase d%' AND lsrcon_gev_NOTE  LIKE '%protest%')
	    OR 
	    (lsrcon_gev_NOTE NOT LIKE '%rinunc%' AND lsrcon_gev_NOTE NOT LIKE '%revoc%ltm%' AND lsrcon_gev_NOTE NOT LIKE '%esente%' AND lsrcon_gev_NOTE NOT LIKE '%in fase d%' AND lsrcon_gev_NOTE  LIKE '%priv%visur%')
	    OR
	    (lsrcon_gev_NOTE NOT LIKE '%rinunc%' AND lsrcon_gev_NOTE NOT LIKE '%revoc%ltm%' AND lsrcon_gev_NOTE NOT LIKE '%esente%' AND lsrcon_gev_NOTE NOT LIKE '%in fase d%' AND lsrcon_gev_NOTE LIKE '%att%cess%' )
            )


END
ELSE
IF @NOMEQUERY = 'DELTA_TITVECPOSGIALLORIN'
BEGIN
	-- DELTA TITOLARI POS GIALLO RINUNCE
	select COUNT(*) from lsrcon_gev
	WHERE   LSRCON_GEV_KEY_ID_RICEV LIKE '9%'
	AND lsrcon_gev_FLAG_ANAG = '1' 
	AND (lsrcon_gev_NOTE LIKE '%RINUNC%' OR lsrcon_gev_NOTE LIKE '%REVOC%LTM%')

END
END
GO
