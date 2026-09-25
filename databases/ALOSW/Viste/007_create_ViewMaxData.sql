/****** Object:  View [dbo].[ViewMaxData]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewMaxData] AS select max(Incassi.Data) as mydata,Incassi.codiceoggetto  from incassi where Incassi.tipooggetto = 2  group by Incassi.codiceoggetto
GO
