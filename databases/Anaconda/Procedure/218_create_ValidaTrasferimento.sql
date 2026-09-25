/****** Object:  StoredProcedure [dbo].[ValidaTrasferimento]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE procedure [dbo].[ValidaTrasferimento]
  @codLotto char(6),
  @tipoTrasf char(1),
  @dataProvv char(8),
  @numeroProvv char(14),
  @firma char(17),
  @errore varchar(255) out
AS
DECLARE 
  @lsrric_cap  char(5),
  @lsrric_indirizzo char(40),
  @lsrric_comune char(24),
  @lsrtra_provincia char(2),
  @decor_dal char(8),
  @cod_tab char(4),
  @data char(8)

BEGIN TRANSACTION
  select  @data= convert(char(8), getDate(),112)
  select  @errore = ''	

  SELECT @decor_dal=lsrpro_tra_decor_dal,
  @cod_tab=lsrpro_tra_cod_tab,
  @lsrric_indirizzo=lsrpro_tra_indirizzo,
  @lsrric_comune=lsrpro_tra_comune,
  @lsrric_cap=lsrpro_tra_cap,
  @lsrtra_provincia=lsrpro_tra_provincia
  from lsrpro_tra
  WHERE lsrpro_tra_key_id_ricev = @codLotto
  AND lsrpro_tra_key_tipo_rec   = @tipoTrasf
  AND lsrpro_tra_key_data_provv = @dataProvv
  AND lsrpro_tra_key_prog_provv = @numeroProvv    

  -- FACCIO l'INSERT NELLA TABELLA LSRPRO
  INSERT INTO dbo.lsrpro  
  SELECT 
    lsrpro_tra_key_id_ricev AS lsrpro_key_id_ricev,
    'T' AS lsrpro_key_tipo_rec,
    convert (char(8), getdate(),112) AS  lsrpro_data_ins,
    convert(char(8),replace(replace(substring(CONVERT (VARCHAR(22), GETDATE(),121),12,25),':',''),'.','')) AS lsrpro_ora_ins,
--    Replace(convert(char(8), getdate(),114),':','') AS lsrpro_ora_ins,
    lsrpro_tra_key_data_provv AS lsrpro_key_data_provv,
    lsrpro_tra_key_prog_provv AS lsrpro_key_prog_provv,
    lsrpro_tra_causale AS lsrpro_causale,
    @firma AS lsrpro_firma,
    ' ' as lsrpro_emanato,
    @decor_dal AS lsrpro_decor_dal,
    lsrpro_tra_decor_al AS lsrpro_decor_al,
    ' ' AS lsrpro_tassa,
    ' ' AS lsrpro_anno,
    ' ' AS lsrpro_massimale,
    lsrpro_tra_cod_tab AS lsrpro_cod_tab,
    lsrpro_tra_flag_annul AS lsrpro_flag_annul,
    'Y' AS lsrpro_flag_validita,
    '00000000' as lsrpro_ft_vos
    FROM lsrpro_tra WHERE 
    lsrpro_tra_key_id_ricev = @codLotto
    AND lsrpro_tra_key_tipo_rec   = @tipoTrasf
    AND lsrpro_tra_key_data_provv = @dataProvv
    AND lsrpro_tra_key_prog_provv = @numeroProvv    
IF @@ERROR <> 0 
    BEGIN
	SELECT @errore = @errore + ' - ' + CONVERT(CHAR(20),@@ERROR) + ' ERRORE IN INSERIMENTO LSRPRO'
	ROLLBACK TRANSACTION
	RETURN 
    END 
ELSE
    BEGIN 
    -- EFFETTUO L'INSERT DI UNA NUOVO RECORD NELLA TABELLA LSRRIC
    INSERT INTO
        lsrric 
	SELECT 
 	 lsrric_key_id_ricev, 
	 convert (char(8), getdate(),112) AS  lsrric_key_data_ins,
              convert(char(8),replace(replace(substring(CONVERT (VARCHAR(22), GETDATE(),121),12,25),':',''),'.',''))  AS lsrric_key_ora_ins,
	 --Replace(convert(char(8), getdate(),114),':','') AS lsrric_key_ora_ins,
	 lsrric_cod_amm,
	 lsrric_data_attiv,
	 lsrric_data_cessaz, 
	 lsrric_decod_ricev,  
	 @lsrric_comune AS lsrric_comune_ricev, 
	 lsrric_prov_ricev, 
	 @lsrric_cap  AS lsrric_cap,
	 @lsrric_indirizzo AS lsrric_indirizzo,
	 lsrric_stato,
	 lsrric_tel_ricevitoria,
	 lsrric_sigla_ic, 
	 lsrric_sigla_reg, 
	 lsrric_chiusura, 
	 lsrric_tab_speciali, 
	 lsrric_codice_magazzino,
	 lsrric_data_riattiv, 
	 lsrric_flag_esercizio, 
	 lsrric_num_terminali, 
	 lsrric_id_tab, 
	 @firma AS lsrric_firma,   
	 lsrric_stato_attuale, 
	 @dataProvv as lsrric_data_provv, 
	 @numeroProvv as lsrric_prog_provv, 
	 'T' as lsrric_tipo_provv, 
	 @decor_dal AS lsrric_data_validita,
	 '00000000' as lsrric_ora_validita,
	 'Y' as lsrric_flag_validita,
	 '00000000' as lsrric_ft_vos 
	  FROM 
	    lsrric A
	  WHERE 
	    (lsrric_data_validita + lsrric_ora_validita) = 
	    (select max(lsrric_data_validita + lsrric_ora_validita) from lsrric 
	     WHERE lsrric_key_id_ricev = A.lsrric_key_id_ricev
	       AND  lsrric_data_validita <= @DATA 
	       AND  lsrric_flag_validita = 'Y')
	 AND lsrric_key_id_ricev = @codLotto
 AND  lsrric_flag_validita = 'Y'
	-- AND (lsrric_cap    <>@lsrric_cap or lsrric_indirizzo<> @lsrric_indirizzo)
    IF @@ERROR =  0 
	BEGIN

          -- EFFETTUO L'update sulla tabella lsric ddei record con data validita maggiore della data validita in input
	update lsrric 
               set lsrric_comune_ricev = @lsrric_comune,
	       lsrric_cap =@lsrric_cap,
	       lsrric_indirizzo =@lsrric_indirizzo
            where 
                   lsrric_data_validita> @decor_dal
                   and lsrric_key_id_ricev=@codLotto
         -- EFFETTUO L'UPDATE SULLA TABELLA LSRPRO_TRA
	 UPDATE lsrpro_tra  
	 SET 
              lsrpro_tra_ft_vos = @data
	 WHERE
	          lsrpro_tra_key_id_ricev   = @codLotto
	      AND lsrpro_tra_key_tipo_rec   = @tipoTrasf
	      AND lsrpro_tra_key_data_provv = @dataProvv
	      AND lsrpro_tra_key_prog_provv = @numeroProvv    
          if @@ERROR = 0 
            BEGIN


              ---------------------------------------------------------
              exec dbo.GESTIONE_LSRVAR_IND @codLotto,@lsrric_indirizzo,@lsrric_cap,@lsrric_comune ,  @lsrtra_provincia,MsgErr
              if @@ERROR = 0 
                BEGIN
                  commit TRANSACTION
                  SELECT @errore = 'VALIDAZIONE OK' 
                end
              else
                begin
                  rollback TRANSACTION
                  SELECT @errore = @errore + ' - ' + CONVERT(CHAR(20),@@ERROR)+ 'ERRORE IN AGGIORNAMENTO TABELLA LSRVAR' 
                end   
          ----------------------------

              RETURN     
            END
          else
            begin
              SELECT @errore = @errore + ' - ' + CONVERT(CHAR(20),@@ERROR) + ' ERRORE NELL AGGIORNAMENTO DI LSRPRO_TRA'
              rollback TRANSACTION
              return
            end    
	END
   ELSE
	BEGIN
          SELECT @errore = @errore + ' - ' + CONVERT(CHAR(20),@@ERROR) + ' ERRORE NELL INSERIMENTO DI LSRRIC'
	  ROLLBACK TRANSACTION
	  RETURN 
	END 
END 
   
--COMMIT TRANSACTION
RETURN
GO
