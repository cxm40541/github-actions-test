/****** Object:  StoredProcedure [dbo].[SP_LO01GN]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Stored Procedure dbo.SP_LO01GN    Script Date: 03/04/2002 12.22.57 ******/
CREATE PROCEDURE [dbo].[SP_LO01GN] AS 
--Inizio procedura
BEGIN
  DECLARE @hr1 int
  DECLARE @i int
  DECLARE @Oggi varchar(120)
  DECLARE @Blank char(4)
  DECLARE @Index int
  DECLARE @IdSoggetto char(6)
  DECLARE @SoggPSort varchar(10)
  DECLARE @NumRicev char(4)
  DECLARE @NumRicevLSR char(4)
  DECLARE @Prov char(2)
  DECLARE @ProvLSR char(2)
  DECLARE @ModuloLSR char(1)
  DECLARE @DataAdd char(8)
  DECLARE @DataComm char(8)
  DECLARE @DataDed char(8)
  DECLARE @DataStam char(8)
  DECLARE @DataOffLine char(8)
  DECLARE @DataGest char(8)
  DECLARE @DataGioco char(8)
  DECLARE @IdPiano char(10)
  DECLARE @DataFileDiLog varchar(20)
  DECLARE @Piano char(4)
  DECLARE @ProgrOperazione int
  DECLARE @EsisteCA001 int
  DECLARE @EsisteVA int
  DECLARE @CommOK char(1)
  DECLARE @appo char(240), @appo2 varchar(600)
  DECLARE @NomeJob varchar(250)
  --Dichiarazione del cursore per leggere tutti i soggetti dei piani di nuova attivazione
  DECLARE ScorriSoggettiDelPiano INSENSITIVE CURSOR FOR 
  SELECT DISTINCT(soggetti_del_piano.id_soggetto)
  ,soggetti_del_piano.id_piano
  ,a.prov,a.id_soggetto,a.num_ricev
  ,b.lsr01a_prov_ricev,SUBSTRING(b.lsr01a_cod_amm,3,4)
  ,b.lsr01a_modulo
  FROM soggetti_del_piano 
  LEFT OUTER JOIN p_sort a
  ON soggetti_del_piano.id_soggetto=a.id_soggetto
  ,condiviso.dbo.lsr01a AS b
  ,piani,ltb01a_tab_descrizioni AS c
  WHERE soggetti_del_piano.id_piano=piani.id_piano
    AND b.lsr01a_key_id_ricev=soggetti_del_piano.id_soggetto
    AND b.lsr01a_sigla_ic=c.ltb01a_sigla_prov 
    AND (tipo_piano='NA' or tipo_piano='PR')
    AND soggetti_del_piano.id_piano>='N001'
  ORDER BY 1
  --Inizio della transazione
  BEGIN TRANSACTION
    --Creazione file  
    SELECT @Oggi=current_timestamp
    SELECT @NomeJob='LOEG009001GN'
    EXEC msdb..ut_aa004 9999, @NomeJob ,@oggi,0
    EXEC msdb..ut_aa004 9999, @NomeJob, 'Apertura SP',0
    --Se la creazione del file è OK
    BEGIN
      SELECT @i=0
      --Apertura cursore
      OPEN ScorriSoggettiDelPiano
      IF @@Error<>0 
        BEGIN
          EXEC msdb..ut_aa004 9999, @NomeJob ,@@Error,0
          CLOSE ScorriSoggettiDelPiano
          DEALLOCATE ScorriSoggettiDelPiano 
          ROLLBACK
          RETURN  
        END
      FETCH NEXT FROM ScorriSoggettiDelPiano 
      INTO @IdSoggetto, @IdPiano
      ,@Prov, @SoggPSort
      ,@NumRicev
      ,@ProvLSR,@NumRicevLSR
      ,@ModuloLSR 
      IF @@Error<>0 
        BEGIN
          EXEC msdb..ut_aa004 9999, @NomeJob, @@Error,0
          CLOSE ScorriSoggettiDelPiano
          DEALLOCATE ScorriSoggettiDelPiano 
          ROLLBACK
          RETURN
        END
      EXEC msdb..ut_aa004 9999, @NomeJob, 'Apertura cursore',0
      --Ciclo per la lettura di tutti i soggetti
      WHILE @@fetch_status=0
        --Inizio lettura di tutti i soggetti
        BEGIN
          IF  not (@SoggPSort) is null  and LTRIM(RTRIM(@SoggPSort))<>''  
            BEGIN
              IF @Prov is null or LTRIM(RTRIM(@Prov))='' 
                SELECT @Prov='  '
              IF (@NumRicev) is null or LTRIM(RTRIM(@NumRicev))=''
                SELECT @NumRicev='    '      
            END
          IF @ProvLSR is null or LTRIM(RTRIM(@ProvLSR))='' 
            SELECT @ProvLSR='  '
          IF @ModuloLSR is null OR LTRIM(RTRIM(@ModuloLSR))=''
            SELECT @ModuloLSR=' '
          IF @NumRicevLSR is null OR LTRIM(RTRIM(@NumRicevLSR))=''
            SELECT @NumRicevLSR='    ' 
          SELECT @DataAdd=''
          SELECT @DataDed=''
          SELECT @DataStam=''
          SELECT @DataOffLine=''
          SELECT @DataComm=''
          SELECT @DataGioco='00000000'
          SELECT @DataAdd=SUBSTRING(CONVERT(char(10),fine,103),7,4)+SUBSTRING(CONVERT(char(10),fine,103),4,2)+SUBSTRING(CONVERT(char(10),fine,103),1,2)
          FROM stato_avanzamento
          WHERE id_soggetto=@IdSoggetto
            AND id_attivita='E01' AND cod_avanzamento='E0001'
            AND id_piano=@IdPiano 
          IF @DataAdd='19000101'  or @Dataadd is null
            SELECT @DataAdd='00000000'
          SELECT @DataComm=SUBSTRING(CONVERT(char(10),fine,103),7,4)+SUBSTRING(CONVERT(char(10),fine,103),4,2)+SUBSTRING(CONVERT(char(10),fine,103),1,2)
          , @ProgrOperazione=progr_operazione
          FROM stato_avanzamento
          WHERE id_soggetto=@IdSoggetto
            AND id_attivita='B01' AND cod_avanzamento='B0003'
            AND id_piano=@IdPiano 
          IF @DataComm='19000101' OR @DataComm IS NULL
            BEGIN
              SELECT @DataComm='00000000'
              SELECT @CommOK='N' 
            END
          ELSE
            --Se esiste la data commutata
            --verifico verifico la presenza della problematica CA001
            BEGIN
              SELECT @EsisteCA001=0   
              SELECT @EsisteCA001=COUNT(*) 
              FROM problematiche
              WHERE cod_problematica='CA001'
                AND id_piano=@IdPiano
                AND id_soggetto=@IdSoggetto
                AND progr_operazione=@ProgrOperazione
                --Se la ricevitoria ha la commutata e la problematica CA001 
              IF @EsisteCA001>0 
                BEGIN
                  SELECT @EsisteVA=0 
                  SELECT @EsisteVA=COUNT(*) 
                  FROM problematiche
                  WHERE cod_problematica IN ('VA010','VA011')
                    AND id_piano=@IdPiano
                    AND id_soggetto=@IdSoggetto
                    AND progr_operazione=@ProgrOperazione
                    AND CONVERT(char(10),fine,103)='01/01/1900'
                  IF @EsisteVA=0  
                    SELECT @CommOK='S'
                  ELSE
                    SELECT @CommOK='N' 
                END
              --Se la ricevitoria ha la commutata ma non la problematica CA001   
              ELSE
                BEGIN
                  SELECT @CommOK='N'
                END  
            END  
          SELECT @DataDed=SUBSTRING(CONVERT(char(10),fine,103),7,4)+SUBSTRING(CONVERT(char(10),fine,103),4,2)+SUBSTRING(CONVERT(char(10),fine,103),1,2)
          FROM stato_avanzamento
          WHERE id_soggetto=@IdSoggetto
            AND id_attivita='B01' AND cod_avanzamento='B0004'
            AND id_piano=@IdPiano 
          IF @DataDed ='19000101'  OR @Dataded IS NULL
            SELECT @DataDed='00000000'
          SELECT @DataStam=SUBSTRING(CONVERT(char(10),fine,103),7,4)+SUBSTRING(CONVERT(char(10),fine,103),4,2)+SUBSTRING(CONVERT(char(10),fine,103),1,2)
          FROM stato_avanzamento
          WHERE id_soggetto=@IdSoggetto
            AND id_attivita='C01' AND cod_avanzamento='C0002'
            AND id_piano=@IdPiano
          IF @DataStam='19000101'  OR @Datastam IS NULL
            SELECT @DataStam='00000000'
          SELECT @DataOffLine=SUBSTRING(CONVERT(char(10),fine,103),7,4)+SUBSTRING(CONVERT(char(10),fine,103),4,2)+SUBSTRING(CONVERT(char(10),fine,103),1,2)
          FROM stato_avanzamento
          WHERE id_soggetto=@IdSoggetto
            AND id_attivita='B01' AND cod_avanzamento='B0002'
            AND id_piano=@IdPiano 
          IF @DataOffLine ='19000101'  OR @DataOffLine IS NULL
            SELECT @DataOffLine='00000000'
          SELECT @DataGest=SUBSTRING(CONVERT(char(10),data_trasf,103),7,4)+SUBSTRING(CONVERT(char(10),data_trasf,103),4,2)+SUBSTRING(CONVERT(char(10),data_trasf,103),1,2)
            , @DataGioco=SUBSTRING(CONVERT(char(10),data_in_gioco,103),7,4)+SUBSTRING(CONVERT(char(10),data_in_gioco,103),4,2)+SUBSTRING(CONVERT(char(10),data_in_gioco,103),1,2)
          FROM soggetti_in_gestione
          WHERE id_soggetto=@IdSoggetto
            AND id_piano=@IdPiano
          SELECT @Blank='0000'
          SELECT @Index=LEN(RTRIM(LTRIM(STR(@NumRicev))))
          IF @Index<4 
            SELECT @NumRicev=SUBSTRING(@Blank,1,(4-@Index))+RTRIM(LTRIM(STR(@NumRicev)))
          SELECT @Piano=SUBSTRING(@IdPiano,1,4)
          IF  not ( LTRIM(RTRIM(@SoggPSort)) is null)  and LTRIM(RTRIM(@SoggPSort))<>''
            BEGIN
              UPDATE dbo.Domande
              SET  data_com=@DataComm,
                data_ded=@DataDed,
                data_sta=@DataStam,
                data_add=@DataAdd,
                data_off_line=@DataOffLine,
                data_gioc=@DataGioco,
                modulo=@ModuloLSR,
                linea_disp=@CommOK
              WHERE num_ricev=CONVERT(int,@NumRicev)
                and prov=@Prov
            END
          ELSE
            BEGIN
              UPDATE dbo.Domande
              SET  data_com=@DataComm,
                data_ded=@DataDed,
                data_sta=@DataStam,
                data_add=@DataAdd,
                data_off_line=@DataOffLine,
                data_gioc=@DataGioco,
                modulo=@ModuloLSR,
                linea_disp=@CommOK
              WHERE num_ricev=CONVERT(int,@NumRicevLSR)
                and prov=@ProvLSR
            END
          FETCH NEXT FROM ScorriSoggettiDelPiano INTO @IdSoggetto, @IdPiano
          ,@Prov, @SoggPSort
          ,@NumRicev
          ,@ProvLSR,@NumRicevLSR
          ,@ModuloLSR
          IF @@Error<>0 
            BEGIN
              EXEC msdb..ut_aa004 9999, @NomeJob, @@Error,0 
              CLOSE ScorriSoggettiDelPiano
              DEALLOCATE ScorriSoggettiDelPiano 
              ROLLBACK
              RETURN
            END
          SELECT @i=@i+1
        --Fine lettura di tutti i soggetti
        END
      --Chiusura del cursore
      CLOSE ScorriSoggettiDelPiano
      DEALLOCATE ScorriSoggettiDelPiano
    --Fine se la creazione del file è OK
    END
    SELECT @appo2=current_timestamp
    EXEC msdb..ut_aa004 9999, @NomeJob, @i,0
    EXEC msdb..ut_aa004 9999, @NomeJob, @appo2,0
  COMMIT
--Fine procedura
END
GO
