/****** Object:  View [dbo].[QRY_LOTTO_RICAMBI_GESTORI]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[QRY_LOTTO_RICAMBI_GESTORI] AS 
SELECT 
DENOMINAZIONE_GESTORE, CODICE_GESTORE,
COUNT(*) AS Parco,
(
SELECT 
COUNT(*) AS Etichettate
FROM LOTTOPARCOAWP a
WHERE 
CODE_ID_AWP_PROVV  IN (
SELECT DISTINCT IdentificativoProv
FROM 
RicambiGiacenza r INNER JOIN BizDedicati d ON r.fkluogo = d.IdDedicato
INNER JOIN LOTTOPARCOAWP la ON la.CODE_ID_AWP_PROVV = d.IdentificativoProv
WHERE TipoLuogo = 'A3'
AND not IdentificativoProv IS NULL  
) 
AND
Denominazione_proprietario = 'BACK OFFICE COMMERCIALE'
AND TIPOLOGIA_AWP = 'AWP 2'
AND A.CODICE_GESTORE = p.Codice_gestore
) AS Etichettate,

(
SELECT 
COUNT(*) AS NonEtichettate
FROM LOTTOPARCOAWP a
WHERE 
CODE_ID_AWP_PROVV  NOT IN (
SELECT DISTINCT IdentificativoProv
FROM 
RicambiGiacenza r INNER JOIN BizDedicati d ON r.fkluogo = d.IdDedicato
INNER JOIN LOTTOPARCOAWP la ON la.CODE_ID_AWP_PROVV = d.IdentificativoProv
WHERE TipoLuogo = 'A3'
AND not IdentificativoProv IS NULL  
) AND Denominazione_proprietario = 'BACK OFFICE COMMERCIALE'
AND TIPOLOGIA_AWP = 'AWP 2'
AND A.CODICE_GESTORE = p.Codice_gestore
) AS NonEtichettate

 
FROM lottoparcoawp P
WHERE 
Denominazione_proprietario = 'BACK OFFICE COMMERCIALE'
AND TIPOLOGIA_AWP = 'AWP 2'
GROUP BY DENOMINAZIONE_GESTORE, CODICE_GESTORE
GO
