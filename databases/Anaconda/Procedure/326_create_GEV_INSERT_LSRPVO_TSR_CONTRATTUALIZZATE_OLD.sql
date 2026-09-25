/****** Object:  StoredProcedure [dbo].[GEV_INSERT_LSRPVO_TSR_CONTRATTUALIZZATE_OLD]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE         PROCEDURE [dbo].[GEV_INSERT_LSRPVO_TSR_CONTRATTUALIZZATE_OLD] 

 

AS

 

 

 

--**************** LEGENDA **********************************************

 

-- nR=  NUMERO TOTALE DI RICEVITORIE

 

-- nO=  NUMERO TOTALE DI OPERATORI

 

-- nRO= NUMERO DI RICEVITORIE PER OPERATORE 

 

-- nRXCCez(x)= NUMERO DI RICEVITORIE EXTRACARICO 

 

--      FLUSSO PRECEDENTA DEL CEZ x

 

-- nOCez(x)=  NUMERO DI OPERATORI DEL CEZ x

 

-- nTRCez(x)= NUMERO TEORICO DI RICEVITORIE DEL CEZ x

 

-- nRLCez(x)= NUMERO DI RICEVITORIE "LOCALI" DEL CEZ x

 

-- nRXLCez(x)=                                                                NUMERO DI RICEVITORIE "EXTRALOCALI" DEL CEZ x

 

-- nRAXLCez(x)= NUMERO DI RICEVITORIE "EXTRALOCALI" DI CLASSE A DEL CEZ x

 

-- nRBXLCez(x)= NUMERO DI RICEVITORIE "EXTRALOCALI" DI CLASSE B DEL CEZ x

 

-- nRCXLCez(x)= NUMERO DI RICEVITORIE "EXTRALOCALI" DI CLASSE C DEL CEZ x

 

-- pAXL= PERCENTUALE DI A TRA LE "EXTRALOCALI" 

 

-- pBXL= PERCENTUALE DI B TRA LE "EXTRALOCALI" 

 

-- pCXL= PERCENTUALE DI C TRA LE "EXTRALOCALI" 

 

 

 

-- nRO=nR/nO

 

-- nTRCez(x)=nRO*nOCez(x)

 

-- nRXLCez(x)=nTRCez(x)-nRLCez(x)

 

-- nRAXLCez(x)=nRXLCez(x)*pAXL/100

 

-- nRBXLCez(x)=nRXLCez(x)*pBXL/100

 

-- nRCXLCez(x)=nRXLCez(x)*pCXL/100

 

--***********************************************************************

 

 

 

 

 

--**************************************************

 

--** TASK 1 - ASSEGNAZIONE RICEVITORIA CEZ

 

--**************************************************

 

 

 

DECLARE 

 

@OGGI  CHAR(8),

 

@DATA_IN_NUOVO_INVIO_SGI  CHAR(8),

 

@TOT_RICEV_BACK_LOG int, -- somma nRXCCez(x) di tutti i CEZ

 

@TOT_RICEV int, -- nR

 

@PERCENT_A float, -- pAXL

 

@PERCENT_B float, -- pBXL

 

@PERCENT_C float -- pCXL 

 

 

 

DECLARE  --STEP 1.1

 

@CEZ  CHAR(2),

 

@CEZ_APPO CHAR(2),

 

@CLASSE  CHAR(1),

 

@CLASSE_APPO  CHAR(1),

 

@CONTA_RIC  INT,

 

@nRXLCez INT,

 

@RICEV  CHAR(6)

 

 

 

 

 

DECLARE --STEP 1.2

 

@nMRXLCez INT

 

 

 

/*

 

DECLARE --STEP 2.1

 

@N_R_OP smallint,

 

@CONTA_OP smallint,

 

@COD_OP Char(3),

 

@COD_OP_APPO Char(3)

 

*/

 

 

 

--TASK 3.1

 

DECLARE 

 

@OP char(3)

 

 

 

--***************************

 

--** Selezione data corrente

 

--**************************

 

--** 

 

SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)

 

 

 

--E' la data dalla quale devo partire

 

--per la selezione di pv da inviare a SGI

 

/*

 

SELECT  

 

 @DATA_IN_NUOVO_INVIO_SGI=

 

 CONVERT(VARCHAR, CONVERT(DATETIME, MAX(lsrpvo_data_invio_SGI),103)+1,112)

 

FROM lsrpvo

 

*/

 

SELECT @DATA_IN_NUOVO_INVIO_SGI=CONVERT(VARCHAR, CONVERT(datetime, @OGGI,103)-6,112)

 

 

 

 

 

--********************************************

 

--** Conteggio numero totale di  di operatori 

 

--** 28/04/2004 - Con la nuova procedura non serve

 

--*******************************************

 

-- nO

 

 

 

insert into lsrcez_cc_storico_sint

 

values(@OGGI,'BA', 0,0)

 

insert into lsrcez_cc_storico_sint

 

values(@OGGI,'CA', 0,0)

 

insert into lsrcez_cc_storico_sint

 

values(@OGGI,'PA', 0,0)

 

--insert into lsrcez_cc_storico_sint

 

--values(@OGGI,'RM', 0,0)

 

 

 

--Modifica del 9/8/2004

 

insert into lsrcez_cc_storico_sint

 

values(@OGGI,'RR', 0,0)

 

 

 

insert into lsrcez_cc_storico_sint

 

values(@OGGI,'TO', 0,0)

 

 

 

 

 

--*************************************************

 

--** Calcolo extra-carico flusso precedente per Cez

 

--************************************************* 

 

-- nRXCCez(x)

 

--Modifica del 26/04/2005

 

select Cez=lsrcez_cc_storico_sint_prov, 

 

N_extra_carico=case when lsrcez_cc_storico_N_extra_carico<0 then 0 else lsrcez_cc_storico_N_extra_carico end

 

into ##TMP_nRXCCez

 

from lsrcez_cc_storico_sint,

 

(

 

 select max_data=max(lsrcez_cc_storico_sint_data_ins)

 

 from lsrcez_cc_storico_sint

 

 where lsrcez_cc_storico_sint_data_ins<@OGGI

 

)MAX_DATA

 

where lsrcez_cc_storico_sint_data_ins=max_data  

 

 

 

--******************************************

 

--** SELEZIONE RICEVITORIE CONTRATTUALIZZATE 

 

--******************************************

 

select 

 

ricevitoria=lsrpvo_key_id_ricev,

 

classe=lsrpvo_classe,

 

--assegnazione delle province di Trento e Bolzano al CEZ di Torino

 

prov=case when lsr01a_prov_ricev='BZ' or lsr01a_prov_ricev='TN' then 'TO' 

 

    --Modifica del 9/8/2004

 

    when lsr01a_prov_ricev='RM' then 'RR' --RM = COS, RR = CEZ di Roma

 

    else lsr01a_prov_ricev end

 

into ##TMP_FLUSSO

 

from 

 

(

 

-- seleziono tutte le ricevitorie contrattualizzate nella settimana

 

-- oppure tutte quelle non contrattualizzate ma attivate

 

 SELECT a.*

 

 FROM lsrpvo a, gev_decod_ltm_sgi b

 

 WHERE 

 

 (lsrpvo_data_inizio between @DATA_IN_NUOVO_INVIO_SGI and @OGGI

 

 OR lsrpvo_data_invio_SGI between @DATA_IN_NUOVO_INVIO_SGI and @OGGI)

 

 AND (lsrpvo_operatore='' or lsrpvo_operatore is null)

 

 AND substring(lsrpvo_key_id_ricev,1,2) = b.Rete_LTM

 

 AND Key_Desc in ('LTM', 'CONI')

 

)LSRPVO,

 

(

 

 select lsr01a_key_id_ricev,lsr01a_prov_ricev

 

 from condiviso.dbo.lsr01a

 

)S

 

where lsrpvo_key_id_ricev=lsr01a_key_id_ricev

 

 

 

-- select * from ##tmp_flusso

 

 

 

--Assegno l'operatore di default e il gg di contatto di default 

 

--ai PV di classe 'D'

 

/*

 

UPDATE lsrpvo

 

set  lsrpvo_operatore='AA_', lsrpvo_gg_contatto='1'

 

WHERE --lsrpvo_data_inizio between '20040721' and '20040727'

 

--** DA SCOMMENTARE 

 

(lsrpvo_data_inizio between @DATA_IN_NUOVO_INVIO_SGI and @OGGI

 

OR lsrpvo_data_invio_SGI between @DATA_IN_NUOVO_INVIO_SGI and @OGGI)

 

AND (lsrpvo_operatore='' or lsrpvo_operatore is null)

 

AND lsrpvo_classe='D'

 

*/

 

 

 

--*************************************************

 

--** Sottoinsieme L di T composto dalle ricevitorie 

 

--** "Locali" suddivise per Cez (secondo 

 

--** l'abbinamento Cez-Provincia) e per Classe 

 

--*************************************************

 

-- RLCez(x)

 

SELECT ricevitoria, cez=lsrcez_cc_provincia, classe

 

INTO ##TMP_LOCALI

 

FROM ##TMP_FLUSSO s,lsrcez_cc

 

WHERE prov=lsrcez_cc_provincia

 

 

 

--***!!! RM non deve essere presente tra le locali ma ci deve essere RR

 

 

 

--********************************************

 

--** Sottoinsieme XL di T (complementare di L)

 

--** composto dalle ricevitorie 

 

--** "ExtraLocali" suddivise per Cez (secondo 

 

--** l'abbinamento Cez-Regione della tabella 

 

--** lsrcez_cc_regioni) e per Classe 

 

--********************************************

 

-- RXLCez(x)

 

SELECT ricevitoria, cez_regione=lsrcez_cc_regioni_prov, classe, cez_assegnato='   '

 

INTO ##TMP_EXTRALOCALI

 

FROM ##TMP_FLUSSO tf,

 

--condiviso.dbo.LTB01A,

 

--DA SCOMMENTARE

 

[SQL-DBSAN1\A].condiviso.dbo.LTB01A,

 

--FINE DA SCOMMENTARE

 

lsrcez_cc_regioni

 

WHERE tf.prov=ltb01a_sigla_prov

 

and ltb01a_regione=lsrcez_cc_regioni_regione

 

and ricevitoria NOT IN

 

(

 

 SELECT ricevitoria 

 

 FROM ##TMP_LOCALI

 

)

 

 

 

--*****************************************************************

 

--** Conteggio locali per CEZ e per classe di appartenenza 

 

--** nella segmentazione ed aggiornamento tabella lsrcez_cc_storico

 

--*****************************************************************

 

--%%%%%%% Modificato il 20/07/2004 M1

 

/*

 

INSERT INTO lsrcez_cc_storico

 

SELECT data=@OGGI, --@OGGI

 

cez, classe, locali=count(*), extralocali=0

 

FROM ##TMP_LOCALI

 

GROUP BY cez, classe

 

ORDER BY cez, classe

 

*/

 

--%%%%%%% Fine Modifica M1 del 20/07/2004

 

INSERT INTO lsrcez_cc_storico

 

SELECT lsrcez_cc_storico_data_ins=@OGGI, --'20040720'

 

lsrcez_cc_storico_prov=cez, lsrcez_cc_storico_classe=classe,lsrcez_cc_storico_N_locali=sum(locali),

 

lsrcez_cc_storico_N_extralocali=sum(extralocali)

 

FROM

 

(

 

 select

 

 cez, classe, locali=count(*), extralocali=0

 

 FROM ##TMP_LOCALI

 

 GROUP BY cez, classe

 

 UNION

 

 select lsrcez_cc_operatori_cez, lsrcez_cc_operatori_classe, 0,0

 

 from lsrcez_cc_operatori

 

 group by lsrcez_cc_operatori_cez, lsrcez_cc_operatori_classe

 

)C

 

GROUP BY cez, classe

 

ORDER BY cez, classe

 

 

 

--****************************************

 

--** Totale extra-carico flusso precedente 

 

--****************************************

 

-- nRXC

 

--CORREZIONE 26/04/2005

 

select @TOT_RICEV_BACK_LOG=case when sum(N_extra_carico)<0 then 0 else sum(N_extra_carico) end --*** -41

 

from ##TMP_nRXCCez

 

 

 

 

 

--********************************

 

--** Calcolo nTRCez(x) e nRXLCez(x)

 

--** nuovi requisiti 28/04/2004

 

--********************************

 

 

 

select @TOT_RICEV=count(*)+@TOT_RICEV_BACK_LOG

 

from ##TMP_FLUSSO

 

 

 

select Cez=lsrcez_cc_provincia, --23141 su 23143 resto=2

 

nTRCez=round((lsrcez_cc_peso*@TOT_RICEV),0),

 

nRXLCez=round((lsrcez_cc_peso*@TOT_RICEV),0) - sum(lsrcez_cc_storico_N_locali)-N_extra_carico

 

into ##TMP_nRXLCez

 

from lsrcez_cc,lsrcez_cc_storico,##TMP_nRXCCez

 

where lsrcez_cc_storico_data_ins=@OGGI --@OGGI

 

and lsrcez_cc_provincia=lsrcez_cc_storico_prov

 

and lsrcez_cc_storico_prov=Cez

 

group by lsrcez_cc_provincia, lsrcez_cc_peso, N_extra_carico

 

 

 

--*************************************************************

 

--** Inserimento nTRCez(x) nella tabella lsrcez_cc_storico_sint

 

--*************************************************************

 

 

 

update lsrcez_cc_storico_sint

 

set lsrcez_cc_storico_N_teoriche=nTRCez

 

from

 

(

 

 SELECT Cez, nTRCez

 

 FROM  ##TMP_nRXLCez 

 

)storico

 

where lsrcez_cc_storico_sint_data_ins=@OGGI --@OGGI

 

and lsrcez_cc_storico_sint_prov=Cez

 

 

 

 

 

 

 

--***************************

 

--** Calcolo pAXL, pBXL, pCXL

 

--***************************

 

SELECT 

 

--@PERCENT_A=round(convert(float,sum(A))/count(*),2)*100,

 

--@PERCENT_B=round(convert(float,sum(B))/count(*),2)*100,

 

--@PERCENT_C=round(convert(float,sum(C))/count(*),2)*100

 

@PERCENT_A=(convert(float,sum(A))/count(*))*100,

 

@PERCENT_B=(convert(float,sum(B))/count(*))*100,

 

@PERCENT_C=(convert(float,sum(C))/count(*))*100

 

FROM

 

(

 

 SELECT

 

 A=case when classe='A' then 1 else 0 end,

 

 B=case when classe='B' then 1 else 0 end,

 

 C=case when classe='C' then 1 else 0 end

 

 FROM

 

 ##TMP_EXTRALOCALI

 

)XL

 

 

 

 

 

--*******************************************************

 

--** Calcolo nRAXLCez(x), nRBXLCez(x), nRCXLCez(x)

 

--** ed inserimento dei valori all'interno della tabella 

 

--** lsrcez_cc_storico.

 

--*******************************************************

 

 

 

update lsrcez_cc_storico  

 

set lsrcez_cc_storico_N_extralocali=round(convert(float,nRXLCez)*@PERCENT_A/100,0)

 

from

 

##TMP_nRXLCez nRXLCez

 

where lsrcez_cc_storico_data_ins=@OGGI --@OGGI

 

and lsrcez_cc_storico_prov=Cez

 

and lsrcez_cc_storico_classe='A'

 

 

 

 

 

update lsrcez_cc_storico  

 

set lsrcez_cc_storico_N_extralocali=round(convert(float,nRXLCez)*@PERCENT_B/100,0)

 

from

 

##TMP_nRXLCez nRXLCez

 

where lsrcez_cc_storico_data_ins=@OGGI --@OGGI

 

and lsrcez_cc_storico_prov=Cez

 

and lsrcez_cc_storico_classe='B'

 

 

 

 

 

update lsrcez_cc_storico  

 

set lsrcez_cc_storico_N_extralocali=round(convert(float,nRXLCez)*@PERCENT_C/100,0)

 

from

 

##TMP_nRXLCez nRXLCez

 

where lsrcez_cc_storico_data_ins=@OGGI --@OGGI

 

and lsrcez_cc_storico_prov=Cez

 

and lsrcez_cc_storico_classe='C'

 

 

 

--***

 

-- STEP 1 NEW

 

--****************************************************************************

 

-- STEP 1 - Assegno i cez alle ricevitorie extralocali. 

 

-- Il numero totale per Cez è nRAXLCez(x), nRBXLCez(x),nRCXLCez(x)

 

-- rispettivamente per ciascuna classe di appartenenza.

 

-- Per alcuni Cez, il numero delle ricevitorie extra locali appartenenti 

 

-- alle regioni ad essi collegati è inferiore rispetto al numero previsto,

 

-- mentre per altri il numero è logicamente superiore.

 

-- Nello STEP 2 si assegneranno le ricevitorie dei CEZ che le hanno in eccesso

 

-- a quelli che ne hanno in difetto.

 

--****************************************************************************

 

 

 

SELECT IDENTITY(int, 1,1) AS ID_NUM, --25104

 

cez=cez_regione,classe,ricevitoria

 

INTO ##TMP_XL_1 

 

FROM ##TMP_EXTRALOCALI 

 

ORDER BY cez_regione,classe,ricevitoria

 

 

 

DECLARE Get_nRXLCez CURSOR FOR 

 

SELECT  lsrcez_cc_storico_prov, lsrcez_cc_storico_classe, lsrcez_cc_storico_N_extralocali

 

FROM  lsrcez_cc_storico

 

WHERE  lsrcez_cc_storico_data_ins=@OGGI --@OGGI

 

 

 

OPEN Get_nRXLCez

 

 

 

FETCH NEXT FROM Get_nRXLCez INTO @CEZ, @CLASSE, @nRXLCez

 

WHILE @@FETCH_STATUS = 0 

 

BEGIN

 

 SELECT @CEZ_APPO=@CEZ

 

 

 

 WHILE (@CEZ=@CEZ_APPO) AND @@FETCH_STATUS = 0 

 

 BEGIN

 

  SELECT @CLASSE_APPO=@CLASSE

 

 

 

  SELECT @CONTA_RIC=min(ID_NUM)-1

 

  FROM ##TMP_XL_1

 

  WHERE cez=@CEZ_APPO

 

  and classe=@CLASSE_APPO

 

 

 

 

 

  WHILE (@CLASSE=@CLASSE_APPO) AND @@FETCH_STATUS = 0 

 

  BEGIN

 

   UPDATE ##TMP_EXTRALOCALI

 

   SET cez_assegnato=scez

 

   FROM

 

   (

 

    SELECT scez=cez, sclasse=classe, sricevitoria=ricevitoria

 

    FROM ##TMP_XL_1 t

 

    WHERE ID_NUM BETWEEN @CONTA_RIC+1 AND @CONTA_RIC+@nRXLCez

 

   )S

 

   WHERE cez_regione=@CEZ and classe=@CLASSE and ricevitoria=sricevitoria

 

   FETCH NEXT FROM Get_nRXLCez INTO @CEZ, @CLASSE, @nRXLCez

 

  END

 

 END

 

END

 

CLOSE Get_nRXLCez

 

DEALLOCATE Get_nRXLCez

 

 

 

-- FINE STEP 1 NEW

 

 

 

 

 

--**STEP 2

 

 

 

SELECT IDENTITY(int, 1,1) AS ID_NUM, --25104

 

cez=cez_regione,classe,ricevitoria

 

INTO ##TMP_XL_2

 

FROM ##TMP_EXTRALOCALI 

 

WHERE cez_assegnato=''

 

ORDER BY classe,ricevitoria

 

 

 

DECLARE Get_nMRXLCez CURSOR FOR 

 

select 

 

lsrcez_cc_storico_prov,

 

lsrcez_cc_storico_classe,

 

N_ricev_mancanti=lsrcez_cc_storico_N_extralocali-N_ricev_assegnate

 

from lsrcez_cc_storico,

 

(

 

 select cez_assegnato, classe, N_ricev_assegnate=count(*)

 

 from ##TMP_EXTRALOCALI

 

 group by cez_assegnato, classe

 

-- order by cez_assegnato, classe

 

)ASSEGNATI

 

where lsrcez_cc_storico_data_ins=@OGGI --@DATA

 

and lsrcez_cc_storico_prov=cez_assegnato

 

and lsrcez_cc_storico_classe=classe

 

order by 2,3

 

 

 

OPEN Get_nMRXLCez

 

 

 

SELECT @CONTA_RIC=0

 

 

 

FETCH NEXT FROM Get_nMRXLCez INTO @CEZ, @CLASSE, @nMRXLCez

 

WHILE @@FETCH_STATUS = 0 

 

BEGIN

 

 

 

 SELECT @CLASSE_APPO=@CLASSE

 

 

 

 WHILE (@CLASSE=@CLASSE_APPO) AND @@FETCH_STATUS = 0 

 

 BEGIN

 

  SELECT @CEZ_APPO=@CEZ

 

  

 

 

 

  WHILE (@CEZ=@CEZ_APPO) AND @@FETCH_STATUS = 0 

 

  BEGIN

 

 

 

 

 

   UPDATE ##TMP_EXTRALOCALI

 

   SET cez_assegnato=@CEZ

 

   FROM

 

   (

 

    SELECT scez=cez, sclasse=classe, sricevitoria=ricevitoria

 

    FROM ##TMP_XL_2 t

 

    WHERE ID_NUM BETWEEN @CONTA_RIC+1 AND @CONTA_RIC+@nMRXLCez

 

    AND classe=@CLASSE

 

   )S

 

   WHERE  ricevitoria=sricevitoria

 

 

 

   SELECT @CONTA_RIC=@CONTA_RIC+@nMRXLCez

 

   FETCH NEXT FROM Get_nMRXLCez INTO @CEZ, @CLASSE, @nMRXLCez

 

  END

 

 END

 

 

 

END

 

CLOSE Get_nMRXLCez

 

DEALLOCATE Get_nMRXLCez

 

 

 

--**

 

 

 

--NUOVA PROCEDURA

 

-- STEP 3 - Assegno le eventuali ricevitorie mancanti

 

-- al Cez assegnato secondo il criterio regionale.

 

-- Tali ricevitorie sono uguali all'eventuale errore 

 

-- nell'arrotondamento del prodotto tra @TOT_RICEV 

 

-- e i pesi di ciascun Cez +/- eventuali aggiustamenti 

 

-- che si ottengono dai prodotti:

 

-- nRAXLCez(x)=nRXLCez(x)*pAXL/100

 

-- nRBXLCez(x)=nRXLCez(x)*pBXL/100

 

-- nRCXLCez(x)=nRXLCez(x)*pCXL/100

 

 

 

--******************************************

 

-- STEP 3.1 - Assegno le ricevitorie rimanenti

 

--        ai Cez che hanno un numero di 

 

--     ricevitorie inferiori rispetto

 

--     alla distribuzione teorica per 

 

--     cez e per classe

 

--******************************************

 

--

 

 

 

UPDATE ##TMP_EXTRALOCALI

 

SET cez_assegnato=lsrcez_cc_storico_prov

 

FROM

 

(

 

 -- Ricerca dei cez che hanno nella ##TMP_EXTRALOCALI

 

 -- un numero di ricevitorie assegnate minore al numero

 

 -- teorico rispetto alla classe di appartenenza

 

 SELECT lsrcez_cc_storico_prov, lsrcez_cc_storico_classe

 

 FROM lsrcez_cc_storico,

 

 (

 

  SELECT Data_ins=lsrcez_cc_storico_data_ins, 

 

  Cez=lsrcez_cc_storico_prov,

 

  Classe=lsrcez_cc_storico_classe,

 

  N_XL=count(*)

 

  FROM ##TMP_EXTRALOCALI, 

 

  lsrcez_cc_storico 

 

  WHERE

 

  lsrcez_cc_storico_data_ins=@OGGI --@DATA

 

  and cez_assegnato=lsrcez_cc_storico_prov

 

  and classe=lsrcez_cc_storico_classe

 

  GROUP BY lsrcez_cc_storico_data_ins, lsrcez_cc_storico_prov, lsrcez_cc_storico_classe

 

 )N_XL

 

 WHERE

 

 lsrcez_cc_storico_data_ins=Data_ins

 

 and lsrcez_cc_storico_prov=Cez

 

 and lsrcez_cc_storico_classe=Classe

 

 and lsrcez_cc_storico_N_extralocali-N_XL<>0

 

)RESTO

 

WHERE cez_assegnato=''

 

and classe=lsrcez_cc_storico_classe

 

 

 

--******************************************

 

-- STEP 3.2 - Assegno le ricevitorie rimanenti

 

--        al Cez di Roma

 

--******************************************

 

--

 

--modifica del 26/04/2005

 

UPDATE ##TMP_EXTRALOCALI

 

SET cez_assegnato='RR'

 

WHERE cez_assegnato=''

 

 

 

 

 

--******************************************************************

 

-- Aggiorno il numero di XL nella tabella lsrcez_cc_storico:

 

-- il campo lsrcez_cc_storico_N_locali che conteneva il teorico 

 

-- per ciascun Cez sarà aggiornato con il definitivo per ciascun Cez

 

--******************************************************************

 

 

 

UPDATE lsrcez_cc_storico

 

SET lsrcez_cc_storico_N_extralocali=N_XL

 

FROM

 

(

 

 SELECT Data_ins=lsrcez_cc_storico_data_ins, 

 

 Cez=lsrcez_cc_storico_prov,

 

 Classe=lsrcez_cc_storico_classe,

 

 N_XL=count(*)

 

 FROM ##TMP_EXTRALOCALI, 

 

 lsrcez_cc_storico 

 

 WHERE

 

 lsrcez_cc_storico_data_ins=@OGGI --@DATA

 

 and cez_assegnato=lsrcez_cc_storico_prov

 

 and classe=lsrcez_cc_storico_classe

 

 GROUP BY lsrcez_cc_storico_data_ins, lsrcez_cc_storico_prov, lsrcez_cc_storico_classe

 

)RESTO

 

WHERE

 

lsrcez_cc_storico_data_ins=Data_ins

 

and lsrcez_cc_storico_prov=Cez

 

and lsrcez_cc_storico_classe=Classe

 

 

 

 

 

--*****************************************************************

 

-- Inserisco l' extra-carico per ciascun CEZ

 

-- ottenuto dalla differenza del numero effettivo meno il teorico

 

--*****************************************************************

 

 

 

update lsrcez_cc_storico_sint

 

set lsrcez_cc_storico_N_extra_carico=N_effettive-lsrcez_cc_storico_N_teoriche

 

from

 

(

 

 select lsrcez_cc_storico_data_ins,lsrcez_cc_storico_prov, N_effettive=sum(lsrcez_cc_storico_N_extralocali+lsrcez_cc_storico_N_locali)

 

 from lsrcez_cc_storico

 

 where lsrcez_cc_storico_data_ins=@OGGI

 

 group by lsrcez_cc_storico_data_ins,lsrcez_cc_storico_prov

 

)storico

 

where lsrcez_cc_storico_sint_data_ins=lsrcez_cc_storico_data_ins

 

and lsrcez_cc_storico_sint_prov=lsrcez_cc_storico_prov

 

 

 

 

 

--Modifica del 26/04/2005

 

--**************************************************

 

--** TASK 2 - ASSEGNAZIONE RICEVITORIA OPERATORE 

 

--**************************************************

 

 

 

--STEP 1 

 

select IDENTITY(int, 1,1) AS ID_NUM, --25104

 

cez, classe, ricevitoria

 

into ##TMP_TUTTO

 

from

 

(

 

 select cez=cez_assegnato, classe, ricevitoria

 

 from ##TMP_EXTRALOCALI

 

 union

 

 select cez, classe, ricevitoria

 

 from ##TMP_LOCALI

 

)TUTTO

 

order by cez,classe, ricevitoria

 

 

 

DECLARE Set_Op_Ricev CURSOR FOR 

 

select cez, ricevitoria, classe

 

from ##TMP_TUTTO,

 

lsrpvo

 

where ricevitoria=lsrpvo_key_id_ricev

 

and lsrpvo_operatore=''

 

 

 

 

 

OPEN Set_Op_Ricev

 

 

 

FETCH NEXT FROM Set_Op_Ricev INTO @CEZ, @RICEV, @CLASSE

 

WHILE @@FETCH_STATUS = 0 

 

BEGIN

 

 --PRINT @CEZ

 

 --PRINT @RICEV

 

 --PRINT @CLASSE

 

 

 

 update lsrpvo

 

 set lsrpvo_operatore=op

 

 from

 

 (

 

  select top 1 op=lsrpvo_operatore

 

  from 

 

  (

 

   select min_n=min(n)

 

   from

 

   lsrcez_cc_operatori,

 

   (

 

    select lsrpvo_operatore, lsrpvo_classe, n=count(*)

 

    from lsrpvo

 

    where lsrpvo_operatore is not null

 

    and lsrpvo_operatore<>''

 

    AND lsrpvo_operatore NOT LIKE 'TL%'

 

    AND lsrpvo_classe=@CLASSE

 

    group by lsrpvo_operatore, lsrpvo_classe

 

  

 

   )d

 

   where lsrcez_cc_operatori_codice=lsrpvo_operatore

 

   and lsrcez_cc_operatori_classe=lsrpvo_classe--@CLASSE

 

   and lsrcez_cc_operatori_cez=@CEZ

 

   

 

  )a,

 

  (

 

   select lsrpvo_operatore, n

 

   from

 

   lsrcez_cc_operatori,

 

   (

 

    select lsrpvo_operatore, lsrpvo_classe, n=count(*)

 

    from lsrpvo

 

    where lsrpvo_operatore is not null

 

    and lsrpvo_operatore<>''

 

    AND lsrpvo_operatore NOT LIKE 'TL%'

 

    AND lsrpvo_classe=@CLASSE

 

    group by lsrpvo_operatore, lsrpvo_classe

 

  

 

   )d

 

   where lsrcez_cc_operatori_codice=lsrpvo_operatore

 

   and lsrcez_cc_operatori_classe=lsrpvo_classe--@CLASSE

 

   and lsrcez_cc_operatori_cez=@CEZ

 

  )b

 

  where a.min_n=b.n  

 

 

 

--  group by lsrcez_cc_operatori_codice

 

--  order by 2,1

 

 )tutto

 

 where lsrpvo_key_id_ricev=@RICEV

 

 

 

 FETCH NEXT FROM Set_Op_Ricev INTO @CEZ, @RICEV, @CLASSE

 

 

 

END

 

 

 

CLOSE Set_Op_Ricev

 

DEALLOCATE Set_Op_Ricev

 

 

 

 

 

--*****************************

 

--** TASK 3 - CALCOLO GIORNO DI CONTATTO

 

--*****************************

 

--Modifica del 26/04/2005

 

 

 

DECLARE Set_gg_Op CURSOR FOR 

 

select lsrpvo_key_id_ricev, lsrpvo_operatore, lsrpvo_classe

 

from lsrpvo,

 

(

 

 select *

 

 from ##TMP_TUTTO

 

)s

 

where lsrpvo_key_id_ricev=ricevitoria

 

and lsrpvo_gg_contatto=''

 

 

 

OPEN Set_gg_Op

 

 

 

FETCH NEXT FROM Set_gg_Op INTO @RICEV, @OP, @CLASSE

 

WHILE @@FETCH_STATUS = 0 

 

BEGIN

 

 

 

 

 

 

 

 update lsrpvo

 

 set lsrpvo_gg_contatto=gg

 

 from

 

 (

 

  select top 1 gg=lsrpvo_gg_contatto

 

  from 

 

  (

 

 

 

   select min_n=min(n)

 

   from

 

   (

 

    select lsrpvo_classe, lsrpvo_gg_contatto, n=count(*)

 

    from lsrpvo

 

    where lsrpvo_operatore =@OP

 

    AND lsrpvo_classe=@CLASSE

 

    AND lsrpvo_gg_contatto<>''

 

    AND lsrpvo_gg_contatto<>'6'

 

    group by lsrpvo_classe, lsrpvo_gg_contatto

 

  

 

   )d

 

   

 

   

 

  )a,

 

  (

 

   select lsrpvo_gg_contatto, n

 

   from

 

   (

 

    select lsrpvo_classe, lsrpvo_gg_contatto, n=count(*)

 

    from lsrpvo

 

    where lsrpvo_operatore =@OP

 

    AND lsrpvo_classe=@CLASSE

 

    AND lsrpvo_gg_contatto<>''

 

    AND lsrpvo_gg_contatto<>'6'

 

    group by lsrpvo_classe, lsrpvo_gg_contatto

 

  

 

   )d

 

  )b

 

  where a.min_n=b.n  

 

 

 

--  group by lsrcez_cc_operatori_codice

 

--  order by 2,1

 

 )tutto

 

 where lsrpvo_key_id_ricev=@RICEV

 

 

 

 FETCH NEXT FROM Set_gg_Op INTO @RICEV, @OP, @CLASSE

 

 

 

END

 

 

 

CLOSE Set_gg_Op

 

DEALLOCATE Set_gg_Op

 

 

 

Drop table ##TMP_FLUSSO

 

Drop table ##TMP_nRXCCez

 

DROP TABLE ##TMP_nRXLCez

 

DROP TABLE ##TMP_XL_1

 

DROP TABLE ##TMP_XL_2

 

drop table ##TMP_LOCALI

 

drop table ##TMP_EXTRALOCALI

 

DROP TABLE ##TMP_TUTTO

 

 

 

 

 

DECLARE @RC int 

 

Set @RC = 0

 

EXEC @RC = [ANACONDA].[dbo].[GEV_INSERT_LSRPVO_TSR_NON_LTM] 

 

 

 

if @RC <> 0 

 

begin 

 

 raiserror('ERRORE NEL CARICAMENTO OPERATORI NON LOTTO.',16,1)

 

 return 1000

 

end
GO
