/****** Object:  View [dbo].[v_lsrser_atti_StipCessa]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_lsrser_atti_StipCessa]
AS
select Sti2.Ricev  
,Sti2.Stipula  as DataStipu
,convert(char(8),replace (min(isnull(DCessa, '99999999')),'99999999','00000000')) as DataCessa
 from 
 (
 select LSRSER_ATTI_KEY_ID_RICEV as Ricev
 ,LSRSER_ATTI_DATA_DECOR as Stipula
 from 
 LSRSER_ATTI 
 where
 lsrser_atti_key_categoria + lsrser_atti_key_servizio + lsrser_atti_key_attivita  = '050101'
 and LSRSER_ATTI_FLAG_VALIDITA = 'Y'
 and LSRSER_ATTI_STATO = '1'
 ) Sti2
left outer join 
 (
 select Sti.Ricev  
 ,Stipula  
 ,isnull(Cessazione, '99999999') as DCessa
  from 
  --date stipula
  (
   select LSRSER_ATTI_KEY_ID_RICEV as Ricev
   ,LSRSER_ATTI_DATA_DECOR as Stipula
   from 
   LSRSER_ATTI 
   where
   lsrser_atti_key_categoria + lsrser_atti_key_servizio + lsrser_atti_key_attivita  = '050101'
   and LSRSER_ATTI_FLAG_VALIDITA = 'Y'
   and LSRSER_ATTI_STATO = '1'
  ) as Sti
 
  left outer join
  --date cessazione
  (
   select LSRSER_ATTI_KEY_ID_RICEV as Ricev
   ,LSRSER_ATTI_DATA_DECOR as Cessazione
   from 
   LSRSER_ATTI 
   where
   lsrser_atti_key_categoria + lsrser_atti_key_servizio + lsrser_atti_key_attivita  = '050101'
   and LSRSER_ATTI_FLAG_VALIDITA = 'Y'
   and LSRSER_ATTI_STATO = '2'
  ) as Cess
 
  on Sti.Ricev = Cess.Ricev
 where stipula <=isnull(Cessazione,'99999999')
 ) StiCes
on Sti2.Ricev= StiCes.Ricev
and Sti2.Stipula=StiCes.Stipula
group by Sti2.Ricev, Sti2.Stipula
GO
