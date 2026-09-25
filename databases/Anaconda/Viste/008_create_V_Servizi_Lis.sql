/****** Object:  View [dbo].[V_Servizi_Lis]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  View dbo.V_Servizi_Lis    Script Date: 16/07/2003 11:23:28 ******/
CREATE VIEW [dbo].[V_Servizi_Lis] AS
SELECT 	lsrser_lis_dec_categoria + lsrser_lis_dec_servizio + lsrser_lis_dec_attivita AS Servizio_lis,  
	lsrser_lis_dec_nome AS Decodifica
from lsrser_lis_dec A 
WHERE lsrser_lis_dec_servizio <>''
AND NOT EXISTS ( 
	SELECT * FROM lsrser_lis_dec 
	WHERE A.lsrser_lis_dec_categoria = lsrser_lis_dec_categoria
		AND A.lsrser_lis_dec_servizio = lsrser_lis_dec_servizio
		AND lsrser_lis_dec_attivita <> ''
	)
UNION
SELECT 	lsrser_lis_dec_categoria + lsrser_lis_dec_servizio + lsrser_lis_dec_attivita, 
	lsrser_lis_dec_nome FROM 
lsrser_lis_dec 
WHERE lsrser_lis_dec_categoria <> ''
	AND lsrser_lis_dec_servizio <> ''
	AND lsrser_lis_dec_attivita <> ''
GO
