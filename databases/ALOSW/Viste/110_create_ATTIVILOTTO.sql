/****** Object:  View [dbo].[ATTIVILOTTO]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ATTIVILOTTO] AS SELECT  idlocale,nome,ind_comune,codice From locali
GO
