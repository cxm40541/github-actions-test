/****** Object:  StoredProcedure [dbo].[in_gestione9_20070227]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Stored Procedure dbo.in_gestione9    Script Date: 05/10/00 15.55.34 ******/
CREATE  PROCEDURE [dbo].[in_gestione9_20070227] @Data char(8), @hr int output AS
  --inizio procedura
  BEGIN TRANSACTION
    DECLARE @Esito int
    DECLARE @Esito2 int
    DECLARE @Ricevitoria char(6),@Piano char(10)
    DECLARE @Record2at varchar(3)
    DECLARE @Record2sa varchar(5)
    DECLARE @Record3at varchar(3)
    DECLARE @Record3sa varchar(5)
    DECLARE @Record5at varchar(3)
    DECLARE @Record5sa varchar(5)
    DECLARE @Record7at varchar(3)
    DECLARE @Record7sa varchar(5)
    DECLARE @Flag int , @ESISTECA001 int
    DECLARE @Commutata int , @Dedicata int
    DECLARE @PureDedicata int 
    DECLARE @Addestramento int 
    DECLARE @Stampante int, @ProgrOperazione int
    DECLARE @hr1 int
    DECLARE @object int
    DECLARE @newfile int
    DECLARE @appo char(68)
    DECLARE @appo2 char(2)
    DECLARE @Cognome char(24)
    DECLARE @Nome char(20)
    DECLARE @Prov char(2)
    DECLARE @NumRicev char(4)
    DECLARE @Blank char(4)
    DECLARE @Index int
    DECLARE @Appo3 char(4)
    DECLARE @Appo4 char(68)
----------mod 27/06/2002
    DECLARE @appo5 char(6), @DataTrasf char(10)
----------mod 27/06/2002
------------------mod 06/08/2002
    DECLARE @cap varchar(5)
------------------fine mod 06/08/2002
    DECLARE @ESISTEVA int, @CommOK int
    DECLARE @Gia_in_gestione int
    DECLARE @CEM char(2)
    --cursore per la lettura di tutti i piani
    DECLARE ScorriPiani INSENSITIVE CURSOR FOR
    SELECT DISTINCT(id_piano)
----------mod 27/06/2002
    ,substring(convert(char(10),fine,103),7,4)+substring(convert(char(10),fine,103),4,2)+substring(convert(char(10),fine,103),1,2)
----------fine mod 27/06/2002
    FROM piani 
    WHERE (tipo_piano='NA' or tipo_piano='PR' or tipo_piano='BL')
      AND id_piano>'N000'
    ORDER BY 
----------mod 27/06/2002
    2 desc,
----------mod 27/06/2002
    id_piano Desc
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

    EXEC @Esito=msdb..ut_aa011 71,'SPInGest9.txt',71,'SPInGest9'
    --EXEC @Esito2=msdb..ut_aa011 71,'LSRCOM.txt',71,'SPInGest9'
    IF @Esito=0 
      EXEC msdb..ut_aa009 71,'SPInGest9.txt',71,'SPInGest9' 
    --IF @Esito2=0
    --  EXEC msdb..ut_aa009 71,'LSRCOM.txt',71,'SPInGest9' 
    IF @@ERROR <> 0
      BEGIN
        SELECT @hr=@@ERROR
        ROLLBACK TRANSACTION   
        DEALLOCATE ScorriPiani
        RETURN
      END
    --creazione ogetto OK
    BEGIN 
      OPEN ScorriPiani
      FETCH NEXT FROM ScorriPiani INTO @Piano
----------------mod 27/07/2002
   ,@Datatrasf
----------------fine mod 27/07/2002
      WHILE @@fetch_status=0
        --inizio scorrimento piani
        BEGIN
          --cursore per la lettura di tutti i soggetti di un piano
          DECLARE ScorriRicevitorie INSENSITIVE CURSOR FOR
          SELECT DISTINCT(soggetti_del_piano.id_soggetto)
          ,p_sort.flag_provv, p_sort.cognome, p_sort.nome
          ,p_sort.prov, p_sort.num_ricev 
          ,SUBSTRING(lsr01a_codice_magazzino,1,2)
------------------mod 06/08/2002
        ,lsr01a_cap
------------------fine mod 06/08/2002
          FROM soggetti_del_piano, p_sort, condiviso.dbo.lsr01a
          WHERE id_piano=@Piano
            AND soggetti_del_piano.id_soggetto=lsr01a_key_id_ricev
            AND soggetti_del_piano.id_soggetto=p_sort.id_soggetto
            AND p_sort.flag_provv=1
            AND soggetti_del_piano.id_soggetto not in (SELECT id_soggetto FROM soggetti_in_gestione)
          --apertura cursore di scorrimento delle ricevitorie all'interno di un piano 
          OPEN ScorriRicevitorie
          FETCH NEXT FROM ScorriRicevitorie 
          INTO @Ricevitoria,@Flag, @Cognome, @Nome
          , @prov, @NumRicev, @CEM 
------------------mod 06/08/2002
        ,@cap
------------------fine mod 06/08/2002
          WHILE @@fetch_status=0
            --inizio scorrimento ricevitorie
            BEGIN
              -- Verifico se il soggetto è attivato in dedicata
              IF @record3sa is null or @record3sa=''
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
                --Inizio se non è attivata in dedicata
                BEGIN
                  -- Verifico se il soggetto è attivato in commutata
                  IF @record2sa is null or @record2sa=''
                    SELECT @Commutata = count(*)
                    FROM attivita_pianificate
                    WHERE id_piano=@Piano
                      AND id_soggetto=@Ricevitoria
                      AND id_attivita=@record2at
                      AND convert(char(10),fine,103)<>'01/01/1900'
                  ELSE
                    SELECT @Commutata = count(*) 
                    FROM stato_avanzamento
                    WHERE id_piano=@Piano
                      AND id_soggetto=@Ricevitoria
                      AND id_attivita=@record2at
                      AND cod_avanzamento=@record2sa
                      AND convert(char(10),fine,103)<>'01/01/1900'
                  --Se non è attivata in commutata
                  IF @Commutata=0
                    --Inizio non attivata in commutata 
                    BEGIN
                      PRINT @Ricevitoria+' non in commutata'
                    END
                  --Se è attivata in commutata 
                  ELSE
                    --Inizio attivata in commutata
                    BEGIN
                      SELECT @ProgrOperazione = progr_operazione
                      FROM stato_avanzamento
                      WHERE id_piano=@Piano
                        AND id_soggetto=@Ricevitoria
                        AND id_attivita=@record2at
                        AND cod_avanzamento=@record2sa
                      SELECT @EsisteCA001=COUNT(*) 
                      FROM problematiche
                      WHERE cod_problematica='CA001'
                        AND id_piano=@Piano
                        AND id_soggetto=@Ricevitoria
                        AND progr_operazione=@ProgrOperazione
                      --Se la ricevitoria ha la commutata ma non la problematica CA001 
                      IF @EsisteCA001=0 
                        BEGIN
                          PRINT 'Senza CA001'
                        END 
                      --Se la ricevitoria ha la commutata e la problematica CA001 
                      ELSE
                        --Inizio ricevitoria con commutata e CA001  
                        BEGIN
                          SELECT @EsisteVA=COUNT(*) 
                          FROM problematiche
                          WHERE cod_problematica IN ('VA010','VA011')
                            AND id_piano=@Piano
                            AND id_soggetto=@Ricevitoria
                            AND progr_operazione=@ProgrOperazione
                            AND CONVERT(char(10),fine,103)='01/01/1900'
                          --Se esistono VA010 oppure VA011 
                          IF @EsisteVA<>0  
                            --se esistono VA010 oppure VA011 
                            BEGIN  
                              SELECT @CommOK='S'
                            END
                          --Se non esistono VA010 ne VA011                                 
                          ELSE
                            --Inizio se non esistono VA010 ne VA011                                 
                            BEGIN
                              IF @record5sa is null or @record5sa=''
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
                                  IF @record7sa is null or @record7sa=''
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
                                      -- Verifico se il soggetto è attivato pure in dedicata
                                      IF @record3sa is null or @record3sa=''
                                        SELECT @PureDedicata = count(*)
                                        FROM attivita_pianificate
                                        WHERE id_piano=@Piano
                                          AND id_soggetto=@Ricevitoria
                                          AND id_attivita=@record3at
                                          AND convert(char(10),fine,103)<>'01/01/1900'
                                      ELSE
                                        SELECT @PureDedicata = count(*) 
                                        FROM stato_avanzamento
                                        WHERE id_piano=@Piano
                                          AND id_soggetto=@Ricevitoria
                                          AND id_attivita=@record3at
                                          AND cod_avanzamento=@record3sa
                                          AND convert(char(10),fine,103)<>'01/01/1900'
                                      IF @PureDedicata=0
                                        SELECT @appo2='01'               
                                      ELSE
                                        SELECT @appo2='11'                
                                      SELECT @Blank='0000'
                                      SELECT @Index=LEN(RTRIM(LTRIM(STR(@NumRicev))))
                                      IF @Index<4 
                                        SELECT @appo3=SUBSTRING(@Blank,1,(4-@Index))+RTRIM(LTRIM(STR(@NumRicev)))
                                      ELSE
                                        SELECT @appo3=RTRIM(LTRIM(STR(@NumRicev)))
                                      SELECT @COGNOME=IsNull(@Cognome,'                        ') 
                                      SELECT @NOME=IsNull(@nome,'                    ') 
                                      SELECT @Prov=IsNull(@Prov,'  ') 
                                      SELECT @appo=@Ricevitoria+LTRIM(RTRIM(@Data))+@Cognome+@Nome+@appo2+@Prov+@Appo3+@CEM
                                      SELECT @appo4=@Ricevitoria+LTRIM(RTRIM(@Data))+@Cognome+@Nome+@appo2+@Prov+@Appo3+@CEM
--------------------------mod 27/06/2002
                                      SELECT @appo5=''
                                      SELECT @appo5=Ricevitoria 
                                      FROM temporanea 
                                      WHERE ricevitoria=@ricevitoria
                                      IF @appo5='' 
                                        BEGIN
--------------------------fine mod 27/06/2002
------------------------------mod 06/08/2002
                                          SELECT @CAP=IsNull(@CAP,'')
                                          IF LTRIM(RTRIM(@cap))<>'' and LEN(LTRIM(RTRIM(@cap)))=5 and @cap<>'00000' 
                                            BEGIN 
------------------------------fine mod 06/08/2002
                                              INSERT INTO temporanea VALUES(@Ricevitoria,@Piano)
                                              INSERT INTO soggetti_in_gestione VALUES (@Ricevitoria, current_timestamp, @Data, @Piano)                                   
                                              EXEC  @hr1=msdb..ut_aa010 71,71,'LSR00A.txt',@appo,'SPInGest9' 
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
                            --Fine se non esistono VA010 ne VA011
                            END
                        --Fine ricevitoria con commutata e CA001  
                        END
                    --Fine attivata in commutata
                    END                      
                --Fine se non è attivata in dedicata
                END
              ELSE
                BEGIN
                  PRINT @Ricevitoria+'Gia in dedicata' 
                END
              FETCH NEXT FROM ScorriRicevitorie 
              INTO @Ricevitoria, @Flag, @Cognome, @Nome
              ,@prov, @NumRicev, @CEM 
------------------mod 06/08/2002
              ,@cap
------------------fine mod 06/08/2002
            --fine scorrimento ricevitorie
            END 
          CLOSE ScorriRicevitorie
          DEALLOCATE ScorriRicevitorie
          FETCH NEXT FROM ScorriPiani INTO @Piano
        --fine scorrimento piani
        END
      Close ScorriPiani
      Deallocate ScorriPiani
    --fine creazione oggetto OK
    END
  --fine procedura
  COMMIT
GO
