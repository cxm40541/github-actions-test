/****** Object:  View [dbo].[vMag_LuoghiRicambi]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMag_LuoghiRicambi] AS SELECT nome, identificativo as myCodice, iddedicato as myID, 'A3' as Tipo, 'New Slot' as MyUbi from dedicati where ParTipologiaMonopoli = 1 and isvlt = 0 UNION select nome, identificativo as myCodice, iddedicato as myID, 'A4' as Tipo, 'VLT' as MyUbi from dedicati where ParTipologiaMonopoli = 1 and isvlt = -1 union select nome, identificativo as myCodice, iddedicato as myID, 'A5' as Tipo, 'Giochi' as MyUbi from dedicati where (ParTipologiaMonopoli = 0 or ParTipologiaMonopoli is null or ParTipologiaMonopoli <> 1) union select nome, matricola as myCodice, iddistributore as myID, 'A6' as Tipo, 'Distributore' as MyUbi from Distribut union select modello as nome, matricola as myCodice, idmobile as myID, 'A7' as Tipo, 'Mobile' as MyUbi from mobili union select nome, matricola as myCodice, idaccessorio as myID, 'A8' as Tipo, 'Accessorio' as MyUbi from Accessori union select nome, codice as myCodice, IdLocale as myID, 'LO' as Tipo, 'Locale' as MyUbi from Locali union select nome, Descrizione  as myCodice, IdLuogo as myID, 'SP' as Tipo, 'Luogo Speciale' as MyUbi from RicambiLuoghi union select nomeMagazzino, Codice  as myCodice, IdMagazzino as myID, 'MA' as Tipo, 'Magazzino' as MyUbi from Magazzini
GO
