/****** Object:  View [dbo].[GestioneLocali]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GestioneLocali] AS SELECT locali.idlocale AS CodLoc, societa.idsocieta as CodSoc ,societa.ragionesociale from locali left join societa on societa.idsocieta=locali.prop
GO
