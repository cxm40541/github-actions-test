/****** Object:  View [dbo].[gestore_rete]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[gestore_rete] as
(

SELECT
  dbo.COLLEGAMENTI_TERMINALI.NTER as NTER,
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
  then 'ALBACOM ISDN-B'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP' )
  then 'TELECOM EXECUTIVE ISDN-B'

  when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT' )
then 'TELECOM EXECUTIVE RTG'

when (dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K1%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K2%'
or dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'K4%' ) and 
(dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL')
then 'TELECOM EXECUTIVE ADSL'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T1%' and 
dbo.collegamenti_terminali.tipo_t like '%IL'
   then 'ALBACOM SPERIMENTAZIONE ADSL'

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
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'
   then 'TELECOM GARA 2005 ISDN-B' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'
   then 'TELECOM GARA 2005 SATELLITE' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'T3%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG' or 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT'  
   then 'TELECOM GARA 2005 RTG' 

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'J1%' 
    then 'TELECOM SPERIMENTAZIONE ADSL' 

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'  
    then 'TELECOM ADSL GIOCHI SPORTIVI'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'  
    then 'TELECOM ISDN GIOCHI SPORTIVI'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS GIOCHI SPORTIVI'

 when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'FW%' 
    then 'FASTWEB ADSL GIOCHI SPORTIVI'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'  
    then 'TELECOM ADSL BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'  
    then 'TELECOM ISDN  BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'  
    then 'TELECOM GPRS BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'  
    then 'TELECOM SATELLITE BETTING'

  when dbo.COLLEGAMENTI_TERMINALI.lotto_telecom like 'TSBE%' and 
dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%HL'  
    then 'TELECOM HDSL BETTING'
 else  'ALTRO'
 end  as GESTORE_RETE
,
  case

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%HL'
then 'HDSL'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%ST'
then 'SATELLITE'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%GP'
then 'GPRS'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IP'
then 'ISDN-B'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IS'
then 'ISDN-D'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IL'
then 'ADSL'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%DA'
then 'CDA'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%DN'
then 'CDN'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IT' OR dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%IG'
then 'RTG-IP'

when dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%TG' OR dbo.COLLEGAMENTI_TERMINALI.TIPO_T like '%RT'
then 'RTG-SDLC'

 else  'ALTRO'

end as TIPO_CIRCUITO

FROM
  dbo.COLLEGAMENTI_TERMINALI
)
GO
