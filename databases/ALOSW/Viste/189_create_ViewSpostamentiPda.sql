/****** Object:  View [dbo].[ViewSpostamentiPda]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewSpostamentiPda] AS  SELECT  SpostamentiPDA.IdSpostamento, pda.nome AS AppoNome, societa.ragionesociale ,pda.matricola , societa.idsocieta, pda.idpda as AppoId  FROM (pda INNER JOIN SpostamentiPDA ON SpostamentiPDA.idmobile = pda.idpda) INNER JOIN societa ON societa.idsocieta = SpostamentiPDA.idsocieta
GO
