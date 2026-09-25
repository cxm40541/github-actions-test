/****** Object:  StoredProcedure [dbo].[ANA_CREA_LSRGEN]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ANA_CREA_LSRGEN] 
 

AS

DECLARE

@CODLTM   CHAR(6),

@CODAMM   CHAR(6),

@DECODLTM   CHAR(50),

@COMUNE   CHAR(24),

@PROVINCIA   CHAR(2),

@CAP    CHAR(5),

@INDIRIZZO   CHAR(40),

@COGNOME   CHAR(24),

@NOME   CHAR(20),

@DATADECOR   CHAR(8),

@DATADECORI  CHAR(8),

@DATADECORAL    CHAR(8),

@DATANASC   CHAR(8),

@TIPOPROVV   CHAR(1),

@DATAPROVV   CHAR(8),

@CODFISC   CHAR(17),

@PROVVPREC   CHAR(1),

@OGGI    CHAR(8),

@DECOD_RICEV   CHAR(50),

@PROGPROVV   CHAR(14),

@COMUNE_RIC  CHAR(24),

@PROV_RIC   CHAR(2),

@CAP_RIC   CHAR(5),

@INDIRIZZO_RIC  CHAR(40),

@IC_RIC   CHAR(2),

@CHKOK   BIT,

@MSGERR   VARCHAR(255),

@NOMEJOB   VARCHAR(25)

 

---2 feb 2006  aggiunto in ogni update cod_amm     

 

SELECT @NOMEJOB = 'AACG012003GN'

SELECT @OGGI = CONVERT(CHAR(8), GETDATE(), 112)

SELECT @PROVVPREC = NULL

SELECT @DATADECORAL = NULL 

SELECT @CHKOK = 0

 

 

DELETE FROM LSRGEN   WHERE LSRGEN_DATA_NASCITA <>'19000000'

DELETE FROM LSRGEN   WHERE LSRGEN_DATA_NASCITA IS NULL

 

DECLARE CUR_RIC CURSOR FOR

SELECT DISTINCT(LSRRIC_KEY_ID_RICEV)

FROM  LSRRIC

WHERE LSRRIC_FT_VOS <> '00000000'

--AND LSRRIC_KEY_ID_RICEV ='VE3108'

--AND SUBSTRING (LSRRIC_KEY_ID_RICEV, 1, 2) = 'VE'

 

OPEN CUR_RIC

FETCH NEXT FROM CUR_RIC INTO @CODLTM

WHILE @@FETCH_STATUS = 0 

BEGIN

      

      SELECT @PROVVPREC = NULL

            

      --INIZIO IL TRATTAMENTO DEL TITOLARE

      

      DECLARE CUR_TIT CURSOR FOR

      SELECT 

            LSRTIT_COGNOME, LSRTIT_NOME, LSRTIT_DATA_VALIDITA, 

            LSRTIT_TIPO_PROVV, LSRTIT_DATA_PROVV,

            LSRTIT_DATA_NASCITA, LSRTIT_COMUNE_NASCITA,

            LSRTIT_PROVINCIA_NASCITA, LSRTIT_CODICE_FISCALE,LSRTIT_PROG_PROVV

      FROM LSRTIT 

      WHERE LSRTIT_KEY_ID_RICEV = @CODLTM

      AND LSRTIT_FLAG_VALIDITA = 'Y' 

      AND LSRTIT_FT_VOS <> '00000000'

      ORDER BY LSRTIT_DATA_VALIDITA

      --LA UNION AGGIUNTA IL 2.5 PERCHE ZOMPAVO I PROVVEDIMENTI NULLI

      OPEN CUR_TIT

      FETCH NEXT FROM CUR_TIT INTO 

@COGNOME, @NOME, @DATADECOR, @TIPOPROVV, @DATAPROVV, @DATANASC, @COMUNE, @PROVINCIA, @CODFISC, @PROGPROVV

      WHILE @@FETCH_STATUS = 0 

      BEGIN

 

 

            SELECT @CODAMM = LSRRIC_COD_AMM, 

                  @DECOD_RICEV=LSRRIC_DECOD_RICEV,

                  @INDIRIZZO_RIC = LSR01A_INDIRIZZO,

                  @CAP_RIC = LSR01A_CAP,

                  @COMUNE_RIC = LSR01A_COMUNE_RICEV,

                  @IC_RIC = LSR01A_SIGLA_IC,

                  @PROV_RIC  = LSR01A_PROV_RICEV

            FROM LSRRIC, CONDIVISO.DBO.LSR01A

            WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                  AND LSR01A_KEY_ID_RICEV = @CODLTM

                  AND LSRRIC_FLAG_VALIDITA = 'Y'

                  AND LSRRIC_FT_VOS <> '00000000'

                  AND LSRRIC_DATA_VALIDITA = 

                        (SELECT MAX(LSRRIC_DATA_VALIDITA) 

                        FROM LSRRIC 

                        WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                              AND LSRRIC_DATA_VALIDITA <= @DATADECOR

                              AND LSRRIC_FT_VOS <> '00000000'

                              AND LSRRIC_FLAG_VALIDITA = 'Y')

 

            IF @PROVVPREC IS NULL

            BEGIN

                  SELECT @PROVVPREC = @TIPOPROVV

                  SELECT @DATADECORI = @DATADECOR

                  SELECT @CHKOK = 1

            END

            ELSE

            BEGIN

                  IF (@PROVVPREC = 'E' AND @TIPOPROVV = 'E')

                  BEGIN

                        SELECT @PROVVPREC = @TIPOPROVV

            

                        UPDATE LSRGEN SET

                               LSRGEN_COGNOME = @COGNOME,

                         LSRGEN_NOME = @NOME,

                               LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                               lsrgen_cod_amm = @CODAMM

                        WHERE

                              LSRGEN_COD_LTM = @CODLTM

                              AND LSRGEN_DATA_DECOR = @DATADECORI

                  END

                  ELSE IF (@PROVVPREC = 'E' AND @TIPOPROVV = 'I')

                  BEGIN

                        SELECT @CODAMM = LSRRIC_COD_AMM, 

                        @DECOD_RICEV=LSRRIC_DECOD_RICEV,

                              @INDIRIZZO_RIC = LSR01A_INDIRIZZO,

                              @CAP_RIC = LSR01A_CAP,

                              @COMUNE_RIC = LSR01A_COMUNE_RICEV,

                              @IC_RIC = LSR01A_SIGLA_IC,

                        @PROV_RIC  = LSR01A_PROV_RICEV

                        FROM  LSRRIC, CONDIVISO.DBO.LSR01A

                        WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                              AND LSR01A_KEY_ID_RICEV = @CODLTM

                              AND LSRRIC_FLAG_VALIDITA = 'Y'

                              AND LSRRIC_FT_VOS <> '00000000'

                              AND LSRRIC_DATA_VALIDITA = 

                                    (SELECT MAX(LSRRIC_DATA_VALIDITA) 

                                    FROM LSRRIC 

                                    WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                                          AND LSRRIC_FT_VOS <> '00000000'

                                          AND LSRRIC_DATA_VALIDITA < @DATADECOR

                                          AND LSRRIC_FLAG_VALIDITA = 'Y')

                        UPDATE LSRGEN SET

                              LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                              lsrgen_cod_amm = @CODAMM

                        WHERE

                              LSRGEN_COD_LTM = @CODLTM

                        AND   LSRGEN_DATA_DECOR = @DATADECORI

                        --    SELECT @CHKOK = 1

 

        

                        SELECT @PROVVPREC = @TIPOPROVV

                        SELECT @DATADECORI = @DATADECOR

                        SELECT @CHKOK = 1

                  END

                  ELSE IF (@PROVVPREC = 'E' AND @TIPOPROVV = 'C')

                  BEGIN

 

                        SELECT @CODAMM = LSRRIC_COD_AMM, 

                              @DECOD_RICEV=LSRRIC_DECOD_RICEV,

                        @INDIRIZZO_RIC = LSR01A_INDIRIZZO,

                              @CAP_RIC = LSR01A_CAP,

                              @COMUNE_RIC = LSR01A_COMUNE_RICEV,

                              @IC_RIC = LSR01A_SIGLA_IC,

                              @PROV_RIC  = LSR01A_PROV_RICEV

                        FROM LSRRIC, CONDIVISO.DBO.LSR01A

                        WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                              AND LSR01A_KEY_ID_RICEV = @CODLTM

                              AND LSRRIC_FLAG_VALIDITA = 'Y'

                              AND LSRRIC_FT_VOS <> '00000000'

                              AND LSRRIC_DATA_VALIDITA = 

                                    (SELECT MAX(LSRRIC_DATA_VALIDITA) 

                                    FROM LSRRIC 

                                    WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                                          AND LSRRIC_FT_VOS <> '00000000'

                                          AND  LSRRIC_DATA_VALIDITA < @DATADECOR

                                          AND  LSRRIC_FLAG_VALIDITA = 'Y')

                        UPDATE LSRGEN SET

                         LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                               lsrgen_cod_amm = @CODAMM

                        WHERE

                              LSRGEN_COD_LTM = @CODLTM

                              AND LSRGEN_DATA_DECOR = @DATADECORI

                        --    SELECT @CHKOK = 1

 

                        SELECT @PROVVPREC = @TIPOPROVV

                        SELECT @DATADECORI = @DATADECOR

                        SELECT @CHKOK = 1

                  END

                  ELSE IF (@PROVVPREC = 'I' AND @TIPOPROVV = 'I')

                  BEGIN

 

                        SELECT @CODAMM = LSRRIC_COD_AMM, 

                              @DECOD_RICEV=LSRRIC_DECOD_RICEV,

                        @INDIRIZZO_RIC = LSR01A_INDIRIZZO,

                              @CAP_RIC = LSR01A_CAP,

                              @COMUNE_RIC = LSR01A_COMUNE_RICEV,

                              @IC_RIC = LSR01A_SIGLA_IC,

                              @PROV_RIC  = LSR01A_PROV_RICEV

                        FROM  LSRRIC, CONDIVISO.DBO.LSR01A

                        WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                              AND LSR01A_KEY_ID_RICEV = @CODLTM

                              AND LSRRIC_FLAG_VALIDITA = 'Y'

                              AND LSRRIC_FT_VOS <> '00000000'

                              AND LSRRIC_DATA_VALIDITA = 

                                    (SELECT MAX(LSRRIC_DATA_VALIDITA) 

                                    FROM LSRRIC 

                                    WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                                          AND LSRRIC_DATA_VALIDITA < @DATADECOR

                                          AND LSRRIC_FT_VOS <> '00000000'

                                          AND LSRRIC_FLAG_VALIDITA = 'Y')

                        UPDATE LSRGEN SET

                               LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                               lsrgen_cod_amm = @CODAMM

                        WHERE

                              LSRGEN_COD_LTM = @CODLTM

                        AND   LSRGEN_DATA_DECOR = @DATADECORI

                        --    SELECT @CHKOK = 1

 

 

                        SELECT @PROVVPREC = @TIPOPROVV

                        SELECT @DATADECORI = @DATADECOR

                        SELECT @CHKOK = 1

                  END

                  ELSE IF (@PROVVPREC = 'I' AND @TIPOPROVV = 'E')

                  BEGIN

                        SELECT @PROVVPREC = @TIPOPROVV

            

            

                        UPDATE LSRGEN SET

                              LSRGEN_COGNOME = @COGNOME,

                              LSRGEN_NOME = @NOME,

                              LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                              lsrgen_cod_amm = @CODAMM

                        WHERE

                              LSRGEN_COD_LTM = @CODLTM

                        AND   LSRGEN_DATA_DECOR = @DATADECORI

                        --    SELECT @CHKOK = 1

                  END

                  ELSE IF (@PROVVPREC = 'I' AND @TIPOPROVV = 'C')

                  BEGIN

 

                        SELECT @CODAMM = LSRRIC_COD_AMM, 

                              @DECOD_RICEV=LSRRIC_DECOD_RICEV,

                              @INDIRIZZO_RIC = LSR01A_INDIRIZZO,

                              @CAP_RIC = LSR01A_CAP,

                              @COMUNE_RIC = LSR01A_COMUNE_RICEV,

                              @IC_RIC = LSR01A_SIGLA_IC,

                              @PROV_RIC  = LSR01A_PROV_RICEV

                        FROM LSRRIC, CONDIVISO.DBO.LSR01A

                        WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                              AND LSR01A_KEY_ID_RICEV = @CODLTM

                              AND LSRRIC_FLAG_VALIDITA = 'Y'

                              AND LSRRIC_FT_VOS <> '00000000'

                              AND LSRRIC_DATA_VALIDITA = 

                                    (SELECT MAX(LSRRIC_DATA_VALIDITA) 

                                    FROM LSRRIC 

                                    WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                                          AND LSRRIC_FT_VOS <> '00000000'

                                          AND LSRRIC_DATA_VALIDITA < @DATADECOR

                                          AND LSRRIC_FLAG_VALIDITA = 'Y')

                        UPDATE LSRGEN SET

                              LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                              lsrgen_cod_amm = @CODAMM

                        WHERE

                              LSRGEN_COD_LTM = @CODLTM

                        AND   LSRGEN_DATA_DECOR = @DATADECORI

                        --    SELECT @CHKOK = 1

 

                        SELECT @PROVVPREC = @TIPOPROVV

                        SELECT @DATADECORI = @DATADECOR

                        SELECT @CHKOK = 1

                  END

                  ELSE IF (@PROVVPREC = 'C' AND @TIPOPROVV = 'I')

                  BEGIN

 

                        SELECT @CODAMM = LSRRIC_COD_AMM, 

                              @DECOD_RICEV=LSRRIC_DECOD_RICEV,

                              @INDIRIZZO_RIC = LSR01A_INDIRIZZO,

                              @CAP_RIC = LSR01A_CAP,

                              @COMUNE_RIC = LSR01A_COMUNE_RICEV,

                              @IC_RIC = LSR01A_SIGLA_IC,

                              @PROV_RIC  = LSR01A_PROV_RICEV

                        FROM LSRRIC, CONDIVISO.DBO.LSR01A

                        WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                              AND LSR01A_KEY_ID_RICEV = @CODLTM                 

                              AND LSRRIC_FLAG_VALIDITA = 'Y'

                              AND LSRRIC_FT_VOS <> '00000000'

                              AND LSRRIC_DATA_VALIDITA = 

                                    (SELECT MAX(LSRRIC_DATA_VALIDITA) 

                                    FROM LSRRIC 

                                    WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                                          AND LSRRIC_DATA_VALIDITA < @DATADECOR

                                          AND LSRRIC_FT_VOS <> '00000000'

                                          AND LSRRIC_FLAG_VALIDITA = 'Y')

                        UPDATE LSRGEN SET

                        LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                        lsrgen_cod_amm = @CODAMM

                        WHERE

                        LSRGEN_COD_LTM = @CODLTM

                        AND LSRGEN_DATA_DECOR = @DATADECORI

                        --    SELECT @CHKOK = 1

 

                        SELECT @PROVVPREC = @TIPOPROVV

                        SELECT @DATADECORI = @DATADECOR

                        SELECT @CHKOK = 1

                  END

                  ELSE IF (@PROVVPREC = 'C' AND @TIPOPROVV = 'E')

                  BEGIN

                        SELECT @PROVVPREC = @TIPOPROVV

                        

                        UPDATE LSRGEN SET

                              LSRGEN_COGNOME = @COGNOME,

                              LSRGEN_NOME = @NOME,

                              LSRGEN_DECOD_RICEV =@DECOD_RICEV,

                              lsrgen_cod_amm = @CODAMM

                        WHERE

                              LSRGEN_COD_LTM = @CODLTM

                        AND   LSRGEN_DATA_DECOR = @DATADECORI

                        

                        --    SELECT @CHKOK = 1

                  END

            

            END

            IF @CHKOK = 1

            BEGIN

 

                  SELECT @CODAMM = LSRRIC_COD_AMM, 

                        @DECOD_RICEV=LSRRIC_DECOD_RICEV,

                        @INDIRIZZO_RIC = LSR01A_INDIRIZZO,

                        @CAP_RIC = LSR01A_CAP,

                        @COMUNE_RIC = LSR01A_COMUNE_RICEV,

                        @IC_RIC = LSR01A_SIGLA_IC,

                        @PROV_RIC  = LSR01A_PROV_RICEV

                  FROM LSRRIC, CONDIVISO.DBO.LSR01A

                  WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                        AND LSR01A_KEY_ID_RICEV = @CODLTM

                        AND LSRRIC_FLAG_VALIDITA = 'Y'

                        AND LSRRIC_FT_VOS <> '00000000'

                        AND LSRRIC_DATA_VALIDITA = 

                              (SELECT MAX(LSRRIC_DATA_VALIDITA) 

                              FROM LSRRIC 

                              WHERE LSRRIC_KEY_ID_RICEV = @CODLTM

                                    AND  LSRRIC_DATA_VALIDITA <= @DATADECOR

                                    AND LSRRIC_FT_VOS <> '00000000'

                                    AND  LSRRIC_FLAG_VALIDITA = 'Y')

                                    

                  INSERT INTO LSRGEN VALUES

                  (@CODLTM, @CODAMM,  @DATADECORI, @DATADECORAL ,@COGNOME, @NOME,@TIPOPROVV, 

                  @DATAPROVV, @DATANASC, @COMUNE, @PROVINCIA, @CODFISC, @DECOD_RICEV,

                  @INDIRIZZO_RIC, @COMUNE_RIC, @CAP_RIC, @PROV_RIC, @IC_RIC)

                  

                  IF @@ERROR <> 0

                  

                  BEGIN

                        SELECT @MSGERR = 'ERRORE IN INSERIMENTO RECORD SU LSRGEN - RICEVITORIA ' + @CODLTM

                        RAISERROR (@MSGERR, 16, 1)

                        EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0

                        EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. CREA_LSRGEN TERMINATA IN MODO ANOMALO', 0

                        CLOSE CUR_TIT

                        DEALLOCATE CUR_TIT

                        RETURN

                  END

            

            

            END

            

            SELECT @CHKOK = 0

            SELECT @DATADECORAL = NULL 

            SELECT @COGNOME = NULL

            SELECT @NOME = NULL

            SELECT @DATADECOR = NULL

            SELECT @TIPOPROVV = NULL

            SELECT @DATAPROVV = NULL

            SELECT @PROGPROVV = NULL

      

            FETCH NEXT FROM CUR_TIT INTO 

            @COGNOME, @NOME, @DATADECOR, @TIPOPROVV, @DATAPROVV, @DATANASC, @COMUNE, @PROVINCIA, @CODFISC,@PROGPROVV

            END

      

      CLOSE CUR_TIT

      DEALLOCATE CUR_TIT

      

      FETCH NEXT FROM CUR_RIC INTO @CODLTM

END

 

CLOSE CUR_RIC

DEALLOCATE CUR_RIC

 

select LSRGEN_COD_LTM

      ,LSRGEN_DATA_DECOR

      ,LSRGEN_DATA_DECOR_AL = 

      (

            IsNull( 

            (select convert(varchar(8), dateadd(day, -1,convert(datetime,min(b.LSRGEN_DATA_DECOR), 112)), 112)  

             from LSRGEN b

             where b.LSRGEN_COD_LTM = a.LSRGEN_COD_LTM

                   and b.LSRGEN_DATA_DECOR > a.LSRGEN_DATA_DECOR)

            ,'99999999')

      )

into #tmp_update

from LSRGEN a

 

UPDATE LSRGEN 

set LSRGEN_DATA_DECOR_AL = x.LSRGEN_DATA_DECOR_AL

--select a.LSRGEN_COD_LTM, x.*

from LSRGEN a, #tmp_update x

where a.LSRGEN_COD_LTM = x.LSRGEN_COD_LTM

and a.LSRGEN_DATA_DECOR = x.LSRGEN_DATA_DECOR

 

UPDATE LSRGEN 

SET LSRGEN_DECOD_RICEV = LSR01A_DECOD_RICEV

FROM LSRGEN, CONDIVISO.DBO.LSR01A 

WHERE LSR01A_KEY_ID_RICEV = LSRGEN_COD_LTM

AND LSRGEN_DATA_DECOR_AL = '99999999'

 

 

EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. CREA_LSRGEN TERMINATA CORRETTAMENTE', 0
GO
