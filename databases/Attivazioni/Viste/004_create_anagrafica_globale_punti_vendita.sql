/****** Object:  View [dbo].[anagrafica_globale_punti_vendita]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[anagrafica_globale_punti_vendita]   as

(

SELECT 

* 

 

FROM 

 

oPENQUERY(SINAI, 'SELECT * FROM t_address_from_extern a where receved_date in (select max(receved_date) from t_address_from_extern where system_key=a.system_key)') e

)
GO
