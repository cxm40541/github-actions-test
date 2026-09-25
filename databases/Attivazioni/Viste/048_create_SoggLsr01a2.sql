/****** Object:  View [dbo].[SoggLsr01a2]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.SoggLsr01a2    Script Date: 13/02/2002 15.45.19 ******/
CREATE VIEW [dbo].[SoggLsr01a2]
AS
SELECT LTRIM(RTRIM(a.ter)) AS ter, a.id_soggetto, a.id_piano, 
    a.Data, a.lsr01a_cod_amm, a.lsr01a_cognome, 
    a.lsr01a_nome, a.lsr01a_stato, a.lsr01a_flag_esercizio, 
    LTRIM(RTRIM(g.NTER)) AS nter
FROM dbo.SoggLsr01a a LEFT OUTER JOIN
    dbo.COLLEGAMENTI_TERMINALI g ON 
    LTRIM (RTRIM (a.ter)) = LTRIM (RTRIM (g.NTER))
GO
