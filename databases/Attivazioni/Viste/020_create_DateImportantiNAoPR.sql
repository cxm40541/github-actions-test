/****** Object:  View [dbo].[DateImportantiNAoPR]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.DateImportantiNAoPR    Script Date: 13/02/2002 15.45.14 ******/
create view [dbo].[DateImportantiNAoPR] as
select a.id_soggetto, a.id_piano, convert(char(10),a.fine,103) as dataComm,
convert(char(10),b.fine,103) as dataDed, convert(char(10),c.fine,103) as dataAdd,
convert(char(10),d.fine,103) as dataRil, convert(char(10),e.fine,103) as dataStm
from stato_avanzamento a, stato_avanzamento b, stato_avanzamento c,
stato_avanzamento d, stato_avanzamento e
where a.id_soggetto=b.id_soggetto
and a.id_piano=b.id_piano
and a.id_soggetto=c.id_soggetto
and a.id_piano=c.id_piano
and a.id_soggetto=d.id_soggetto
and a.id_piano=d.id_piano
and a.id_soggetto=e.id_soggetto
and a.id_piano=e.id_piano
and a.id_attivita='B01' 
and a.cod_avanzamento='B0003' --and convert(char(10),a.fine,103)='01/01/1900'
and b.id_attivita='B01' 
and b.cod_avanzamento='B0004' --and convert(char(10),b.fine,103)='01/01/1900'
and c.id_attivita='E01' 
and c.cod_avanzamento='E0001' --and convert(char(10),c.fine,103)='01/01/1900'
and d.id_attivita='D01' 
and d.cod_avanzamento='D0002' --and convert(char(10),d.fine,103)='01/01/1900'
and e.id_attivita='C01' 
and e.cod_avanzamento='C0002' --and convert(char(10),e.fine,103)='01/01/1900'
GO
