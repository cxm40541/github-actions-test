/****** Object:  View [dbo].[BD_Ricambi]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BD_Ricambi]
AS 
SELECT Ricambi.*, RicambiLuoghi.Nome AS Luogo, 'Luogo Speciale' AS TipoLuogoInstallazioneA 
FROM Ricambi LEFT JOIN RicambiLuoghi ON RicambiLuoghi.IdLuogo = Ricambi.IdLuogo 
WHERE Ricambi.TipoLuogoInstallazione = 'SP' 
 UNION 
SELECT Ricambi.*, bizLocali.Nome AS Luogo, 'Locale' AS TipoLuogoInstallazioneA 
FROM Ricambi LEFT JOIN bizLocali ON bizLocali.IdLocale = Ricambi.IdLuogo 
 WHERE Ricambi.TipoLuogoInstallazione = 'LO' 
 UNION 
SELECT Ricambi.*, BizMagazzini.NomeMagazzino As Luogo, 'Magazzino' AS TipoLuogoInstallazioneA FROM 
 Ricambi LEFT JOIN BizMagazzini ON BizMagazzini.IdMagazzino = Ricambi.IdLuogo
 WHERE Ricambi.TipoLuogoInstallazione = 'MA' 
 UNION 
SELECT Ricambi.*, BizDedicati.Matricola As Luogo, 'Dedicato' AS TipoLuogoInstallazioneA FROM 
 Ricambi LEFT JOIN BizDedicati ON BizDedicati.IdDedicato = Ricambi.IdApparecchio 
 WHERE Ricambi.TipoLuogoInstallazione IN ('A3', 'A4', 'A5') 
 UNION 
SELECT Ricambi.*, BizDistribut.Matricola As Luogo, 'Distributore' AS TipoLuogoInstallazioneA FROM 
 Ricambi LEFT JOIN BizDistribut ON BizDistribut.IdDistributore = Ricambi.IdApparecchio 
 WHERE Ricambi.TipoLuogoInstallazione = 'A6' 
 UNION 
SELECT Ricambi.*, BizMobili.Matricola As Luogo, 'Mobile' AS TipoLuogoInstallazioneA FROM 
 Ricambi  LEFT JOIN BizMobili ON BizMobili.IdMobile = Ricambi.IdApparecchio 
 WHERE Ricambi.TipoLuogoInstallazione = 'A7' 
 UNION SELECT Ricambi.*, BizAccessori.Matricola As Luogo, 'Accessorio' AS TipoLuogoInstallazioneA FROM 
 Ricambi  LEFT JOIN BizAccessori ON BizAccessori.IdAccessorio = Ricambi.IdApparecchio 
 WHERE Ricambi.TipoLuogoInstallazione = 'A8';
GO
