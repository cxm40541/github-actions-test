/****** Object:  View [dbo].[prima_attivazione]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- creo tabella di appoggio con le due tabelle terminali e terminali_stor
--SELECT * INTO prova_angelo
--FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali  
--UNION
--SELECT *  
--FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali_stor 
--GO
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- creo la vista prima_attivazione sia per le attivazioni che per le disattivazioni
-- con le due tabelle terminali e terminali_stor
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
--drop view prima_attivazione
create view [dbo].[prima_attivazione] as 
( 
SELECT *,'terminali' as provenienza
FROM indicatoriqualita.dbo.terminali  
UNION
SELECT *,'storico' as provenienza
FROM indicatoriqualita.dbo.terminali_stor 
)
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- controllo tabelle per le attivazioni 
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

--select count (*) from prima_attivazione 

--SELECT distinct matr_terminale,data_prima,data_att FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali  
--SELECT matr_terminale,data_prima,data_att FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali  
--UNION
--SELECT distinct matr_terminale,data_prima,data_att FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali_stor 
--where data_dis > '19900101'  
--SELECT matr_terminale,data_prima,data_att FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali_stor 
--where data_dis > '19900101'  
--)

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- controllo tabelle per le disattivazioni 
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

--select count (*) from prima_attivazione 

--SELECT distinct matr_terminale,data_prima,data_dis FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali  
--where data_dis > '19900101'  
--SELECT matr_terminale,data_prima,data_att FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali  
--where data_dis > '19900101'  
--UNION
--SELECT distinct matr_terminale,data_prima,data_dis FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali_stor 
--where data_dis > '19900101'  
--SELECT matr_terminale,data_prima,data_dis FROM [sql-dbsan1\a].indicatoriqualita.dbo.terminali_stor 
--where data_dis > '19900101'  
--)

-- quali sono i record duplicati ????
--select matr_terminale,data_prima,data_att,count(*) from [sql-dbsan1\a].indicatoriqualita.dbo.terminali_stor 
--group by matr_terminale,data_prima,data_att
--having count(*) > 1
GO
