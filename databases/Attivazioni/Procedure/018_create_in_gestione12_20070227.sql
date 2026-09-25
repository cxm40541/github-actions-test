/****** Object:  StoredProcedure [dbo].[in_gestione12_20070227]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------
/****** Object:  Stored Procedure dbo.in_gestione12    Script Date: 05/10/00 15.55.33 ******/
CREATE  PROCEDURE [dbo].[in_gestione12_20070227] @Data Char(10), @hr int output
AS
  --inizio procedura
  BEGIN TRANSACTION
    DECLARE @Esito int
    DECLARE @Esito2 int
    DECLARE @Record2at varchar(3)
    DECLARE @Record2sa varchar(5)
    DECLARE @Record3at varchar(3)
    DECLARE @Record3sa varchar(5)
    DECLARE @Record5at varchar(3)
    DECLARE @Record5sa varchar(5)
    DECLARE @Record7at varchar(3)
    DECLARE @Record7sa varchar(5)
    DECLARE @Ricevitoria char(6) 
    DECLARE @Flag int 
    DECLARE @Dedicata int
    DECLARE @PureCommutata int 
    DECLARE @Addestramento int 
    DECLARE @Stampante int 
    DECLARE @hr1 int
    DECLARE @object int
    DECLARE @newfile int
    DECLARE @appo char(68), @appo4 char(250)
----------mod 27/06/2002
    DECLARE @appo5 char(6), @DataTrasf char(10)
----------mod 27/06/2002
------------------mod 06/08/2002
    DECLARE @cap varchar(5)
------------------fine mod 06/08/2002
    DECLARE @appo2 char(2)
    DECLARE @Cognome char(24)
    DECLARE @Nome char(20)
    DECLARE @Prov char(2)
    DECLARE @NumRicev int
    DECLARE @Blank char(4)
    DECLARE @Index int
    DECLARE @Appo3 char(4)
    DECLARE @piano char(10) 
    DECLARE @CEM char(2)
    --cursore per la lettura di tutti i piani
    DECLARE ScorriPiani INSENSITIVE CURSOR
    FOR select distinct(id_piano)
----------mod 27/06/2002
    ,substring(convert(char(10),fine,103),7,4)+substring(convert(char(10),fine,103),4,2)+substring(convert(char(10),fine,103),1,2)
----------fine mod 27/06/2002
    FROM piani 
    WHERE  (tipo_piano='NA' or tipo_piano='PR' or tipo_piano='BL')
    ORDER BY 
----------mod 27/06/2002
    2 desc,
----------mod 27/06/2002
    id_piano Desc
    DECLARE @Gia_in_gestione int
        IF len(@piano)=8 and substring(@piano,1,4)='14NP'  --caso vecchi piani
	BEGIN
	 -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'attivazione della linea commutata
	    SELECT @Record2at=cod_attivita, @Record2sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=8 and tipo_piano='BL' 
	    -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'attivazione della linea dedicata
	    SELECT @Record3at=cod_attivita, @Record3sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=9 and tipo_piano='BL' 
	    -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'addestramento gestore
	    SELECT @Record5at=cod_attivita, @Record5sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=14 and tipo_piano='BL' 
	    -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'attivazione stampante
	    SELECT @Record7at=cod_attivita, @Record7sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=12 and tipo_piano='BL' 
	END
	ELSE --caso piani di tipo 14NP%
	BEGIN
	    -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'attivazione della linea commutata
	    SELECT @Record2at=cod_attivita, @Record2sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=2 and tipo_piano='NA' 
	    -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'attivazione della linea dedicata
	    SELECT @Record3at=cod_attivita, @Record3sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=3 and tipo_piano='NA' 
	    -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'addestramento gestore
	    SELECT @Record5at=cod_attivita, @Record5sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=5 and tipo_piano='NA' 
	    -- Lettura del record della tabella legenda che ci restituisce
	    -- il codice attività ed il codice dello stato d'avanzamento
	    -- corrispondenti all'attivazione stampante
	    SELECT @Record7at=cod_attivita, @Record7sa=cod_avanzamento
	    FROM legenda
	    WHERE id_record=7 and tipo_piano='NA' 
	END

    EXEC @Esito=msdb..ut_aa011 71,'SPInGest12.txt',71,'SPInGest12'
    EXEC @Esito2=msdb..ut_aa011 71,'LSR00A.txt',71,'SPInGest12'
    IF @Esito=0 
      EXEC msdb..ut_aa009 71,'SPInGest12.txt',71,'SPInGest12' 
    IF @Esito2=0
      EXEC msdb..ut_aa009 71,'LSR00A.txt',71,'SPInGest12' 
    IF @@ERROR <> 0
      BEGIN
        SELECT @hr=@@ERROR
        ROLLBACK TRANSACTION   
        DEALLOCATE ScorriPiani
        RETURN
      END
    OPEN ScorriPiani
    FETCH NEXT FROM ScorriPiani INTO @Piano
----------------mod 27/07/2002
   ,@Datatrasf
----------------fine mod 27/07/2002
    WHILE @@fetch_status=0
      --inizio scorrimento piani
      BEGIN
        DECLARE ScorriRicevitorie INSENSITIVE CURSOR FOR
        SELECT DISTINCT(soggetti_del_piano.id_soggetto)
        ,p_sort.flag_provv, p_sort.cognome, p_sort.nome
        ,p_sort.prov, p_sort.num_ricev 
        ,SUBSTRING(a.lsr01a_codice_magazzino,1,2)
------------------mod 06/08/2002
        ,a.lsr01a_cap
------------------fine mod 06/08/2002
        FROM soggetti_del_piano, p_sort                 
        , condiviso.dbo.lsr01a a
        WHERE id_piano=@Piano
          AND soggetti_del_piano.id_soggetto=a.lsr01a_key_id_ricev
          AND soggetti_del_piano.id_soggetto=p_sort.id_soggetto
          AND p_sort.flag_provv=1
          AND soggetti_del_piano.id_soggetto NOT IN 
         (SELECT id_soggetto FROM soggetti_in_gestione)
        --cursore per la lettura di tutti i soggetti di un piano
        OPEN ScorriRicevitorie
        FETCH NEXT FROM ScorriRicevitorie INTO @Ricevitoria
        ,@Flag, @Cognome, @Nome
        ,@prov, @NumRicev, @CEM
------------------mod 06/08/2002
        ,@cap
------------------fine mod 06/08/2002
        WHILE @@fetch_status=0
          --inizio scorrimento ricevitorie
          BEGIN
            SELECT @PureCommutata=0
            --Inizio se il flag è 1
            BEGIN
              -- Verifico se il soggetto è attivato in dedicata
              IF @record3sa IS NULL OR @record3sa=''
                SELECT @Dedicata = count(*)
                FROM attivita_pianificate
                WHERE id_piano=@Piano
                  AND id_soggetto=@Ricevitoria
                  AND id_attivita=@record3at
                  AND convert(char(10),fine,103)<>'01/01/1900'
              ELSE
                SELECT @Dedicata = count(*) 
                FROM stato_avanzamento
                WHERE id_piano=@Piano
                  AND id_soggetto=@Ricevitoria
                  AND id_attivita=@record3at
                  AND cod_avanzamento=@record3sa
                  AND convert(char(10),fine,103)<>'01/01/1900'
              --Se non è attivata in dedicata
              IF @Dedicata=0
                --Inizio non attivata in dedicata 
                BEGIN
                  PRINT @Ricevitoria+' non in dedicata'
                END
              --Se è attivata in dedicata 
              ELSE
                --Inizio attivata in dedicata
                BEGIN
                  IF @record5sa IS NULL OR @record5sa=''
                    SELECT @Addestramento = count(*)  
                    FROM attivita_pianificate
                    WHERE id_piano=@Piano
                      AND id_soggetto=@Ricevitoria
                      AND id_attivita=@record5at
                      AND convert(char(10),fine,103)<>'01/01/1900'
                  ELSE
                    SELECT @Addestramento = count(*)  
                    FROM stato_avanzamento    
                    WHERE id_piano=@Piano
                      AND id_soggetto=@Ricevitoria
                      AND id_attivita=@record5at
                      AND cod_avanzamento=@record5sa   
                      AND convert(char(10),fine,103)<>'01/01/1900'
                  --Se non ha l'addestramento
                  IF @Addestramento=0 
                    --Inizio se non ha l'addestramento
                    BEGIN
                      PRINT @Ricevitoria+' non ha addestramento'
                      --Fine se non ha l'addestramento
                    END
                  --Se ha l'addestramento
                  ELSE
                    --Inizio se ha l'addestramento
                    BEGIN
                      IF @record7sa IS NULL OR @record7sa=''
                        SELECT @Stampante = count(*)  
                        FROM attivita_pianificate
                        WHERE id_piano=@Piano
                          AND id_soggetto=@Ricevitoria
                          AND id_attivita=@record7at
                          AND convert(char(10),fine,103)<>'01/01/1900'
                      ELSE
                        SELECT @Stampante = count(*)  
                        FROM stato_avanzamento
                        WHERE id_piano=@Piano
                          AND id_soggetto=@Ricevitoria
                          AND id_attivita=@record7at
                          AND cod_avanzamento=@record7sa
                          AND convert(char(10),fine,103)<>'01/01/1900'
                      --Se non ha la stampante
                      IF @Stampante=0
                        --Inizio se non ha la stampante       
                        BEGIN
                          PRINT @Ricevitoria+ ' senza stampante'
                        --Fine se non ha la stampante
                        END
                      --Se ha la stampante
                      ELSE
                        --Inizio se ha la stampante
                        BEGIN
                          -- Verifico se il soggetto è attivato pure in commutata
                          IF @record2sa IS NULL OR @record2sa=''
                            SELECT @PureCommutata = count(*)
                            FROM attivita_pianificate
                            WHERE id_piano=@Piano
                              AND id_soggetto=@Ricevitoria
                              AND id_attivita=@record2at
                              AND convert(char(10),fine,103)<>'01/01/1900'
                          ELSE
                            SELECT @PureCommutata = count(*) 
                            FROM stato_avanzamento
                            WHERE id_piano=@Piano
                              AND id_soggetto=@Ricevitoria
                              AND id_attivita=@record2at
                              AND cod_avanzamento=@record2sa
                              AND convert(char(10),fine,103)<>'01/01/1900'
                          --Se non è attivata in dedicata
                          IF @PureCommutata=0
                            SELECT @appo2='10'               
                          ELSE
                            SELECT @appo2='11'                
                          SELECT @Blank='0000'
                          SELECT @Index=LEN(RTRIM(LTRIM(STR(@NumRicev))))
                          IF @Index<4 
                            SELECT @appo3=SUBSTRING(@Blank,1,(4-@Index))+RTRIM(LTRIM(STR(@NumRicev)))
                          ELSE
                            SELECT @appo3=RTRIM(LTRIM(STR(@NumRicev)))

                          SELECT @COGNOME=IsNull(@COGNOME,'                        ')
                          SELECT @NOME=IsNull(@NOME,'                    ')
                          SELECT @PROV=IsNull(@Prov,'  ')
                          SELECT @appo=@Ricevitoria+LTRIM(RTRIM(@Data))+@Cognome+@Nome+@appo2+@Prov+@appo3+@CEM
--------------------------mod 27/06/2002
                          SELECT @appo5=''
                          SELECT @appo5=Ricevitoria 
                          FROM temporanea 
                          WHERE ricevitoria=@ricevitoria
                          if @appo5='' 
                            BEGIN
--------------------------fine mod 27/06/2002
------------------------------mod 06/08/2002
                              SELECT @CAP=IsNull(@CAP,'')
                              IF LTRIM(RTRIM(@cap))<>'' and LEN(LTRIM(RTRIM(@cap)))=5 and @cap<>'00000' 
                                BEGIN 
------------------------------fine mod 06/08/2002
                                  INSERT INTO soggetti_in_gestione VALUES (@Ricevitoria, current_timestamp, @Data, @Piano)                                   
                                  INSERT INTO temporanea VALUES(@Ricevitoria,@Piano)
                                  EXEC  @hr1=msdb..ut_aa010 71,71,'LSR00A.txt',@appo,'SPInGest12' 
                                  IF @hr1 <> 0
                                    BEGIN
                                      ROLLBACK TRANSACTION   
                                      CLOSE ScorriRicevitorie
                                      DEALLOCATE ScorriRicevitorie
                                      CLOSE ScorriPiani
                                      DEALLOCATE ScorriPiani
                                      SELECT @hr=@hr1 
                                      RETURN
                                    END
------------------------------mod 06/08/2002
                                END
------------------------------fine mod 06/08/2002  
--------------------------mod 27/06/2002
                            END 
--------------------------fine mod 27/06/2002
                        --Fine se ha la stampante
                        END  
                    --Fine se ha l'addestramento
                    END   
                --Fine attivata in dedicata
                END                      
            --Fine se il flag è 1
            END
            FETCH NEXT FROM ScorriRicevitorie INTO @Ricevitoria
            ,@Flag, @Cognome, @Nome
            ,@prov, @NumRicev, @CEM  
------------------mod 06/08/2002
            ,@cap
------------------fine mod 06/08/2002
          --fine scorrimento ricevitorie
          END 
        CLOSE ScorriRicevitorie
        DEALLOCATE ScorriRicevitorie
        FETCH NEXT FROM ScorriPiani INTO @Piano
----------------mod 27/07/2002
        ,@Datatrasf
----------------fine mod 27/07/2002
      --fine scorrimento piani
      END 
    CLOSE ScorriPiani
    DEALLOCATE ScorriPiani
  --fine procedura
  COMMIT
GO
