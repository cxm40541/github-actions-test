/****** Object:  View [dbo].[RicambiTipoLuogoA]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RicambiTipoLuogoA] AS  SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, RicambiLuoghi.Nome AS LuogoA, 'Luogo Speciale' AS TipoLuogoA FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN RicambiLuoghi ON RicambiLuoghi.IdLuogo = RicambiMove.LuogoAId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoATipo = 'SP' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Locali.Nome AS LuogoA, 'Locale' AS TipoLuogoA FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Locali ON Locali.IdLocale = RicambiMove.LuogoAId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoATipo = 'LO' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Magazzini.NomeMagazzino AS LuogoA, 'Magazzino' AS TipoLuogoA FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Magazzini ON Magazzini.IdMagazzino = RicambiMove.LuogoAId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoATipo = 'MA' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Dedicati.Matricola AS LuogoA, 'Dedicato' AS TipoLuogoA FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Dedicati ON Dedicati.IdDedicato = RicambiMove.LuogoAId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoATipo IN ('A3', 'A4', 'A5') 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Distribut.Matricola AS LuogoA, 'Distributore' AS TipoLuogoA FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Distribut ON Distribut.IdDistributore = RicambiMove.LuogoAId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoATipo = 'A6' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Mobili.Matricola AS LuogoA, 'Mobile' AS TipoLuogoA FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Mobili ON Mobili.IdMobile = RicambiMove.LuogoAId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoATipo = 'A7' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Accessori.Matricola AS LuogoA, 'Accessorio' AS TipoLuogoA FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Accessori ON Accessori.IdAccessorio = RicambiMove.LuogoAId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoATipo = 'A8'
GO
