/****** Object:  View [dbo].[ApparecchiInMagazzino7]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiInMagazzino7] AS SELECT 
'Scheda' AS Tipo,'SCH' AS TipoOggettoDesc, 1 As TipoOggetto,idscheda AS CodiceOggetto ,nome as macchina, prop AS Proprieta,'' as identificativo,'' as nullaosta,agente AS Associato,matricola,idmagazzino as Magazzino, 3 AS Ordinamento, Attivo AS 'NonAttivo', MarchioCE AS AltroCodice, '' AS IdentificativoProv  
From Schede 
WHERE datafine is null AND idscheda not in (select scheda from move where scheda=schede.idscheda) 
Union 
SELECT  'New Slot' AS Tipo,'NSL' AS TipoOggettoDesc, 2 as TipoOggetto, iddedicato AS CodiceOggetto,nome as macchina,prop AS Proprieta,dedicati.identificativo,dedicati.nullaosta,agente AS Associato,matricola, idmagazzino as Magazzino, 0 AS Ordinamento,NonAttivo, MarchioCE AS AltroCodice, IdentificativoProv AS IdentificativoProv 
From dedicati 
WHERE datafine is null AND iddedicato not in (select dedicato from move where dedicato=dedicati.iddedicato)  and Partipologiamonopoli = 1 and IsVLT = 0 
Union 
SELECT  'Vlt' AS Tipo,'VLT'      AS TipoOggettoDesc, 2 as TipoOggetto, iddedicato AS CodiceOggetto,nome as macchina,prop AS Proprieta,dedicati.identificativo,dedicati.nullaosta,agente AS Associato,matricola, idmagazzino as Magazzino, 0 AS Ordinamento,NonAttivo, MarchioCE AS AltroCodice, '' AS IdentificativoProv 
From dedicati 
WHERE datafine is null AND iddedicato not in (select dedicato from move where dedicato=dedicati.iddedicato)  and Partipologiamonopoli = 1 and IsVLT <> 0 
Union 
SELECT  'Gioco' AS Tipo,'GIO' AS TipoOggettoDesc, 2 as TipoOggetto, iddedicato AS CodiceOggetto,nome as macchina,prop AS Proprieta,dedicati.identificativo,dedicati.nullaosta,agente AS Associato,matricola, idmagazzino as Magazzino, 1 AS Ordinamento,NonAttivo, MarchioCE AS AltroCodice, '' AS IdentificativoProv 
From 
dedicati 
WHERE datafine is null AND iddedicato not in (select dedicato from move where dedicato=dedicati.iddedicato)  and (Partipologiamonopoli <> 1 or partipologiamonopoli is null) 
Union 
SELECT  'Distributore' AS Tipo,'DIS' AS TipoOggettoDesc, 15 AS TipoOggetto,iddistributore AS CodiceOggetto,nome as macchina,prop AS Proprieta,'' as identificativo,'' as nullaosta,agente AS Associato,matricola,idmagazzino as Magazzino, 4 AS Ordinamento,Attivo AS 'NonAttivo' , MarchioCE AS AltroCodice, '' AS IdentificativoProv 
From 
distribut 
WHERE datafine is null AND iddistributore not in (select distributore from move where distributore=distribut.iddistributore) 
Union 
SELECT  'Mobile' AS Tipo,'MOB' AS TipoOggettoDesc, 0 AS TipoOggetto,idmobile AS CodiceOggetto,modello as macchina,prop AS Proprieta, mobili.identificativo,mobili.nullaosta,agente AS Associato,matricola,idmagazzino as Magazzino, 2 AS Ordinamento,Attivo AS 'NonAttivo' , MarchioCE AS AltroCodice, '' AS IdentificativoProv 
From mobili 
WHERE datafine is null AND idmobile not in (select mobile from move where mobile=mobili.idmobile) 
Union 
SELECT  'Accessorio' AS Tipo,'ACC' AS TipoOggettoDesc, 3 AS TipoOggetto,IdAccessorio AS CodiceOggetto,Nome as macchina,prop AS Proprieta,'' as identificativo,'' as nullaosta,'' AS Associato,matricola,idmagazzino as Magazzino,5 AS Ordinamento,Attivo AS 'NonAttivo' , '' AS AltroCodice, '' AS IdentificativoProv 
From Accessori 
WHERE datafine is null AND IdAccessorio not in (select Accessorio from move where accessorio=accessori.idaccessorio)
GO
