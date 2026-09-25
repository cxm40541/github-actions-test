/****** Object:  View [dbo].[circuiti_per_gestore]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[circuiti_per_gestore]
as
(
SELECT
  case
  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'A%'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP' 
  then 'ALBACOM GPRS'
when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL')
then 'TELECOM EXECUTIVE ADSL'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP' )
  then 'TELECOM EXECUTIVE GPRS'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T1%' and 
dbo.collegamenti_terminali.tipo_t like '%IL'
   then 'ALBACOM ADSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T2%' and
dbo.collegamenti_terminali.tipo_t like '%IL'
   then 'TOTO2000 ADSL' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'
   then 'TELECOM GARA 2005 ADSL' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS GARA 2005'


  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'
   then 'TELECOM GARA 2005 SATELLITE' 

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'J1%' 
    then 'TELECOM SPERIMENTAZIONE ADSL' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'  
    then 'TELECOM ADSL GIOCHI SPORTIVI'


  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS GIOCHI SPORTIVI'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW%' 
    then 'FASTWEB ADSL GIOCHI SPORTIVI'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'  
    then 'TELECOM ADSL BETTING'


  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'  
    then 'TELECOM SATELLITE BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%HL'  
    then 'TELECOM HDSL BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1GP'
  then 'RETE EXECUTIVE GPRS'
when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL' 
  then 'FASTWEB RETE 2009 ADSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%SH' 
  then 'FASTWEB RETE 2009 SHDSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL' 
  then 'TELECOM RETE 2009 ADSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%SH' 
  then 'TELECOM RETE 2009 SHDSL'
else 
'ALTRO ADSL'
 end  as gestore_rete,
  count (distinct(dbo.COLLEGAMENTI_TERMINALI.TD_ADSL)) as circuiti
FROM
  dbo.COLLEGAMENTI_TERMINALI
WHERE
----------------------------------
----------------------------------
dbo.COLLEGAMENTI_TERMINALI.TD_ADSL <> ' '
and  
( dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  )
or 
( dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'  )
or 
( dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%HL'  )
or 
( dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'  )

GROUP BY
----

  case
  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'A%'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP' 
  then 'ALBACOM GPRS'
when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL')
then 'TELECOM EXECUTIVE ADSL'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP' )
  then 'TELECOM EXECUTIVE GPRS'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T1%' and 
dbo.collegamenti_terminali.tipo_t like '%IL'
   then 'ALBACOM ADSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T2%' and
dbo.collegamenti_terminali.tipo_t like '%IL'
   then 'TOTO2000 ADSL' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'
   then 'TELECOM GARA 2005 ADSL' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS GARA 2005'


  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'
   then 'TELECOM GARA 2005 SATELLITE' 

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'J1%' 
    then 'TELECOM SPERIMENTAZIONE ADSL' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'  
    then 'TELECOM ADSL GIOCHI SPORTIVI'


  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS GIOCHI SPORTIVI'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW%' 
    then 'FASTWEB ADSL GIOCHI SPORTIVI'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'  
    then 'TELECOM ADSL BETTING'


  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'  
    then 'TELECOM SATELLITE BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%HL'  
    then 'TELECOM HDSL BETTING'
when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1GP'
  then 'RETE EXECUTIVE GPRS'
when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL' 
  then 'FASTWEB RETE 2009 ADSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%SH' 
  then 'FASTWEB RETE 2009 SHDSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL' 
  then 'TELECOM RETE 2009 ADSL'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%SH' 
  then 'TELECOM RETE 2009 SHDSL'
else 
'ALTRO ADSL'
 end 
union
SELECT
  case
  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K3IP' or
            dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K5IP' ) and
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' )
  then 'TELECOM GARA 2002 ISDN-B' 

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K3IP' or
            dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K5IP' ) and
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT' )
  then 'TELECOM GARA 2002 RTG' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'A%'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' 
  then 'ALBACOM ISDN-B'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'A%' and 
dbo.collegamenti_terminali.tipo_t like '%IG'
   then 'ALBACOM RTG'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) 
and (dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' )
  then 'TELECOM EXECUTIVE ISDN-B'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T1%')
and (dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' )
  then 'TELECOM EXECUTIVE 2 ISDN-B'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT' )
then 'TELECOM EXECUTIVE RTG'
  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'
   then 'TELECOM GARA 2005 ISDN-B' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT'  
   then 'TELECOM GARA 2005 RTG' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'  
    then 'TELECOM ISDN GIOCHI SPORTIVI'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'  
    then 'TELECOM ISDN  BETTING'
  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' 
  then 'FASTWEB RETE 2009 ISDN'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' 
  then 'TELECOM RETE 2009 ISDN'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' 
  then 'FASTWEB RETE 2009 RTG'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' 
  then 'TELECOM RETE 2009 RTG'

else 
'ALTRO ISDN'
 end 
 as gestore_rete,
  count (distinct(dbo.COLLEGAMENTI_TERMINALI.TD)) as circuiti
FROM
  dbo.COLLEGAMENTI_TERMINALI
WHERE
--------------------------------
--------------------------------
dbo.COLLEGAMENTI_TERMINALI.TD <> ' ' 
and
( dbo.COLLEGAMENTI_TERMINALI.TIPO_T  like '%IT'  )
or 
( dbo.COLLEGAMENTI_TERMINALI.TIPO_T  like '%IG'  )
or 
( dbo.COLLEGAMENTI_TERMINALI.TIPO_T  like '%IP'  )
GROUP BY
  case
  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K3IP' or
            dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K5IP' ) and
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' )
  then 'TELECOM GARA 2002 ISDN-B' 

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K3IP' or
            dbo.COLLEGAMENTI_TERMINALI.lotto_telecom = 'K5IP' ) and
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT' )
  then 'TELECOM GARA 2002 RTG' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'A%'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' 
  then 'ALBACOM ISDN-B'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'A%' and 
dbo.collegamenti_terminali.tipo_t like '%IG'
   then 'ALBACOM RTG'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) 
and (dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' )
  then 'TELECOM EXECUTIVE ISDN-B'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T1%')
and (dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' )
  then 'TELECOM EXECUTIVE 2 ISDN-B'


  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT' )
then 'TELECOM EXECUTIVE RTG'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'
   then 'TELECOM GARA 2005 ISDN-B' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT'  
   then 'TELECOM GARA 2005 RTG' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'  
    then 'TELECOM ISDN GIOCHI SPORTIVI'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'  
    then 'TELECOM ISDN  BETTING'
  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' 
  then 'FASTWEB RETE 2009 ISDN'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' 
  then 'TELECOM RETE 2009 ISDN'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' 
  then 'FASTWEB RETE 2009 RTG'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TI09'
and dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' 
  then 'TELECOM RETE 2009 RTG'

else 
'ALTRO ISDN'
 end 
union
select 'ISDN DI BACKUP' as gestore,
count(distinct(td)) as circuiti
FROM dbo.COLLEGAMENTI_TERMINALI
where substring(td_adsl,1,2) <> '  ' 
and substring(td,1,2) <> '  ' 
)
GO
