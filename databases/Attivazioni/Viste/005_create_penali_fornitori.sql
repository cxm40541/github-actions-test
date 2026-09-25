/****** Object:  View [dbo].[penali_fornitori]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[penali_fornitori]
as
SELECT
distinct(a.lgu01a_key_progr+a.lgu01a_key_societa)as codice_guasto,
b.lgu04a_desc_societa as società,
a.lgu01a_imp_penale_euro as importo_penale
FROM
  [sql-dbsan2\b].Guasti.dbo.lgu01a a,
  [sql-dbsan2\b].Guasti.dbo.lgu04a b,
  [sql-dbsan2\b].Guasti.dbo.lgu02a c
WHERE
  ( c.lgu02a_key_progr=a.lgu01a_key_progr and c.lgu02a_key_societa=a.lgu01a_key_societa  )
  AND  ( b.lgu04a_tipo_societa=a.lgu01a_key_societa  )
  AND  ( c.lgu02a_key_tipo_data='C')
  AND  (
  substring(c.lgu02a_key_data,1,4)   =  '2008'
  AND  a.lgu01a_imp_penale_euro  >  0
  )
GO
