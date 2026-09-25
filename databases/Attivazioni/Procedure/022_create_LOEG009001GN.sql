/****** Object:  StoredProcedure [dbo].[LOEG009001GN]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Stored Procedure dbo.LOEG009001GNADD    Script Date: 03/04/2002 12.22.57 ******/
CREATE PROCEDURE [dbo].[LOEG009001GN] AS 
--Inizio procedura
BEGIN
  DECLARE @Esito int
  DECLARE @Esito2 int
  DECLARE @i int
  DECLARE @Oggi varchar(120)
  DECLARE @Blank char(4)
  DECLARE @Index int
  DECLARE @IdSoggetto char(6)
  DECLARE @SoggPSort varchar(10)
  DECLARE @NumRicev char(4)
  DECLARE @NumRicevLSR char(4)
  DECLARE @TabLSR char(4)
  DECLARE @Prov char(2)
  DECLARE @ProvLSR char(2)
  DECLARE @Comune char(25)
  DECLARE @ComuneLSR char(25)
  DECLARE @Cap char(5)
  DECLARE @CapLSR char(5)
  DECLARE @Indirizzo char(40)
  DECLARE @IndirizzoLSR char(40)
  DECLARE @Cognome char(24)
  DECLARE @CognomeLSR char(24)
  DECLARE @Nome char(20)
  DECLARE @NomeLSR char(20)
  DECLARE @ModuloLSR char(1)
  DECLARE @TipoRicev char(1)
  DECLARE @TipoSpec char(1)
  DECLARE @Stato char(1)
  DECLARE @DataCessaz char(8)
  DECLARE @FlagProvv char(1)
  DECLARE @SiglaIspett char(2)
  DECLARE @Ispett char(15)
  DECLARE @DataAdd char(8)
  DECLARE @DataComm char(8)
  DECLARE @DataDed char(8)
  DECLARE @DataStam char(8)
  DECLARE @DataGest char(8)
  DECLARE @DataGioco char(8)
  DECLARE @IdPiano char(10)
  DECLARE @Piano char(4)
  DECLARE @ProgrOperazione int
  DECLARE @EsisteCA001 int
  DECLARE @EsisteVA int
  DECLARE @CommOK char(1)
  DECLARE @appo2 varchar(240)
  DECLARE @FileOut varchar(250)
  DECLARE @FileLog varchar(250)
  DECLARE @FileLogC varchar(250)
  DECLARE @hr int 
  DECLARE @hr1 int 

  --Dichiarazione del cursore per leggere tutti i soggetti dei piani di nuova attivazione
  DECLARE ScorriSoggettiDelPiano INSENSITIVE CURSOR
  FOR SELECT DISTINCT(soggetti_del_piano.id_soggetto),soggetti_del_piano.id_piano
  ,a.comune, a.cap,a.indirizzo
  ,a.prov,a.id_soggetto,a.num_ricev,a.flag_provv
  ,a.cognome,a.nome,a.stato
  ,b.lsr01a_prov_ricev,SUBSTRING(b.lsr01a_cod_amm,3,4)
  ,b.lsr01a_comune_ricev,b.lsr01a_cap
  ,b.lsr01a_indirizzo,b.lsr01a_cognome
  ,b.lsr01a_nome,b.lsr01a_flag_esercizio
  ,b.lsr01a_tab_speciali
  ,b.lsr01a_data_cessaz,b.lsr01a_sigla_ic
  ,b.lsr01a_modulo,c.ltb01a_provincia,b.lsr01a_tab
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
    AND SUBSTRING(soggetti_del_piano.id_soggetto,1,2)='BA'
  ORDER BY 1
  --Inizio della transazione
  BEGIN TRANSACTION
    --Creazione file  
    SELECT @FileLog='Log3.txt' 
    SELECT @Oggi=current_timestamp
    SELECT @FileOut='LSR3B.txt' 
    EXEC @Esito=msdb..ut_aa011 71,'Log3.txt',71,'Log3'
    EXEC @Esito2=msdb..ut_aa011 71,'LSR3B.txt',71,'Log3'
    IF @Esito=0 
      EXEC msdb..ut_aa009 71,'Log3.txt',71,'Log3'
    IF @Esito2=0 
      EXEC msdb..ut_aa009 71,'LSR3B.txt',71,'Log3'
    IF @@ERROR <> 0
      BEGIN
        ROLLBACK TRANSACTION   
        DEALLOCATE ScorriSoggettiDelPiano
        RETURN
      END
    --Se la creazione del file è OK
    BEGIN
      SELECT @i=0
      EXEC @hr1=msdb..ut_aa010 71,71,'LSR3B.txt',@Oggi,'Log3'
      --Apertura cursore
      OPEN ScorriSoggettiDelPiano
      IF @@Error<>0
        BEGIN
          EXEC @hr1=msdb..ut_aa010 71,71,'LSR3B.txt',@@Error,'Log3'
          ROLLBACK TRANSACTION   
          CLOSE ScorriSoggettiDelPiano
          DEALLOCATE ScorriSoggettiDelPiano
          RETURN
        END
      FETCH NEXT FROM ScorriSoggettiDelPiano INTO @IdSoggetto, @IdPiano
      ,@Comune, @Cap, @Indirizzo
      ,@Prov, @SoggPSort
      ,@NumRicev, @FlagProvv
      ,@Cognome, @Nome
      ,@Stato,@ProvLSR,@NumRicevLSR,@ComuneLSR
      ,@CapLSR,@IndirizzoLSR, @CognomeLSR
      ,@NomeLSR, @TipoRicev,@TipoSpec
      ,@DataCessaz, @SiglaIspett
      ,@ModuloLSR, @Ispett, @TabLSR
      IF @@Error<>0 
        BEGIN
          EXEC @hr1=msdb..ut_aa010 71,71,'LSR3B.txt',@@Error,'Log3'
          ROLLBACK TRANSACTION   
          CLOSE ScorriSoggettiDelPiano
          DEALLOCATE ScorriSoggettiDelPiano
          RETURN
        END
      EXEC @hr1=msdb..ut_aa010 71,71,'LSR3B.txt','Apertura cursore','Log3'
      --Ciclo per la lettura di tutti i soggetti
      WHILE @@fetch_status=0
        --Inizio lettura di tutti i soggettii
        BEGIN
          --Costruzione stringa
          IF  not (@SoggPSort) is null  and LTRIM(RTRIM(@SoggPSort))<>''  
            BEGIN
               IF @Indirizzo is null or LTRIM(RTRIM(@Indirizzo))='' 
                SELECT @Indirizzo='                                        '
              ELSE 
                SELECT @Indirizzo = REPLACE (@Indirizzo,'"','''''')
              IF @Prov is null or LTRIM(RTRIM(@Prov))='' 
                SELECT @Prov='  '
              IF @Comune IS null OR LTRIM(RTRIM(@Comune))=''
                  SELECT @Comune='                         '
              ELSE
                SELECT @Comune = REPLACE (@Comune ,'"','''''')
              IF @Cap IS null OR LTRIM(RTRIM(@Cap))=''
                SELECT @Cap='     '
              IF @Cognome is null OR LTRIM(RTRIM(@Cognome))=''
                SELECT @Cognome='                        ' 
              ELSE  
                SELECT @Cognome = REPLACE (@Cognome,'"','''''')
              IF @Nome is null OR LTRIM(RTRIM(@Nome))=''
                SELECT @Nome='                    ' 
              ELSE  
                SELECT @Nome = REPLACE (@Nome,'"','''''')
              IF (@Stato) is null or LTRIM(RTRIM(@Stato))=''
                SELECT @Stato=' '      
              IF (@NumRicev) is null or LTRIM(RTRIM(@NumRicev))=''
                SELECT @NumRicev='    '      
              IF (@FlagProvv) is null or LTRIM(RTRIM(@FlagProvv))=''
                SELECT @FlagProvv=' '      
            END
            IF @CapLSR IS null OR LTRIM(RTRIM(@CapLSR))=''
              SELECT @CapLSR='     '
            IF @ProvLSR is null or LTRIM(RTRIM(@ProvLSR))='' 
              SELECT @ProvLSR='  '
            IF @ComuneLSR IS null OR LTRIM(RTRIM(@ComuneLSR))=''
              SELECT @ComuneLSR='                         '
            ELSE
              SELECT @ComuneLSR = REPLACE (@ComuneLSR,'"','''''')
            IF @CognomeLSR is null OR LTRIM(RTRIM(@CognomeLSR))=''
              SELECT @CognomeLSR='                        ' 
            ELSE  
              SELECT @CognomeLSR = REPLACE (@CognomeLSR,'"','''''')
            IF @IndirizzoLSR is null or LTRIM(RTRIM(@IndirizzoLSR))=''
              SELECT @IndirizzoLSR='                                        ' 
            ELSE 
              SELECT @IndirizzoLSR = REPLACE (@IndirizzoLSR,'"','''''')
            IF @NomeLSR is null OR LTRIM(RTRIM(@NomeLSR))=''
              SELECT @NomeLSR='                    ' 
            ELSE  
              SELECT @NomeLSR = REPLACE (@NomeLSR,'"','''''')
            IF @ModuloLSR is null OR LTRIM(RTRIM(@ModuloLSR))=''
              SELECT @ModuloLSR=' '
            IF (@TipoRicev) is null or LTRIM(RTRIM(@TipoRicev))=''
              SELECT @TipoRicev=' '      
            IF (@TipoSpec) is null or LTRIM(RTRIM(@TipoSpec))=''
              SELECT @TipoSpec=' '      
            IF (@SiglaIspett) is null or LTRIM(RTRIM(@SiglaIspett))=''
              SELECT @SiglaIspett='  '      
            IF @TabLSR is null OR LTRIM(RTRIM(@TabLSR))=''
              SELECT @TabLSR='    '
            IF @NumRicevLSR is null OR LTRIM(RTRIM(@NumRicevLSR))=''
              SELECT @NumRicevLSR='    ' 
            IF (@Ispett) is null or LTRIM(RTRIM(@Ispett))=''
              SELECT @Ispett='               '      
            ELSE
              SELECT @Ispett = REPLACE (@Ispett,'"','''''')
            SELECT @DataAdd=''
            SELECT @DataDed=''
            SELECT @DataStam=''
            SELECT @DataGest='00000000'
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
            SELECT @DataGest=SUBSTRING(CONVERT(char(10),data_trasf,103),7,4)+SUBSTRING(CONVERT(char(10),data_trasf,103),4,2)+SUBSTRING(CONVERT(char(10),data_trasf,103),1,2)
            , @DataGioco=SUBSTRING(CONVERT(char(10),data_in_gioco,103),7,4)+SUBSTRING(CONVERT(char(10),data_in_gioco,103),4,2)+SUBSTRING(CONVERT(char(10),data_in_gioco,103),1,2)
            FROM soggetti_in_gestione
            WHERE id_soggetto=@IdSoggetto
              AND id_piano=@IdPiano
            SELECT @Blank='0000'
            SELECT @Index=LEN(RTRIM(LTRIM(STR(@NumRicev))))
            IF @Index<4 
              SELECT @NumRicev=SUBSTRING(@Blank,1,(4-@Index))+RTRIM(LTRIM(STR(@NumRicev)))
            BEGIN
              SELECT @Piano=SUBSTRING(@IdPiano,1,4)
            END
            IF not (LTRIM(RTRIM(@SoggPSort)) is null)  and LTRIM(RTRIM(@SoggPSort))<>''
              BEGIN
                UPDATE dbo.Domande
                SET  data_com=@DataComm,
                  data_ded=@DataDed,
                  data_sta=+@DataStam,
                  data_add=@DataAdd,
                  data_gioc=@DataGioco,
                  modulo=@ModuloLSR,
                  linea_disp=@CommOK
                WHERE num_ricev=CONVERT(int,@NumRicev)
                  AND prov=@Prov
              END
            ELSE
              BEGIN
                UPDATE dbo.Domande
                SET  data_com=@DataComm,
                  data_ded=@DataDed,
                  data_sta=+@DataStam,
                  data_add=@DataAdd,
                  data_gioc=@DataGioco,
                  modulo=@ModuloLSR,
                  linea_disp=@CommOK
                WHERE num_ricev=CONVERT(int,@NumRicevLSR)
                  and prov=@ProvLSR
              END
            FETCH NEXT FROM ScorriSoggettiDelPiano INTO @IdSoggetto, @IdPiano
            ,@Comune, @Cap, @Indirizzo
            ,@Prov, @SoggPSort
            ,@NumRicev, @FlagProvv
            ,@Cognome, @Nome
            ,@Stato,@ProvLSR,@NumRicevLSR,@ComuneLSR
            ,@CapLSR,@IndirizzoLSR, @CognomeLSR
            ,@NomeLSR, @TipoRicev,@TipoSpec
            ,@DataCessaz, @SiglaIspett
            ,@ModuloLSR, @Ispett, @TabLSR
            IF @@Error<>0 
              BEGIN
                EXEC  msdb..ut_aa010 71,71,'LSR3B.txt',@@ERROR,'Log3'
                ROLLBACK TRANSACTION   
                CLOSE ScorriSoggettiDelPiano
                DEALLOCATE ScorriSoggettiDelPiano
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
    EXEC  msdb..ut_aa010 71,71,'LSR3B.txt',@i,'Log3'  
    EXEC  msdb..ut_aa010 71,71,'LSR3B.txt',@appo2,'Log3'
  --Fine della transazione
  COMMIT
--Fine procedura
END
GO
