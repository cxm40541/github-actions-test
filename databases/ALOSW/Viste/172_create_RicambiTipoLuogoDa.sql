/****** Object:  View [dbo].[RicambiTipoLuogoDa]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RicambiTipoLuogoDa] AS  SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, RicambiLuoghi.Nome AS LuogoDa, 'Luogo Speciale' AS TipoLuogoDa FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN RicambiLuoghi ON RicambiLuoghi.IdLuogo = RicambiMove.LuogoDaId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoDaTipo = 'SP' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Locali.Nome AS LuogoDa, 'Locale' AS TipoLuogoDa FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Locali ON Locali.IdLocale = RicambiMove.LuogoDaId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoDaTipo = 'LO' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Magazzini.NomeMagazzino AS LuogoDa, 'Magazzino' AS TipoLuogoDa FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Magazzini ON Magazzini.IdMagazzino = RicambiMove.LuogoDaId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoDaTipo = 'MA' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Dedicati.Matricola AS LuogoDa, 'Dedicato' AS TipoLuogoDa FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Dedicati ON Dedicati.IdDedicato = RicambiMove.LuogoDaId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoDaTipo IN ('A3', 'A4', 'A5') 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Distribut.Matricola AS LuogoDa, 'Distributore' AS TipoLuogoDa FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Distribut ON Distribut.IdDistributore = RicambiMove.LuogoDaId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoDaTipo = 'A6' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Mobili.Matricola AS LuogoDa, 'Mobile' AS TipoLuogoDa FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Mobili ON Mobili.IdMobile = RicambiMove.LuogoDaId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoDaTipo = 'A7' 
 UNION 
 SELECT RicambiMove.IdMovimento, RicambiMove.fkDDT AS IdDDT, RicambiMove.Quantita, RicambiMove.fkUser, usrUser.UserNameClear AS Utente, ParCausaleMoveRicambi.Descrizione AS TipoMovimento, RicambiMove.DataMovimento, RicambiMove.bGeneraDDT, RicambiMove.Note, Accessori.Matricola AS LuogoDa, 'Accessorio' AS TipoLuogoDa FROM (((RicambiMove 
 LEFT JOIN Ricambi ON Ricambi.IdRicambio = RicambiMove.fkRicambio) 
 LEFT JOIN Accessori ON Accessori.IdAccessorio = RicambiMove.LuogoDaId) 
 LEFT JOIN usrUser ON usrUser.IdUser = RicambiMove.fkUser) 
 LEFT JOIN ParCausaleMoveRicambi ON ParCausaleMoveRicambi.IdPar = RicambiMove.IdParCausale 
 WHERE RicambiMove.LuogoDaTipo = 'A8'
GO
