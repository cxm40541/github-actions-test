/****** Object:  View [dbo].[DB_Luoghi]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  View [dbo].[DB_Luoghi]
AS 

SELECT IdMagazzino as ID, NomeMagazzino as Nome, Codice, Indirizzo,Comune, Cap,Telefono,CodGestore, 'M' as Tipo
FROM Bizmagazzini
UNION
SELECT IdLocale  as ID,  Nome, Codice, Indirizzo,ind_comune as comune, ind_Cap as cap,Telefono,'' as CodGestore, 'L' as Tipo
FROM Bizlocali
UNION SELECT IdLuogo  as ID,  Nome, '' as Codice, Indirizzo,''  as comune, ''  as cap,''  as Telefono,Descrizione  as CodGestore, 'S' as Tipo
FROM RicambiLuoghi
GO
