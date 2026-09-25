/****** Object:  StoredProcedure [dbo].[in_gestione3]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.in_gestione3    Script Date: 05/10/00 15.55.31 ******/
CREATE   PROCEDURE [dbo].[in_gestione3] @Ricevitoria char(10),@data char(8),@Piano char(10), @hr int output AS
  --inizio procedura
  BEGIN
    --se vanno controllate tutte le ricevitorie del piano
    --inizio tutte
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
        DECLARE @Flag int 
        DECLARE @Commutata int 
        DECLARE @PureDedicata int 
        DECLARE @Addestramento int 
        DECLARE @Stampante int 
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

        EXEC @Esito=msdb..ut_aa011 71,'SPInGest3.txt',71,'SPInGest3'
        EXEC @Esito2=msdb..ut_aa011 71,'LSR000.txt',71,'SPInGest3'
        IF @Esito=0 
          EXEC msdb..ut_aa009 71,'SPInGest3.txt',71,'SPInGest3' 
        IF @Esito2=0
          EXEC msdb..ut_aa009 71,'LSR000.txt',71,'SPInGest3' 
        IF @@ERROR <> 0
          BEGIN
            SELECT @hr=@@ERROR
            ROLLBACK TRANSACTION   
            RETURN
          END
        BEGIN
          SELECT @Gia_in_gestione = COUNT(*) 
          FROM soggetti_in_gestione
          WHERE id_soggetto=@Ricevitoria
          SELECT @PureDedicata=0
          --Se la ricevitoria non è già in gestione
          IF @Gia_in_gestione=0 
            --Inizio non in gestione
            BEGIN
              SELECT @Flag=a.flag_provv, @Cognome=a.cognome, @Nome=a.nome
              , @prov=a.prov, @NumRicev=a.num_ricev 
              FROM P_Sort AS a
              WHERE a.id_soggetto=@Ricevitoria
              IF @Flag=1
                --Inizio se il flag è 1
                BEGIN
                  -- Verifico se il soggetto è attivato in commutata
		  -- 24/06/2005 evito il controllo di attivazione in commutata
                  /*
		  IF @record2sa IS NULL OR @record2sa=''
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
		  */
		  SELECT @Commutata=1
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
                              IF @record3sa IS NULL OR @record3sa=''
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
                              --Se non è attivata in commutata
                              IF @PureDedicata=0
                                SELECT @appo2="01"               
                              ELSE
                                SELECT @appo2="11"                
                              SELECT @Blank='0000'
                              SELECT @Index=LEN(RTRIM(LTRIM(STR(@NumRicev))))
                              IF @Index<4 
                                SELECT @appo3=SUBSTRING(@Blank,1,(4-@Index))+RTRIM(LTRIM(STR(@NumRicev)))
                              ELSE
                                SELECT @appo3=RTRIM(LTRIM(STR(@NumRicev)))
                              INSERT INTO soggetti_in_gestione VALUES (@Ricevitoria, current_timestamp, @Data, @Piano)                                   
                              SELECT @appo=@Ricevitoria+LTRIM(RTRIM(@Data))+@Cognome+@Nome+@appo2+@Prov+@Appo3
                              INSERT INTO temporanea VALUES(@Ricevitoria,@Piano)
                              EXEC  @hr1=msdb..ut_aa010 71,71,'LSR000.txt',@appo,'SPInGest3' 
                              IF @hr1 <> 0
                                BEGIN
                                  ROLLBACK TRANSACTION   
                                  SELECT @hr=@hr1 
                                  RETURN
                                END
                            --Fine se ha la stampante
                            END  
                        --Fine se ha l'addestramento
                        END   
                    --Fine attivata in dedicata
                    END                      
                --Fine se il flag è 1
                END
              ELSE
                --Inizio se il flag è <> 1 (non può passare in gestione)
                BEGIN
                  PRINT @Ricevitoria+' Flag<>1'
                  --Fine se il flag è <>1
                END
            --Fine non in gestione
            END               
          ELSE
            --Inizio già in gestione
            BEGIN
              PRINT @Ricevitoria+' Già in gestione'
            --Fine già in gestione
            END
        END  
    --fine tutte
    COMMIT
  --fine procedura
  END
GO
