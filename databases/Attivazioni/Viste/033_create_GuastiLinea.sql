/****** Object:  View [dbo].[GuastiLinea]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.GuastiLinea    Script Date: 13/02/2002 15.45.14 ******/
create view [dbo].[GuastiLinea] as
select id_piano as g_id_piano,id_soggetto as G_id_soggetto,count(*) as GuastiLinea 
from problematiche where substring(cod_problematica,1,2)='DF' 
and CONVERT(char(10),fine,103)='01/01/1900' group by id_piano, id_soggetto
GO
