/****** Object:  StoredProcedure [dbo].[PopolaTabProvvRicAttTRISProvaNew]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PopolaTabProvvRicAttTRISProvaNew]
AS
BEGIN
  DECLARE @codLotto char(6)
  DECLARE @dataOdierna char(8) 
  DECLARE @i int

  BEGIN
    SELECT @dataOdierna = CONVERT(CHAR,GETDATE(),112)
    SELECT @i=1

    DECLARE ScorriRicIeT INSENSITIVE CURSOR FOR 
    SELECT LSRSER_TRIS_KEY_ID_RICEV 
    FROM LSRSER_TRIS a
    WHERE LSRSER_TRIS_DATA_DECOR = 
     (
      SELECT MAX(LSRSER_TRIS_DATA_DECOR) 
      FROM LSRSER_TRIS b
      WHERE LSRSER_TRIS_DATA_DECOR <= CONVERT(CHAR(8),GETDATE() ,112)
      AND a.LSRSER_TRIS_KEY_ID_RICEV = b.LSRSER_TRIS_KEY_ID_RICEV
      AND LSRSER_TRIS_FLAG_VALIDITA = 'Y'
     )
    AND LSRSER_TRIS_FLAG_VALIDITA = 'Y' 
    AND LSRSER_TRIS_STATO ='1'    ---ricev  attive
    AND LSRSER_TRIS_KEY_ID_RICEV IN
     (
      (
       SELECT DISTINCT (LSRCON_TRIS_KEY_ID_RICEV)  
       FROM LSRCON_TRIS
       WHERE LSRCON_TRIS_FLAG_ANAG = '1'
        --AND LSRCON_TRIS_TIPO_DOC = 'C' ----  (questa riga solo per F 101)
      )     ----ricev con contratto                
      UNION
      ( 
       SELECT DISTINCT (LSRFID_TRIS_KEY_ID_RICEV)
       FROM LSRFID_TRIS
       WHERE LSRFID_TRIS_ANNO_RIF = CONVERT(CHAR(8),GETDATE(),112)
       AND LSRFID_TRIS_FLAG_ANAG = '1'
      )      -----ricev con fidejussione
     ) 
    AND LSRSER_TRIS_KEY_ID_RICEV IN
     (
      SELECT DISTINCT (LSRPRO_KEY_ID_RICEV)
      FROM LSRPRO
      WHERE LSRPRO_FLAG_VALIDITA='Y' 
      AND lsrpro_ft_vos <> '00000000'
      AND lsrpro_key_tipo_rec in ('T','I')
      AND lsrpro_flag_validita = 'y'
      AND lsrpro_decor_dal > 
      ISNULL
       (      
        (
         SELECT MAX(lsraps_TRIS_key_data_ins) 
         FROM lsraps_TRIS b
         WHERE  LSRaps_TRIS_KEY_ID_RICEV =  LSRSER_TRIS_KEY_ID_RICEV
         AND LSRaps_TRIS_FLAG_anag = '1'
        ),'00000000'
       )    ---ricev con provv E o T successivo a invio APS
     ) 

  DECLARE ScorriRicE INSENSITIVE CURSOR FOR 
    SELECT LSRSER_TRIS_KEY_ID_RICEV 
    FROM LSRSER_TRIS a
    WHERE LSRSER_TRIS_DATA_DECOR = 
     (
      SELECT MAX(LSRSER_TRIS_DATA_DECOR) 
      FROM LSRSER_TRIS b
      WHERE LSRSER_TRIS_DATA_DECOR <= CONVERT(CHAR(8),GETDATE() ,112)
      AND a.LSRSER_TRIS_KEY_ID_RICEV = b.LSRSER_TRIS_KEY_ID_RICEV
      AND LSRSER_TRIS_FLAG_VALIDITA = 'Y'
     )
    AND LSRSER_TRIS_FLAG_VALIDITA = 'Y' 
    AND LSRSER_TRIS_STATO ='1'    ---ricev  attive
    AND LSRSER_TRIS_KEY_ID_RICEV IN
     (
      (
       SELECT DISTINCT (LSRCON_TRIS_KEY_ID_RICEV)  
       FROM LSRCON_TRIS
       WHERE LSRCON_TRIS_FLAG_ANAG = '1'
        --AND LSRCON_TRIS_TIPO_DOC = 'C' ----  (questa riga solo per F 101)
      )     ----ricev con contratto                
      UNION
      ( 
       SELECT DISTINCT (LSRFID_TRIS_KEY_ID_RICEV)
       FROM LSRFID_TRIS
       WHERE LSRFID_TRIS_ANNO_RIF = CONVERT(CHAR(8),GETDATE(),112)
       AND LSRFID_TRIS_FLAG_ANAG = '1'
      )      -----ricev con fidejussione
     ) 
    AND LSRSER_TRIS_KEY_ID_RICEV IN
     (
      SELECT DISTINCT (LSRPRO_KEY_ID_RICEV)
      FROM LSRPRO
      WHERE LSRPRO_FLAG_VALIDITA='Y' 
      AND lsrpro_ft_vos <> '00000000'
      AND lsrpro_key_tipo_rec ='E'
      AND lsrpro_flag_validita = 'y'
      AND lsrpro_decor_dal > 
      ISNULL
       (      
        (
         SELECT MAX(lsraps_TRIS_key_data_ins) 
         FROM lsraps_TRIS b
         WHERE  LSRaps_TRIS_KEY_ID_RICEV =  LSRSER_TRIS_KEY_ID_RICEV
         AND LSRaps_TRIS_FLAG_anag = '1'
        ),'00000000'
       )    ---ricev con provv E o T successivo a invio APS
     )
    AND LSRSER_TRIS_KEY_ID_RICEV NOT IN 
     (
      SELECT key_id_ricev
      FROM temporaneaAps 
     )

    DECLARE @codAmm char(8) 
    DECLARE @indirizzo char(40)
    DECLARE @cognome char(24)
    DECLARE @nome char(20)
    DECLARE @statoSt char(1)
    DECLARE @fide char(1)
    DECLARE @contratto char(1)
    DECLARE @listaAps char(1) 
    DECLARE @indirizzoOld char(40)
    DECLARE @cognomeOld char(24)
    DECLARE @nomeOld char(20)
    DECLARE @dataInizio char(8)
    DECLARE @dataFine char(8)   
    DECLARE @titPrec char(1) 
    DECLARE @statoS char(1) 
    DECLARE @n char(1)
    DECLARE @m char(1)
    DECLARE @p char(1)
    DECLARE @q char(1)
    DECLARE @TipoProvv char(1)
    DECLARE @nmrInvio int
    DECLARE @dataElab char(8)
    DECLARE @lsrprodecordal char(8)  
    DECLARE @indirizzoPrec char(40)
    DECLARE @cognomePrec char(24)
    DECLARE @nomePrec char(20)
    DECLARE @cap char(5)
    DECLARE @provincia char(2)
    DECLARE @comune char(24)
  END

  OPEN ScorriRicIeT
  FETCH NEXT FROM ScorriRicIeT INTO @codLotto
  WHILE @@fetch_status=0
    BEGIN
        ------------------
      SELECT @statoSt=''
      SELECT @fide=''
      SELECT @contratto=''
      SELECT @listaAps=''
      SELECT @statoS=''
      SELECT @n=''
      SELECT @m=''
      SELECT @p=''
      SELECT @q=''
      SELECT @TipoProvv=''
      SELECT @nmrInvio=0
      SELECT @dataElab = null
      SELECT @lsrprodecordal=''
      SELECT @indirizzoPrec=''
      SELECT @cognomePrec=''
      SELECT @nomePrec=''
      SELECT @cap=''
      SELECT @provincia=''
      SELECT @comune=''
      SELECT @titPrec='N'
      SELECT @cognomeOld=''
      SELECT @nomeOld=''
      SELECT @indirizzoOld=''
      SELECT @dataInizio=''
      SELECT @dataFine=''

      SELECT @codAmm=lsrric_cod_amm, 
      @indirizzo=LTRIM(RTRIM(lsrric_indirizzo)),
      @cap=lsrric_cap,
      @provincia=lsrric_prov_ricev,
      @comune=lsrric_comune_ricev,
      @cognome=LTRIM(RTRIM(lsrtit_cognome)),
      @nome=LTRIM(RTRIM(lsrtit_nome))
      FROM lsrric a 
      ,lsrtit b
      WHERE (lsrric_data_validita + lsrric_ora_validita) = 
       (
        SELECT max((lsrric_data_validita + lsrric_ora_validita)) 
        FROM lsrric
        WHERE lsrric_key_id_ricev = a.lsrric_key_id_ricev
        AND lsrric_data_validita <=CONVERT(CHAR(8),GETDATE(),112)
        AND lsrric_flag_validita = 'Y'
       )
      AND lsrric_flag_validita = 'Y'
      AND lsrric_key_id_ricev = @codLotto  
      AND
       (
        lsrtit_data_validita + lsrtit_ora_validita) = 
         (
          SELECT max((lsrtit_data_validita + lsrtit_ora_validita)) 
          FROM lsrtit 
          WHERE lsrtit_key_id_ricev = b.lsrtit_key_id_ricev 
          AND lsrtit_data_validita <= CONVERT(CHAR(8),GETDATE(),112
         )
        AND lsrtit_flag_validita = 'Y'
       )
      AND lsrtit_flag_validita = 'Y'
      AND lsrtit_key_id_ricev = @codLotto
      AND b.lsrtit_key_id_ricev=a.lsrric_key_id_ricev


      SELECT @nmrInvio=invio_aps_nmr_invio, 
      @dataElab=invio_aps_data_elab
      FROM invio_aps
      WHERE invio_aps_key_id_ricev = @codLotto
      AND invio_aps_key_servizio = '2'
      AND invio_aps_flag_val= 'Y'
      AND LTRIM(RTRIM(invio_aps_cognome_new)) = LTRIM(RTRIM(@cognome))
      AND LTRIM(RTRIM(invio_aps_nome_new)) = LTRIM(RTRIM(@nome))
      AND LTRIM(RTRIM(invio_aps_indirizzo_new)) = LTRIM(RTRIM(@indirizzo))
      AND LTRIM(RTRIM(invio_aps_cod_amm)) = LTRIM(RTRIM(@codAmm))


print @dataElab+'*'

      IF LTRIM(RTRIM(@dataElab))='' OR @dataElab is null OR @dataElab='00000000'
        BEGIN
          IF @nmrInvio is null 
            SELECT @nmrInvio=0
                
          SELECT @n=count(LSRFID_TRIS_KEY_ID_RICEV),
          @fide= 
            case @n 
              when 0 then 'N'
              else 'S'
            end
          , @m=count(LSRCON_TRIS_KEY_ID_RICEV),
          @contratto = 
            case @m
              when 0 then 'N'
              else 'S'
            end
          FROM LSRFID_TRIS FULL OUTER JOIN
          LSRCON_TRIS
          ON LSRFID_TRIS_KEY_ID_RICEV=LSRCON_TRIS_KEY_ID_RICEV
          WHERE LSRFID_TRIS_ANNO_RIF = CONVERT(CHAR(4),GETDATE(),112)
          AND LSRFID_TRIS_FLAG_ANAG = '1'
          AND LSRFID_TRIS_KEY_ID_RICEV = @CodLotto
          AND LSRCON_TRIS_FLAG_ANAG =  '1'
          AND LSRCON_TRIS_KEY_ID_RICEV = @CodLotto
          --AND LSRCON_TRIS_TIPO_DOC = 'C'  ----------solo per F 101

          SELECT @cognomeOld = LTRIM(RTRIM(LSRTIT_COGNOME)),
          @nomeOld = LTRIM(RTRIM(LSRTIT_NOME)), 
          @dataInizio = LSRTIT_DATA_VALIDITA 
          FROM LSRTIT
          WHERE lsrtit_key_id_ricev = @CodLotto
          AND  LSRTIT_FLAG_VALIDITA = 'Y'
          AND (LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA) =
           (	
            SELECT MAX(LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)
            FROM LSRTIT
            WHERE LSRTIT_KEY_ID_RICEV = @CodLotto
            AND  LSRTIT_FLAG_VALIDITA = 'Y'
            AND (LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA) <
             (
              SELECT MAX(LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)
              FROM LSRTIT
              WHERE LSRTIT_KEY_ID_RICEV = @CodLotto
              AND LSRTIT_TIPO = 'T'  
              AND 
               (
                LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA
               )  <= 
               (
                SELECT MAX((LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)) 
                FROM LSRTIT
                WHERE LSRTIT_KEY_ID_RICEV = @CodLotto
                AND LSRTIT_DATA_VALIDITA <= CONVERT(CHAR(8),GETDATE(),112)
                AND  LSRTIT_FLAG_VALIDITA = 'Y'
               )
              AND LSRTIT_FLAG_VALIDITA = 'Y'
              AND LSRTIT_TIPO_PROVV='I'
             )
           )

          IF Ltrim(Rtrim(@dataInizio))<>''
            BEGIN
              SELECT @dataFine =  convert(char(8),DATEADD(day, -1, lsrtit_data_validita ),112)
              ,@indirizzoOld=LTRIM(RTRIM(lsrric_indirizzo))
              FROM lsrtit a,lsrric b
              WHERE (lsrtit_data_validita + lsrtit_ora_validita) = 
               (
                SELECT max((lsrtit_data_validita + lsrtit_ora_validita))
                FROM lsrtit 
                WHERE lsrtit_key_id_ricev = a.lsrtit_key_id_ricev 
                AND lsrtit_data_validita <= CONVERT(CHAR(8),GETDATE(),112)
                AND lsrtit_flag_validita = 'Y'
                AND LSRTIT_TIPO_PROVV='I'
               )
              AND  lsrtit_flag_validita = 'Y'
              AND lsrtit_key_id_ricev = @CodLotto
              AND 
               (
                lsrric_data_validita + lsrric_ora_validita
               ) = 
               (
                SELECT max((lsrric_data_validita + lsrric_ora_validita))
                FROM lsrric
                WHERE lsrric_key_id_ricev = b.lsrric_key_id_ricev
                AND lsrric_data_validita <=@dataFine
                AND lsrric_flag_validita = 'Y'
               )
              AND lsrric_flag_validita = 'Y'
              AND lsrric_key_id_ricev = @codLotto
              AND lsrtit_key_id_ricev = lsrric_key_id_ricev

              SELECT @q = count(*),
                @titPrec =case @q
                   when 0 then 'N'
                   else 'Y'
                 end 
               FROM dbo.lsrser_TRIS 
               WHERE lsrser_TRIS_data_decor>= @dataInizio
               AND lsrser_TRIS_data_decor< @dataFine
               AND lsrser_TRIS_flag_validita='Y'
               AND lsrser_TRIS_key_id_ricev=@CodLotto
               AND lsrser_TRIS_stato='1'
             END

          SELECT @statoSt = 'A'
          SELECT @i=@i+1
          Print @CodLotto
          Print @dataElab
          Print (@contratto)
          Print (@Fide)
          Print Str(@i)
PRINT 'ciao'
  if @DataElab is null 
     begin

          insert into temporaneaAps values(@CodLotto, '2',@codAmm,Replace(@cognome,'''',''''''),Replace(@nome,'''',''''''),@statoSt,@contratto,@fide,Replace(@indirizzo,'''',''''''),Replace(@indirizzoOld,'''',''''''),Replace(@cognomeOld,'''',''''''),Replace(@nomeOld,'''',''''''),@nmrInvio,'','','','Y',@titPrec,@cap,@provincia,Replace(@comune,'''',''''''))
    --      INSERT INTO temporaneaAps VALUES(@CodLotto, '1',@codAmm,@cognome,@nome,@statoSt,@contratto,@fide,@indirizzo,@indirizzoOld,@cognomeOld,@nomeOld,@nmrInvio,'','','','Y',@titPrec,@cap,@provincia,@comune)
end
        END 
      FETCH NEXT FROM ScorriRicIeT INTO @codLotto
    END
  CLOSE ScorriRicIeT
  DEALLOCATE ScorriRicIeT
--------------------------
  OPEN ScorriRicE
  FETCH NEXT FROM ScorriRicE INTO @codLotto
  WHILE @@fetch_status=0
    BEGIN
      SELECT @statoSt=''
      SELECT @fide=''
      SELECT @contratto=''
      SELECT @listaAps=''
      SELECT @statoS=''
      SELECT @n=''
      SELECT @m=''
      SELECT @p=''
      SELECT @q=''
      SELECT @TipoProvv=''
      SELECT @nmrInvio=0
      SELECT @dataElab = null
      SELECT @lsrprodecordal=''
      SELECT @indirizzoPrec=''
      SELECT @cognomePrec=''
      SELECT @nomePrec=''
      SELECT @cap=''
      SELECT @provincia=''
      SELECT @comune=''
      SELECT @titPrec='N'
      SELECT @cognomeOld=''
      SELECT @nomeOld=''
      SELECT @indirizzoOld=''
      SELECT @dataInizio=''
      SELECT @dataFine=''
--------------
      
      SELECT @codAmm=lsrric_cod_amm, 
      @indirizzo=LTRIM(RTRIM(lsrric_indirizzo)),
      @cap=lsrric_cap,
      @provincia=lsrric_prov_ricev,
      @comune=lsrric_comune_ricev,
      @cognome=LTRIM(RTRIM(lsrtit_cognome)),
      @nome=LTRIM(RTRIM(lsrtit_nome))
      FROM lsrric a
      ,lsrtit b
      WHERE (lsrric_data_validita + lsrric_ora_validita) = 
       (
        SELECT max((lsrric_data_validita + lsrric_ora_validita)) 
        FROM lsrric
        WHERE lsrric_key_id_ricev = a.lsrric_key_id_ricev
        AND lsrric_data_validita <=CONVERT(CHAR(8),GETDATE(),112)
        AND lsrric_flag_validita = 'Y'
       )
      AND lsrric_flag_validita = 'Y'
      AND lsrric_key_id_ricev = @codLotto  
      AND
       (
        lsrtit_data_validita + lsrtit_ora_validita) = 
         (
          SELECT max((lsrtit_data_validita + lsrtit_ora_validita)) 
          FROM lsrtit 
          WHERE lsrtit_key_id_ricev = b.lsrtit_key_id_ricev 
          AND lsrtit_data_validita <= CONVERT(CHAR(8),GETDATE(),112
         )
        AND lsrtit_flag_validita = 'Y'
       )
      AND lsrtit_flag_validita = 'Y'
      AND lsrtit_key_id_ricev = @codLotto
      AND b.lsrtit_key_id_ricev=a.lsrric_key_id_ricev

      SELECT @nmrInvio=invio_aps_nmr_invio, 
      @dataElab=invio_aps_data_elab
      FROM invio_aps
      WHERE invio_aps_key_id_ricev = @codLotto
      AND invio_aps_key_servizio = '2'
      AND invio_aps_flag_val= 'Y'
      AND LTRIM(RTRIM(invio_aps_cognome_new)) = LTRIM(RTRIM(@cognome))
      AND LTRIM(RTRIM(invio_aps_nome_new)) = LTRIM(RTRIM(@nome))
      AND LTRIM(RTRIM(invio_aps_indirizzo_new)) = LTRIM(RTRIM(@indirizzo))
      AND LTRIM(RTRIM(invio_aps_cod_amm)) = LTRIM(RTRIM(@codAmm))

      
      IF LTRIM(RTRIM(@dataElab))='' OR @dataElab is null OR @dataElab='00000000'
        BEGIN
          IF @nmrInvio is null 
            SELECT @nmrInvio=0

          SELECT @n=count(LSRFID_TRIS_KEY_ID_RICEV),
          @fide= 
            case @n 
              when 0 then 'N'
              else 'S'
            end
          , @m=count(LSRCON_TRIS_KEY_ID_RICEV),
          @contratto = 
            case @m
              when 0 then 'N'
              else 'S'
            end
          FROM LSRFID_TRIS FULL OUTER JOIN
          LSRCON_TRIS
          ON LSRFID_TRIS_KEY_ID_RICEV=LSRCON_TRIS_KEY_ID_RICEV
          WHERE LSRFID_TRIS_ANNO_RIF = CONVERT(CHAR(4),GETDATE(),112)
          AND LSRFID_TRIS_FLAG_ANAG = '1'
          AND LSRFID_TRIS_KEY_ID_RICEV = @CodLotto
          AND LSRCON_TRIS_FLAG_ANAG =  '1'
          AND LSRCON_TRIS_KEY_ID_RICEV = @CodLotto
           --AND LSRCON_TRIS_TIPO_DOC = 'C'  ----------solo per F 101

          SELECT @cognomeOld = LTRIM(RTRIM(LSRTIT_COGNOME)),
          @nomeOld = LTRIM(RTRIM(LSRTIT_NOME)), 
          @dataInizio = LSRTIT_DATA_VALIDITA 
          FROM LSRTIT
          WHERE lsrtit_key_id_ricev = @CodLotto
          AND  LSRTIT_FLAG_VALIDITA = 'Y'
          AND (LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA) =
           (	
            SELECT MAX(LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)
            FROM LSRTIT
            WHERE LSRTIT_KEY_ID_RICEV = @CodLotto
            AND  LSRTIT_FLAG_VALIDITA = 'Y'
            AND (LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA) <
             (
              SELECT MAX(LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)
              FROM LSRTIT
              WHERE LSRTIT_KEY_ID_RICEV = @CodLotto
              AND LSRTIT_TIPO = 'T'  
              AND 
               (
                LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA
               ) <= 
               (
                SELECT MAX((LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)) 
                FROM LSRTIT
                WHERE LSRTIT_KEY_ID_RICEV = @CodLotto
                AND LSRTIT_DATA_VALIDITA <= CONVERT(CHAR(8),GETDATE(),112)
                AND LSRTIT_FLAG_VALIDITA = 'Y'
               )
              AND LSRTIT_FLAG_VALIDITA = 'Y'
              AND LSRTIT_TIPO_PROVV='I'
             )
           )
  
          IF Ltrim(Rtrim(@dataInizio))<>''
            BEGIN
              SELECT @dataFine =  convert(char(8),DATEADD(day, -1, lsrtit_data_validita ),112)
              ,@indirizzoOld=LTRIM(RTRIM(lsrric_indirizzo))
              FROM lsrtit a,lsrric b
              WHERE (lsrtit_data_validita + lsrtit_ora_validita) = 
               (
                SELECT max((lsrtit_data_validita + lsrtit_ora_validita))
                FROM lsrtit 
                WHERE lsrtit_key_id_ricev = a.lsrtit_key_id_ricev 
                AND lsrtit_data_validita <= CONVERT(CHAR(8),GETDATE(),112)
                AND lsrtit_flag_validita = 'Y'
                AND LSRTIT_TIPO_PROVV='I'
               )
              AND  lsrtit_flag_validita = 'Y'
              AND lsrtit_key_id_ricev = @CodLotto
              AND 
               (
                lsrric_data_validita + lsrric_ora_validita
               ) = 
               (
                SELECT max((lsrric_data_validita + lsrric_ora_validita))
                FROM lsrric
                WHERE lsrric_key_id_ricev = b.lsrric_key_id_ricev
                AND lsrric_data_validita <=@dataFine
                AND lsrric_flag_validita = 'Y'
               )
              AND lsrric_flag_validita = 'Y'
              AND lsrric_key_id_ricev = @codLotto
              AND lsrtit_key_id_ricev = lsrric_key_id_ricev

              SELECT @q = count(*),
              @titPrec =case @q
                when 0 then 'N'
                else 'Y'
              end 
              FROM dbo.lsrser_TRIS 
              WHERE lsrser_TRIS_data_decor>= @dataInizio
              AND lsrser_TRIS_data_decor< @dataFine
              AND lsrser_TRIS_flag_validita='Y'
              AND lsrser_TRIS_key_id_ricev=@CodLotto
              AND lsrser_TRIS_stato='1'
            END
----------------------------
          SELECT @statoSt = 'A'

          SELECT @lsrprodecordal=lsrpro_decor_dal
          FROM LSRPRO a
          WHERE LSRPRO_FLAG_VALIDITA='Y' 
          AND lsrpro_ft_vos <> '00000000'
          AND lsrpro_flag_validita = 'y'
          AND lsrpro_key_tipo_rec = 'E'
          AND lsrpro_decor_dal > isNull(
           (
            SELECT MAX(lsraps_TRIS_key_data_ins) 
            FROM lsraps_TRIS b
            WHERE  LSRaps_TRIS_KEY_ID_RICEV = @CodLotto
            AND LSRaps_TRIS_FLAG_anag = '1'
           ) ,'00000000')   ---ricev con provv E o T successivo a invio APS
          AND LSRPRO_KEY_ID_RICEV=@CodLotto      

          IF  @lsrprodecordal is not null 
            BEGIN
              SELECT @CognomePrec=b.lsrtit_cognome,
              @NomePrec=b.lsrtit_nome,
              @IndirizzoPrec=a.lsrric_indirizzo
              FROM lsrric a, lsrtit b
              WHERE 
               (
                lsrric_data_validita + lsrric_ora_validita
               ) =
               (
                SELECT max((lsrric_data_validita + lsrric_ora_validita)) 
                FROM lsrric
                WHERE lsrric_key_id_ricev = a.lsrric_key_id_ricev
                AND lsrric_data_validita <@lsrprodecordal
                AND lsrric_flag_validita = 'Y'
               )
              AND lsrric_flag_validita = 'Y'
              AND lsrric_key_id_ricev = @codLotto  
              AND 
               (
                lsrtit_data_validita + lsrtit_ora_validita
               ) =
               (
                SELECT max((lsrtit_data_validita + lsrtit_ora_validita)) 
                FROM lsrtit
                WHERE lsrtit_key_id_ricev = b.lsrtit_key_id_ricev
                AND lsrtit_data_validita <@lsrprodecordal
                AND lsrtit_flag_validita = 'Y'
               )
              AND lsrtit_flag_validita = 'Y'
              AND lsrtit_key_id_ricev = @codLotto  
              AND lsrric_key_id_ricev=lsrtit_key_id_ricev
              IF @CognomePrec<>@Cognome or @CognomePrec<>@Cognome or @IndirizzoPrec<>@Indirizzo
                BEGIN
  if @DataElab is null 
     begin

          insert into temporaneaAps values(@CodLotto, '2',@codAmm,Replace(@cognome,'''',''''''),Replace(@nome,'''',''''''),@statoSt,@contratto,@fide,Replace(@indirizzo,'''',''''''),Replace(@indirizzoOld,'''',''''''),Replace(@cognomeOld,'''',''''''),Replace(@nomeOld,'''',''''''),@nmrInvio,'','','','Y',@titPrec,@cap,@provincia,Replace(@comune,'''',''''''))
               --   INSERT INTO temporaneaAps VALUES(@CodLotto, '1',@codAmm,@cognome,@nome,@statoSt,@contratto,@fide,@indirizzo,@indirizzoOld,@cognomeOld,@nomeOld,@nmrInvio,'','','','Y',@titPrec,@cap,@provincia,@comune)
end
                END
            END
        END 

      SELECT @i=@i+1
      Print @CodLotto
      Print @dataElab
      Print (@contratto)
      Print (@Fide)
      Print Str(@i)


      FETCH NEXT FROM ScorriRicE INTO @codLotto
    END
  CLOSE ScorriRicE
  DEALLOCATE ScorriRicE
---------------------------
END
GO
