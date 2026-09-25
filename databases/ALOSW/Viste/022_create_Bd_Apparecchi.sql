/****** Object:  View [dbo].[Bd_Apparecchi]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Bd_Apparecchi]
AS 
SELECT IdDedicato as Id,Nome,Identificativo as Code,prop as IDS,  'A3' as Tipo 
FROM BizDedicati where isVlt=0 and ParTipologiaMonopoli=1 and Dismissione=0 and DataFine is null
AND IdentificativoProv IN 
(SELECT CODE_ID_AWP_PROVV FROM
LOTTOPARCOAWP WHERE 
Denominazione_proprietario = 'BACK OFFICE COMMERCIALE'
AND TIPOLOGIA_AWP = 'AWP 2'
)
UNION
Select IdDedicato as Id,Nome,Identificativo as Code,prop as IDS,  'A4' as Tipo 
FROM BizDedicati where isVlt<>0 and ParTipologiaMonopoli=1 and Dismissione=0 and DataFine is null
UNION 
Select IdDedicato as Id,Nome,Matricola as Code,prop as IDS,  'A5' as Tipo 
FROM BizDedicati where  ParTipologiaMonopoli<>1 and Dismissione=0  and DataFine is null
UNION
select IdDistributore as Id,Nome,Matricola as Code, prop as IDS,'A6' as tipo 
FROM Bizdistribut where  DataFine is null
UNION
select IdMobile as Id,Modello as Nome,Matricola as Code, prop as IDS,'A7' as Tipo 
FROM Bizmobili where  DataFine is null
UNION 
Select IdAccessorio as Id,Nome,Matricola as Code, prop as IDS, 'A8' as Tipo 
FROM BizAccessori  where  DataFine is null;
GO
