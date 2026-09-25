/****** Object:  StoredProcedure [dbo].[Report_ricevitorie_e_documenti_inviati_F101]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Report_ricevitorie_e_documenti_inviati_F101] 
-- @DATA    CHAR(8),
 @SERVIZIO  CHAR(2),
 @CODRICEV  CHAR(6),
 @SIGLAPROV  CHAR(2),
 @COMUNE   CHAR(20),
 @REGIONE  CHAR(2),
 @RUOTA   CHAR(2),
 @STATOSERVIZIO  CHAR(2),
 @FLAG_BRIEF  CHAR(1),
 @XML    CHAR(1),
 @ESITO    INT OUT
 
AS
DECLARE  @TIPOSTATO CHAR(1)
  ,@DATA  CHAR(8) 
SELECT @ESITO = 0
 
--IF (@DATA IS NULL) OR (RTRIM(LTRIM(@DATA)) = '')
--BEGIN
 --SELECT @ESITO = 9
 --RAISERROR ('MANCA LA DATA',16,1)
 --RETURN @ESITO
 SELECT @DATA = convert(char(8),getdate(),112)
--END
 
IF (@SERVIZIO IS NULL) OR (RTRIM(LTRIM(@SERVIZIO)) = '')
BEGIN
 SELECT @ESITO = 9
 RAISERROR ('MANCA IL NOME DEL SERVIZIO',16,1)
 RETURN @ESITO
END
 
IF (@CODRICEV IS NULL) OR (RTRIM(LTRIM(@CODRICEV)) = '')
BEGIN
 SELECT @CODRICEV = '*'
END
 
IF (@SIGLAPROV IS NULL) OR (RTRIM(LTRIM(@SIGLAPROV)) = '')
BEGIN
 SELECT @SIGLAPROV = '*'
END
 
IF (@COMUNE IS NULL) OR (RTRIM(LTRIM(@COMUNE)) = '')
BEGIN
 SELECT @COMUNE = '*'
END
 
IF (@REGIONE IS NULL) OR (RTRIM(LTRIM(@REGIONE)) = '')
BEGIN
 SELECT @REGIONE = '*'
END
 
IF (@RUOTA IS NULL) OR (RTRIM(LTRIM(@RUOTA)) = '')
BEGIN
 SELECT @RUOTA = '*'
END
 
IF (@STATOSERVIZIO IS NULL) OR (RTRIM(LTRIM(@STATOSERVIZIO)) = '')
BEGIN
 SELECT @STATOSERVIZIO = '*'
END
 

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
 
SELECT   LSR.lsr01a_key_id_ricev    AS Cod_Lottomatica 
 ,LSR.lsr01a_cod_amm     AS Cod_Amministrativo
 ,LSR.lsr01a_data_attiv     AS Data_Decorrenza_Lotto
 ,RTRIM(LTRIM(LSR.lsr01a_cognome))   AS Cognome
 ,RTRIM(LTRIM(LSR.lsr01a_nome))    AS Nome
 ,RTRIM(LTRIM(LSR.lsr01a_comune_ricev))   AS Comune
 ,LSR.lsr01a_prov_ricev     AS Provincia
 ,LSR.lsr01a_sigla_reg     AS Sigla_Reg
 ,LSR.lsr01a_tab_giochi_F101    AS Stato_F101_lsr01a
 
 ,ISNULL(CON.lsrcon_f101_data_contratto, '')  AS Data_Contratto_F101 
 ,ISNULL(APS.lsraps_F101_data_invio_doc, '')  AS Data_Invio_APS
 
 ,ISNULL(FID.lsrfid_f101_id_soc, '')   AS Soc_Fidejussione
 ,ISNULL(FID.lsrfid_f101_importo, 0.00)   AS Importo_Fidejussione
 ,ISNULL(FID.lsrfid_f101_anno_rif, '')   AS Anno_Fidejussione
 
 ,ISNULL(SER.lsrser_f101_stato, '')   AS Stato_F101
 ,ISNULL(SER.lsrser_f101_data_decor, '')  AS Data_Decorrenza_Stato
 
 ,ISNULL(RIN.lsrrin_data_rinuncia, '')   AS Data_Rinuncia
 ,ISNULL(RIN.lsrrin_data_rinuncia_rinuncia, '')  AS Data_Rinuncia_Rinuncia
 
INTO #TMP_RESULT
 
FROM   condiviso.dbo.lsr01a LSR
 ,lsrcon_f101 CON
 ,lsraps_f101 APS
 ,lsrfid_f101 FID
 ,lsrser_f101 SER
 ,lsrrin RIN
 
WHERE  LSR.lsr01a_key_id_ricev  *= CON.lsrcon_f101_key_id_ricev
AND  LSR.lsr01a_key_id_ricev  *= APS.lsraps_f101_key_id_ricev
AND  LSR.lsr01a_key_id_ricev  *= FID.lsrfid_f101_key_id_ricev
AND  LSR.lsr01a_key_id_ricev  *= SER.lsrser_f101_key_id_ricev
AND LSR.lsr01a_key_id_ricev  *= RIN.lsrrin_key_id_ricev
 
AND (@CODRICEV = '*'   OR lsr01a_key_id_ricev = @CODRICEV)
AND  (@SIGLAPROV = '*'   OR lsr01a_prov_ricev = @SIGLAPROV)
AND  (@COMUNE = '*'    OR lsr01a_comune_ricev = @COMUNE)
AND  (@REGIONE = '*'   OR lsr01a_sigla_reg = @REGIONE)
AND  (@RUOTA = '*'    OR (SUBSTRING(lsr01a_key_id_ricev,1,2) = @RUOTA))
AND  (@STATOSERVIZIO = '*'   OR lsr01a_tab_giochi_bollo = @STATOSERVIZIO)
 
AND  (SUBSTRING(lsr01a_key_id_ricev,1,2) > '99')
AND  (SUBSTRING(lsr01a_key_id_ricev,2,1) <> 'X')
AND  (SUBSTRING(lsr01a_key_id_ricev,2,1) <> 'W')
 
AND  CON.lsrcon_f101_flag_anag = '1'
 
AND APS.lsraps_f101_flag_anag = '1'
 
AND  FID.lsrfid_f101_flag_anag = '1'
AND  FID.lsrfid_f101_anno_rif = SUBSTRING(CONVERT(CHAR(8),GETDATE(),112),1,4)
 
AND  SER.lsrser_f101_flag_validita = 'Y' 
AND  SER.lsrser_f101_data_decor = 
  (SELECT MAX(a.lsrser_f101_data_decor) 
  FROM lsrser_f101 a
  WHERE a.lsrser_f101_flag_validita = 'Y' 
  AND a.lsrser_f101_key_id_ricev = LSR.lsr01a_key_id_ricev)
 
AND  RIN.lsrrin_flag_anag = 1
AND  RIN.lsrrin_codice_servizio = '02'
 
 
 
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
 
 
 
SELECT  Ricevitoria = lsrrad_key_id_ricev, 
 Movimentazione = 
 CASE lsrrad_tipo_movimentazione
  WHEN 'A' THEN 'Attivazione'
  WHEN 'R' THEN 'Riattivazione'
  WHEN 'D' THEN 'Disattivazione'
  ELSE lsrrad_tipo_movimentazione
 END, 
 Richiesta_da = 
 CASE lsrrad_fonte
  WHEN 'A' THEN 'Associazione, ' + rtrim(ltrim(lsrass_descrizione))
  WHEN 'R' THEN isnull(lsrent_descrizione,'Regione')
  WHEN 'Q' THEN 'Questura, '
  WHEN 'L' THEN 'Lottomatica, ' + 
   case 
    when lsrrad_tipo_movimentazione = 'D' and lsrrad_causale_lottomatica  = '3'
     then 'inadempienze contrattuali.'  
    when lsrrad_tipo_movimentazione = 'D' and lsrrad_causale_lottomatica  = '4'
     then 'rinuncia.'  
    when lsrrad_tipo_movimentazione = 'D' and lsrrad_causale_lottomatica  = '5'
     then 'cambio titolarita''.'  
    when lsrrad_tipo_movimentazione = 'D' and lsrrad_causale_lottomatica  = '7'
     then 'contrattualistica incompleta'  
    when lsrrad_tipo_movimentazione = 'D' and lsrrad_causale_lottomatica  = '8'
     then 'revoca concessione del Lotto.'  
    when lsrrad_tipo_movimentazione = 'R' and lsrrad_causale_lottomatica  = '3'
     then 'risoluzione inadempienze contrattuali'
    when lsrrad_tipo_movimentazione = 'R' and lsrrad_causale_lottomatica  = '5'
     then 'cambio titolarita'''
    when lsrrad_tipo_movimentazione = 'R' and lsrrad_causale_lottomatica  = '8'
     then 'riattivazione del Lotto'
    when lsrrad_tipo_movimentazione = 'R' and lsrrad_causale_lottomatica  = '9'
     then 'annullamento rinuncia'
   end
 
  ELSE isnull(lsrrad_fonte,'')
 END, 
 Data_decorrenza = isnull(lsrrad_data_decor,''), 
 Data_documento = isnull(lsrrad_data_doc,''), 
 Data_invio_doc = isnull(lsrrad_data_invio_doc,''), 
 Prot_Doc = isnull(lsrrad_num_prot_doc,'')
 
INTO #tmp_result_2
 
FROM  lsrrad,
 lsrass,
 lsrent, 
 lsrfon,
 #tmp_result
 
WHERE  lsrrad_tipo_servizio = '02'
 
AND  lsrrad_cod_associazione  *= lsrass_key_cod_ass
AND  lsrrad_cod_ente   *= lsrent_key_cod_ente
AND  lsrrad_tipo_movimentazione  *= lsrfon_key_tipo
AND  lsrrad_causale_lottomatica  *= lsrfon_key_fonte
 
AND lsrrad_key_id_ricev   = Cod_Lottomatica
AND  lsrrad_data_decor   > Data_Decorrenza_Stato
 

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
 
 
 
SELECT   1      AS TAG
 ,NULL      AS PARENT
 ,Cod_Lottomatica    AS [ricev!1!Cod_Lottomatica]
 ,Cod_Amministrativo    AS [ricev!1!Cod_Amministrativo]
 ,Data_Decorrenza_Lotto    AS [ricev!1!Data_Decorrenza_Lotto]
 ,Cognome    AS [ricev!1!Cognome]
 ,Nome     AS [ricev!1!Nome]
 ,Comune     AS [ricev!1!Comune]
 ,Provincia    AS [ricev!1!Provincia]
 ,Sigla_Reg    AS [ricev!1!Sigla_Reg]
 ,Stato_F101_lsr01a   AS [ricev!1!Stato_F101_lsr01a]
 
 ,Data_Contratto_F101   AS [ricev!1!Data_Contratto_F101]
 ,Data_Invio_APS     AS [ricev!1!Data_Invio_APS]
 
 ,Soc_Fidejussione    AS [ricev!1!Soc_Fidejussione]
 ,Importo_Fidejussione    AS [ricev!1!Importo_Fidejussione]
 ,Anno_Fidejussione    AS [ricev!1!Anno_Fidejussione]
 
 ,Stato_F101    AS [ricev!1!Stato_F101]
 ,Data_Decorrenza_Stato    AS [ricev!1!Data_Decorrenza_Stato]
 ,Data_Rinuncia     AS [ricev!1!Data_Rinuncia]
 ,Data_Rinuncia_Rinuncia   AS [ricev!1!Data_Rinuncia_Rinuncia]
 
 ,NULL     AS [paletti!2!Cod_Lottomatica]
 ,NULL     AS [paletti!2!Movimentazione]
 ,NULL     AS [paletti!2!Richiesta_da]
        ,NULL     AS [paletti!2!Data_decorrenza]
 ,NULL     AS [paletti!2!Data_documento]
 ,NULL     AS [paletti!2!Data_invio_doc]
 ,NULL     AS [paletti!2!Prot_Doc]
 
FROM #TMP_RESULT
 
UNION ALL
 
SELECT   2    AS TAG
 ,1    AS PARENT
 ,Ricevitoria  AS [ricev!1!Cod_Lottomatica]
 ,NULL    AS [ricev!1!Cod_Amministrativo]
 ,NULL    AS [ricev!1!Data_Decorrenza_Lotto]
 ,NULL    AS [ricev!1!Cognome]
 ,NULL    AS [ricev!1!Nome]
 ,NULL    AS [ricev!1!Comune]
 ,NULL   AS [ricev!1!Provincia]
 ,NULL   AS [ricev!1!Sigla_Reg]
 ,NULL    AS [ricev!1!Stato_F101_lsr01a]
 
 ,NULL   AS [ricev!1!Data_Contratto_F101]
 ,NULL    AS [ricev!1!Data_Invio_Contratto_F101]
 
 ,NULL    AS [ricev!1!Soc_Fidejussione]
 ,NULL    AS [ricev!1!Importo_Fidejussione]
 ,NULL    AS [ricev!1!Anno_Fidejussione]
 
 ,NULL   AS [ricev!1!Stato_F101]
 ,NULL    AS [ricev!1!Data_Decorrenza_Stato]
 ,NULL    AS [ricev!1!Data_Rinuncia]
 ,NULL    AS [ricev!1!Data_Rinuncia_Rinuncia]
 
 ,Ricevitoria   AS [paletti!2!Cod_Lottomatica]
 ,Movimentazione  AS [paletti!2!Movimentazione]
 ,Richiesta_da  AS [paletti!2!Richiesta_da]
        ,Data_decorrenza AS [paletti!2!Data_decorrenza]
 ,Data_documento  AS [paletti!2!Data_documento]
 ,Data_invio_doc  AS [paletti!2!Data_invio_doc]
 ,Prot_Doc   AS [paletti!2!Prot_Doc]
 
FROM  #TMP_RESULT a,
 #TMP_RESULT_2 b 
WHERE a.Cod_Lottomatica = b.ricevitoria
 
order by [ricev!1!Cod_Lottomatica], [paletti!2!Cod_Lottomatica], tag
 
FOR XML EXPLICIT
 
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
GO
