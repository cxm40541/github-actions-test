/****** Object:  StoredProcedure [dbo].[pop_consuntivi6]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.pop_consuntivi6    Script Date: 05/10/00 15.55.29 ******/
CREATE PROCEDURE [dbo].[pop_consuntivi6] AS
  --inizio della procedura
  BEGIN
    DECLARE @IdPiano varchar(10)
    DECLARE @Inizio datetime
    DECLARE @Fine datetime
    DECLARE @IdSoggetto varchar(6)
    DECLARE @IdSoggOp varchar(6)
    DECLARE @IdSoggAnn varchar(6)
    DECLARE @Pianificate int
    DECLARE @Pianificate2 int
    DECLARE @Annullate int
    DECLARE @Annullate2 varchar(6)
    DECLARE @Operative int
    DECLARE @DaAttivare int
    DECLARE @Conta int
    DECLARE @SenzaFlag int
    DECLARE @StatoScorriRicevitorie int
    DECLARE @StatoScorriOp int
    DECLARE @StatoPSort int
    DECLARE @StatoScorriPiani int
    DECLARE @StatoScorriAnn int
    DECLARE @FoundOp int  
    DECLARE @Dedicata int
    DECLARE @OpInCommutata int  
    DECLARE @NonOp int
    DECLARE @NonOperativeInCommutata int
    DECLARE @NonOpDedicata int
    DECLARE @NonOpDedicataStm int
    DECLARE @NonOpNeCommNeDed int
    DECLARE @NonOpDedicataAdd int
    DECLARE @NonOpCommutata int
    DECLARE @FlagProvv int
    DECLARE @idSogg char(6)
    DECLARE @NonSospese int
    DECLARE @IsSospesa int
    DECLARE @Resto int
    DECLARE @Sospese int
    DECLARE @InAttProvv int
    DECLARE @SenzaPSort int
    DECLARE @TrovaPSort int
    DECLARE @DaAttivare2 int
    DECLARE @MancStampante int
    DECLARE @MancAdd int
    DECLARE @NonAll int
    --variabili per i codici attività e avanzamento letti da legenda
    DECLARE @Record2at varchar(3)
    DECLARE @Record2sa varchar(5)
    DECLARE @Record3at varchar(3)
    DECLARE @Record3sa varchar(5)
    DECLARE @Record5at varchar(3)
    DECLARE @Record5sa varchar(5)
    DECLARE @Record7at varchar(3)
    DECLARE @Record7sa varchar(5)

    --ripulitura delle tabelle 
    DELETE FROM consuntivi
    -- WHERE da_attivare - operative>0
      
    DECLARE ScorriPSort CURSOR
    SCROLL
    FOR SELECT a.flag_provv, a.id_soggetto
    FROM p_sort
    AS a
    ORDER BY a.id_soggetto 

    OPEN ScorriPSort
 
    --Inizio scorri piani
    BEGIN --TRANSACTION
      -- dichiarazione del cursore per leggere tutti i codici dei piani
      DECLARE ScorriPiani INSENSITIVE CURSOR
      FOR SELECT DISTINCT(id_piano), inizio, fine
      FROM piani
      WHERE (tipo_piano='NA' or tipo_piano='PR')
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
      OPEN ScorriPiani
      -- Per ogni piano letto si considerano pure la sua data
      -- di inizio e quella di fine
      FETCH NEXT FROM ScorriPiani INTO @IdPiano, @Inizio, @Fine
      SELECT @StatoScorriPiani = @@fetch_status   
      --Ciclo per la lettura di tutti i piani
      WHILE @StatoscorriPiani=0
        -- inizio lettura di tutti i piani
        BEGIN
          --Riposizionamento sul primo record di P_sort per ogni nuovo piano
          SELECT @FlagProvv=null
          SELECT @TrovaPSort=0

          FETCH FIRST FROM ScorriPSort INTO @FlagProvv, @idSogg

          SELECT @StatoPSort=@@FETCH_STATUS
          
          DECLARE ScorriRicevitorie INSENSITIVE CURSOR FOR
          SELECT a.id_soggetto 
          FROM soggetti_del_piano AS a, condiviso.dbo.lsr01a AS b
          WHERE a.id_piano=@IdPiano
            AND (a.id_soggetto = b.lsr01a_key_id_ricev
            AND b.lsr01a_data_cessaz ='00000000')
          UNION
          SELECT a.id_soggetto 
          FROM soggetti_del_piano AS a 
          WHERE a.id_piano=@IdPiano
            AND a.id_soggetto NOT IN 
            (SELECT a.id_soggetto 
             FROM soggetti_del_piano AS a, condiviso.dbo.lsr01a AS b    
             WHERE a.id_piano = @IdPiano 
               AND a.id_soggetto = b.lsr01a_key_id_ricev)
          ORDER by a.id_soggetto

          SELECT @Annullate = 0
          SELECT @Operative = 0
          SELECT @Annullate = Count(*)
          FROM dbo.soggetti_del_piano AS a, condiviso.dbo.lsr01a AS b
          WHERE a.id_soggetto = b.lsr01a_key_id_ricev
            AND b.lsr01a_data_cessaz <>'00000000'
            AND id_piano=@IdPiano
          
          -- Conteggio di tutti i soggetti contenuti in ogni piano
          -- ma annullati (stato lsr ='R')
          DECLARE ScorriAnnullate CURSOR SCROLL READ_ONLY 
          FOR 
          SELECT a.id_soggetto
          FROM dbo.soggetti_del_piano AS a, condiviso.dbo.lsr01a AS b
          WHERE a.id_soggetto = b.lsr01a_key_id_ricev
            AND b.lsr01a_data_cessaz <>'00000000'
            AND id_piano=@IdPiano

          OPEN ScorriAnnullate
          FETCH NEXT FROM ScorriAnnullate INTO @IdSoggAnn
          SELECT @StatoScorriAnn = @@fetch_status
          WHILE @StatoscorriAnn = 0
            BEGIN
              UPDATE soggetti_del_piano  
              SET flag='A' WHERE id_soggetto=@IdSoggAnn
              FETCH NEXT FROM ScorriAnnullate INTO @IdSoggAnn
              SELECT @StatoscorriAnn = @@fetch_status
            END
          CLOSE ScorriAnnullate
          DEALLOCATE ScorriAnnullate

          -- Cursore di tutti i soggetti contenuti in ogni piano
          -- operative (stato lsr ='A')
          DECLARE ScorriOperative CURSOR SCROLL READ_ONLY 
          FOR 
          SELECT a.id_soggetto
          FROM dbo.soggetti_del_piano AS a, condiviso.dbo.lsr01a AS b
          WHERE a.id_soggetto = b.lsr01a_key_id_ricev
            AND b.lsr01a_stato='A'
            AND id_piano=@IdPiano
          ORDER BY a.id_soggetto                        
          SELECT @Pianificate2=0         
          -- Conteggio di tutti i soggetti contenuti in ogni piano
          SELECT @Pianificate2 = Count(*)
          FROM soggetti_del_piano
          WHERE id_piano=@IdPiano

          OPEN ScorriOperative

          FETCH NEXT FROM ScorriOperative INTO @IdSoggOp

          SELECT @StatoScorriOp = @@fetch_status
          SELECT @Operative = @@CURSOR_ROWS 
          PRINT 'Annullate:'+STR(@Annullate)
          PRINT 'Operative:'+STR(@@CURSOR_ROWS)
          SELECT @Pianificate = 0 
          SELECT @DaAttivare = 0 
          SELECT @Conta = 0 
          SELECT @OpInCommutata = 0 
          SELECT @Sospese = 0
          SELECT @NonSospese = 0
          SELECT @NonOp = 0
          SELECT @NonOperativeInCommutata = 0
          SELECT @NonOpNeCommNeDed = 0
          SELECT @Resto = 0
          SELECT @DaAttivare2 = 0
          SELECT @InAttProvv = 0
          SELECT @MancStampante = 0
          SELECT @SenzaPSort = 0
          SELECT @MancAdd = 0
          SELECT @NonAll = 0

          OPEN ScorriRicevitorie

          SELECT @DaAttivare = @@CURSOR_ROWS

          FETCH NEXT FROM ScorriRicevitorie INTO @IdSoggetto

          SELECT @StatoscorriRicevitorie = @@fetch_status
          --Ciclo per la lettura di tutti i soggetti di un piano
          WHILE @StatoscorriRicevitorie = 0
            -- inizio lettura di tutti i soggetti
            BEGIN
              SELECT @SenzaFlag = 0
              SELECT @FoundOp = 0                 
              SELECT @IsSospesa = 0                
              SELECT @Pianificate = @Pianificate + 1
              GOTO RicercaOperative
              ContinuaElaborazione:
              --se il soggetto è operativo     
              IF @FoundOp = 1
                BEGIN
                  -- Verifico se il soggetto è attivato in dedicata
                  IF @record3sa is null or @record3sa=''
                    SELECT @Dedicata = count(*)
                    FROM attivita_pianificate
                    WHERE id_piano=@IdPiano
                      AND id_soggetto=@IdSoggetto
                      AND id_attivita=@record3at
                      AND convert(char(10),fine,103)<>'01/01/1900'
                  ELSE
                    SELECT @Dedicata = count(*) 
                    FROM stato_avanzamento
                    WHERE id_piano=@IdPiano
                      AND id_soggetto=@IdSoggetto 
                      AND id_attivita=@record3at
                      AND cod_avanzamento=@record3sa
                      AND convert(char(10),fine,103)<>'01/01/1900'
                  IF @Dedicata=0
                    BEGIN
                      SELECT @OpInCommutata = @OpInCommutata+1
                      UPDATE soggetti_del_piano SET flag= 'C' WHERE id_piano=@IdPiano AND id_soggetto=@IdSoggetto   
                    END
                  ELSE
                    BEGIN
                      UPDATE soggetti_del_piano SET flag= 'O' WHERE id_piano=@IdPiano AND id_soggetto=@IdSoggetto   
                    END
                END  
              --(if FoundOp=0)
              ELSE
                --Inizio non Operative
                BEGIN
                  SELECT @NonOp = @NonOp+1
                  GOTO RicercaFlag
                  NonSospese:
                  --Se è sospesa
                  IF @IsSospesa=0
                    --Inizio se è sospesa  
                    BEGIN
                      SELECT @NonSospese=@NonSospese+1
                      IF @record3sa is null or @record3sa=''
                        SELECT @NonOpDedicata = count(*)
                        FROM attivita_pianificate
                        WHERE id_piano=@IdPiano
                          AND id_soggetto=@IdSoggetto
                          AND id_attivita=@record3at
                          AND convert(char(10),fine,103)<>'01/01/1900'
                      ELSE
                        SELECT @NonOpDedicata = count(*) 
                        FROM stato_avanzamento
                        WHERE id_piano=@IdPiano
                          AND id_soggetto=@IdSoggetto 
                          AND id_attivita=@record3at
                          AND cod_avanzamento=@record3sa
                          AND convert(char(10),fine,103)<>'01/01/1900'
                      --Se non è in dedicata
                      IF @NonOpDedicata=0
                        --Inizio non operativa in dedicata
                        BEGIN
                          -- Controllo se il soggetto è attivato in commutata
                          IF @record2sa is null or @record2sa=''
                            SELECT @NonOpCommutata = count(*) 
                            FROM attivita_pianificate
                            WHERE id_piano=@IdPiano
                              AND id_soggetto=@IdSoggetto
                              AND id_attivita=@record2at
                              AND convert(char(10),fine,103)<>'01/01/1900'
                          ELSE
                            SELECT @NonOpCommutata = count(*)  
                            FROM stato_avanzamento
                            WHERE id_piano=@IdPiano
                            AND id_soggetto=@IdSoggetto
                            AND id_attivita=@record2at
                            AND cod_avanzamento=@record2sa
                            AND convert(char(10),fine,103)<>'01/01/1900'
                          --Se è in commutata
                          IF @NonOpCommutata<>0
                            --Inizio non operativa in commutata
                            BEGIN
                              UPDATE soggetti_del_piano SET flag= 'T' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
                              SELECT @NonOperativeInCommutata = @NonOperativeInCommutata + 1
                            END
                          --Se non è in commutata 
                          ELSE
                            --Non operative in commutata ne in dedicata
                            BEGIN
                              SELECT @NonOpNeCommNeDed=@NonOpNeCommNeDed +1 
                              --IF @FlagProvv=1
                                BEGIN
                                  UPDATE soggetti_del_piano SET flag= 'V' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
                                  SELECT @DaAttivare2 = @DaAttivare2 + 1
                                END
                            END
                        --Fine non operativa in dedicata
                        END 
                      --Se è in dedicata
                      ELSE
                        --inizio dedicata                        

                        BEGIN
                          SELECT @Resto=@Resto+1
                          IF @record7sa is null or @record7sa=''
                            SELECT @NonOpDedicataStm = count(*)  
                            FROM attivita_pianificate
                            WHERE id_piano=@IdPiano
                              AND id_soggetto=@IdSoggetto
                              AND id_attivita=@record7at
                              AND convert(char(10),fine,103)<>'01/01/1900'
                          ELSE
                            SELECT @NonOpDedicataStm = count(*)  
                            FROM stato_avanzamento
                            WHERE id_piano=@IdPiano
                              AND id_soggetto=@IdSoggetto
                              AND id_attivita=@record7at
                              AND cod_avanzamento=@record7sa
                              AND convert(char(10),fine,103)<>'01/01/1900'
                          --Se non ha il terminale
                          IF @NonOpDedicataStm=0      
                            BEGIN
                              SELECT @MancStampante = @MancStampante + 1
                              UPDATE soggetti_del_piano SET flag= 'S' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
                            END 
                          ELSE
                            --Se ha il terminale
                            BEGIN
                              IF @record5sa is null or @record5sa=''
                                SELECT @NonOpDedicataAdd = count(*)  
                                from attivita_pianificate
                                where id_piano=@IdPiano
                                and id_soggetto=@IdSoggetto
                                and id_attivita=@record5at
                                and convert(char(10),fine,103)<>'01/01/1900'
                              ELSE
                                SELECT @NonOpDedicataAdd = count(*)  
                                from stato_avanzamento    
                                where id_piano=@IdPiano
                                and id_soggetto=@IdSoggetto
                                and id_attivita=@record5at
                                and cod_avanzamento=@record5sa   
                                and convert(char(10),fine,103)<>'01/01/1900'
                              --Se non ha l'addestramento
                              IF @NonOpDedicataAdd=0      
                                BEGIN
                                  SELECT @MancAdd = @MancAdd + 1
                                  UPDATE soggetti_del_piano SET flag= 'D' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
                                END
                              --Se ha l'addestramento   
                              ELSE
                                BEGIN
                                  IF @FlagProvv=1
                                    BEGIN
                                      SELECT @NonAll = @NonAll + 1
                                      UPDATE soggetti_del_piano SET flag= 'L' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
                                    END
                                  ELSE
                                    BEGIN
                                      --se ho trovato il flag su p_sort 
                                      --IF @FlagProvv=0
                                      IF @SenzaFlag=0 
                                        BEGIN
                                          SELECT @InAttProvv = @InAttProvv + 1
                                          UPDATE soggetti_del_piano SET flag= 'M' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
                                        END
                                      ELSE
                                        --se non ho trovato il flag su p_sort
                                        BEGIN
                                          SELECT @SenzaPSort = @SenzaPSort + 1
                                          UPDATE soggetti_del_piano SET flag= 'P' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
                                        END 
                                    END
                                END
                            --Fine non operativa in commutata
                            END
                        -- Fine se il soggetto è attivato in dedicata
                        END
                    --Fine se è sospesa  
                    END
                --Fine non operative
                END 
              FETCH NEXT FROM ScorriRicevitorie INTO @IdSoggetto
              SELECT @StatoscorriRicevitorie = @@fetch_status
            -- Fine lettura di tutti i soggetti
            END

          CLOSE ScorriRicevitorie
          DEALLOCATE ScorriRicevitorie

          INSERT INTO consuntivi VALUES (@IdPiano,@Inizio,@Fine,@Pianificate+@Annullate,@Annullate,@DaAttivare,@Operative,@OpInCommutata,@NonOp,@NonOperativeInCommutata,@MancAdd,@InAttProvv,@Sospese,@DaAttivare2,0,@MancStampante,@DaAttivare2,@NonAll,0,@SenzaPSort)

          CLOSE ScorriOperative
          DEALLOCATE ScorriOperative

          FETCH NEXT FROM ScorriPiani INTO @IdPiano, @Inizio, @Fine
          SELECT @StatoscorriPiani = @@fetch_status   
        -- fine lettura di tutti i piani
        END
      CLOSE ScorriPiani
      DEALLOCATE ScorriPiani
    --Fine scorri piani
    END
    CLOSE ScorriPSort
    DEALLOCATE ScorriPSort
  --fine della procedura
  END
RETURN

RicercaOperative:
WHILE @StatoScorriOp = 0
  BEGIN
    IF @IdSoggOp>@IdSoggetto
      BEGIN
        BREAK
      END
    ELSE
      BEGIN
        SELECT @Conta = @Conta +1         
        SELECT @FoundOp = 1
        FETCH NEXT FROM ScorriOperative INTO @IdSoggOp
        SELECT @StatoScorriOp = @@fetch_status
      END
  END
GOTO ContinuaElaborazione    

RicercaFlag:
WHILE @StatoPSort=0
  BEGIN
    IF @idSogg<@IdSoggetto
      BEGIN
        FETCH NEXT FROM ScorriPSort INTO @FlagProvv, @idSogg
        SELECT @StatoPSort = @@fetch_status
      END
    ELSE
      BEGIN
        IF @idSogg=@IdSoggetto
          BEGIN
            IF @FlagProvv=2  or @FlagProvv=3
              BEGIN
                SELECT @IsSospesa=1      
                SELECT @Sospese=@Sospese+1
                UPDATE soggetti_del_piano SET flag= 'E' WHERE id_piano=@IdPiano and id_soggetto=@IdSoggetto   
              END
          END
        ELSE
          BEGIN
            SELECT @SenzaFlag=1
          END
        BREAK
      END
  END
GOTO NonSospese
GO
