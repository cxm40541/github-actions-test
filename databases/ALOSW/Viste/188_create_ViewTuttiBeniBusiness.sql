/****** Object:  View [dbo].[ViewTuttiBeniBusiness]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTuttiBeniBusiness] AS select iddedicato as codiceoggetto, 1 as tipooggetto from dedicati where partipologiamonopoli=1 Union select iddedicato as codiceoggetto, 4 as tipooggetto from dedicati where (partipologiamonopoli<> 1 or partipologiamonopoli is null) Union select iddistributore as codiceoggetto, 15 as tipooggetto from distribut Union select idmobile as codiceoggetto, 0 as tipooggetto from mobili Union select idaccessorio as codiceoggetto, 3 as tipooggetto from accessori Union select idaltrices as codiceoggetto, 11 as tipooggetto from altricespiti
GO
