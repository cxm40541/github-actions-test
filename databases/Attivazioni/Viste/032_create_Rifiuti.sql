/****** Object:  View [dbo].[Rifiuti]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.Rifiuti    Script Date: 13/02/2002 15.45.19 ******/
create view [dbo].[Rifiuti] as
select id_piano as r_id_piano, id_soggetto r_id_soggetto,count(*) as Rifiuti 
from problematiche where substring(cod_problematica,1,2)='VA'
and CONVERT(char(10),fine,103)='01/01/1900' group by id_piano,id_soggetto
GO
