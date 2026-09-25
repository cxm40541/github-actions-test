/****** Object:  View [dbo].[LuogoDedicati]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LuogoDedicati] AS  select iddedicato,locali.nome as Luogo from dedicati,move,locali where move.dedicato=dedicati.iddedicato and locali.idlocale=move.locale UNION  select iddedicato,magazzini.nomemagazzino as Luogo from dedicati,magazzini where magazzini.idmagazzino=dedicati.idmagazzino and dedicati.iddedicato not IN (select move.dedicato from move where move.dedicato=dedicati.iddedicato)
GO
