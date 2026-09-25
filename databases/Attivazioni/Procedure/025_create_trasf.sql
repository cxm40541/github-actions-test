/****** Object:  StoredProcedure [dbo].[trasf]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Stored Procedure dbo.trasf    Script Date: 05/10/00 15.55.29 ******/
CREATE PROCEDURE [dbo].[trasf] @Data Char(10), @hr int output
AS
  --inizio procedura
  BEGIN
    --se vanno controllate tutte le ricevitorie del piano
    --inizio tutte
    BEGIN TRANSACTION
      DECLARE @Esito int
      DECLARE @Esito2 int
      DECLARE @Ricevitoria char(6) 
      DECLARE @piano char(10) 
      DECLARE @FlagLinea char(1) 
      DECLARE @FlagSelezione char(1)
      DECLARE @StringaFile char(68)
      DECLARE @hr1 int
----------mod 27/06/2002
      DECLARE @appo5 char(6), @DataTrasf char(10)
----------mod 27/06/2002
      --cursore per la lettura di tutti i piani
      DECLARE ScorriTempGestione INSENSITIVE CURSOR
      FOR select ricevitoria, id_piano, flag_linea,
        flag_selezione, stringa_file
      FROM [dbo].tempGestione 
      WHERE flag_Selezione='y'

      EXEC @Esito=msdb..ut_aa011 71,'SPTrasf.txt',71,'SPTrasf'
      EXEC @Esito2=msdb..ut_aa011 71,'LSR00A.txt',71,'SPTrasf'
      IF @Esito=0 
        EXEC msdb..ut_aa009 71,'SPTrasf.txt',71,'SPTrasf' 
      IF @Esito2=0
        EXEC msdb..ut_aa009 71,'LSR00A.txt',71,'SPTrasf' 
      IF @@ERROR <> 0
        BEGIN
          SELECT @hr=@@ERROR
          ROLLBACK TRANSACTION   
          DEALLOCATE ScorriTempGestione
          RETURN
        END
      OPEN ScorriTempGestione
      FETCH NEXT FROM ScorriTempGestione 
      INTO @ricevitoria,@Piano,@FlagLinea,
        @FlagSelezione,@StringaFile
      WHILE @@fetch_status=0
        --inizio scorrimento piani
        BEGIN
--------------------------mod 27/06/2002
--          SELECT @appo5=''
--          SELECT @appo5=Ricevitoria 
--          FROM temporanea 
--          WHERE ricevitoria=@ricevitoria
--          if @appo5='' 
--            BEGIN
--------------------------fine mod 27/06/2002
          INSERT INTO soggetti_in_gestione VALUES (@Ricevitoria, current_timestamp, @Data, @Piano)                                   
          EXEC  @hr1=msdb..ut_aa010 71,71,'LSR00A.txt',@StringaFile,'SPTrasf' 
          IF @hr1 <> 0
            BEGIN
              ROLLBACK TRANSACTION   
              CLOSE ScorriTempGestione
              DEALLOCATE ScorriTempGestione
              SELECT @hr=@hr1 
              RETURN
            END
          FETCH NEXT FROM ScorriTempGestione 
          INTO @ricevitoria,@Piano,@FlagLinea,
            @FlagSelezione,@StringaFile
--------------------------mod 27/06/2002
--            END 
--------------------------fine mod 27/06/2002

        END 
      CLOSE ScorriTempGestione
      DEALLOCATE ScorriTempGestione
    --fine tutte
    COMMIT TRANSACTION
  --fine procedura
  END
GO
