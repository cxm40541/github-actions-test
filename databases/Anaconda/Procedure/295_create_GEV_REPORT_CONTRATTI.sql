/****** Object:  StoredProcedure [dbo].[GEV_REPORT_CONTRATTI]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        procedure [dbo].[GEV_REPORT_CONTRATTI] as 
 

DECLARE @OGGI  char(8),
 --@OGGI_INI  char(8),
 @NUM_CON VARCHAR(10),
 @NUM_ORD VARCHAR(10),
 @NUM_FID VARCHAR(10),
 @NUM_QST VARCHAR(10),
 @appodata char(8),
 @INDICE int
 
delete from Report_Contratti_GEV
 

SELECT @OGGI = CONVERT(CHAR,GETDATE(),112)
--SELECT @OGGI_INI = CONVERT(CHAR,GETDATE() - 7,112)
--select @OGGI='20040304'
 
SELECT LST02A_RICEVITORIA, 
(SELECT COUNT(LST02A_MATRICOLA)
FROM condiviso.dbo.LST02A
WHERE 
SUBSTRING(LST02A_MATRICOLA,1,1) IN ('1', '2')
AND LST02A_DATA_DISINSTAL = '00000000'
AND LST02A_RICEVITORIA = A.LST02A_RICEVITORIA
GROUP BY LST02A_RICEVITORIA) M320,
 
(SELECT COUNT(LST02A_MATRICOLA)
FROM condiviso.dbo.LST02A
WHERE 
SUBSTRING(LST02A_MATRICOLA,1,1) IN ('3')
AND LST02A_DATA_DISINSTAL = '00000000'
AND LST02A_RICEVITORIA = A.LST02A_RICEVITORIA
GROUP BY LST02A_RICEVITORIA) M350,
 
(SELECT COUNT(LST02A_MATRICOLA)
FROM condiviso.dbo.LST02A
WHERE 
SUBSTRING(LST02A_MATRICOLA,1,1) IN ('4')
AND LST02A_DATA_DISINSTAL = '00000000'
AND LST02A_RICEVITORIA = A.LST02A_RICEVITORIA
GROUP BY LST02A_RICEVITORIA) M370,
 
(SELECT COUNT(LST02A_MATRICOLA)
FROM condiviso.dbo.LST02A
WHERE 
SUBSTRING(LST02A_MATRICOLA,1,1) IN ('5')
AND LST02A_DATA_DISINSTAL = '00000000'
AND LST02A_RICEVITORIA = A.LST02A_RICEVITORIA
GROUP BY LST02A_RICEVITORIA) M380
into #temp1
FROM condiviso.dbo.LST02A a
WHERE 
LTRIM(RTRIM(LST02A_RICEVITORIA)) <> ''
AND LST02A_DATA_DISINSTAL = '00000000'
and LST02A_RICEVITORIA in 
 (select distinct(lsrcon_GeV_cod_lotto)
 from lsrcon_gev
 where lsrcon_gev_flag_anag='1'
 )
--AND LST02A_RICEVITORIA = 'RM0223'
GROUP BY LST02A_RICEVITORIA
 

--delete from Report_Contratti_GEV
 
select  lsr01a_key_id_ricev as ric, 
  DENOMINAZIONE=  LSR01A_DECOD_RICEV, 
  INDIRIZZO=  NORMA.INDIRIZZO, 
  COMUNE=   NORMA.COMUNE,
  PROV=  NORMA.PROV, 
  CAP=   NORMA.CAP,
  TELEFONO=  LEFT(REPLACE(LSR01A_TEL_RICEVITORIA,'/',''),12),
  0 as m320, 0 as m350, 0 as m370, 0 as m380, '00' as BCR
INTO #temp2
from  CONDIVISO.DBO.LSR01A, 
    (
     SELECT *
     FROM RMF_20040330_NORMALIZZATO
    )NORMA
 WHERE  LSR01A_KEY_ID_RICEV=codricev
 --and  substring(lsr01a_key_id_ricev,2,1) <>'x'
 and  substring(lsr01a_key_id_ricev,2,1) <>'w'
 and  substring(lsr01a_key_id_ricev,2,1) <>'p'
 and  substring(lsr01a_key_id_ricev,2,1) <>'u'
 and lsr01a_key_id_ricev in 
 (select lsrpvo_key_id_ricev
  from lsrpvo
  where lsrpvo_data_inizio=@OGGI
 )
 
------------------------
 
update #temp2
set  m320 = isnull(b.m320,0),
 m350 = isnull(b.m350,0),
 m370 = isnull(b.m370,0),
 m380 = isnull(b.m380,0)
from #temp2 a, #temp1 b
where a.ric = b.LST02A_RICEVITORIA
--
 
update #temp2
set  BCR = case 
  when (m370 = '1' and m320 = '0' and m350 = '0' and m380 = '0') then 'NO'
  when (m370 = '1' and m320 = '1') then 'NO'
  when ( (convert(int,m320) + convert(int,m350) + convert(int,m380)  )> convert(int,m370) ) then 'SI'
  else 'NO'
  end
 

--****************************
-- AGGIORNO LA TABELLA lsrpvo
-- CON I BCR
--****************************
UPDATE lsrpvo
SET lsrpvo_bcr=BCR
FROM lsrpvo,
(
 SELECT ric, BCR
 FROM #temp2
)T
where lsrpvo_key_id_ricev=ric
--****************************
 

INSERT INTO Report_Contratti_GEV
SELECT * FROM #temp2
 

-- CONTEGGIO DOCUMENTI ACQUISITI ALLA DATA
delete from Report_Documenti_Acquisiti_GEV
 

select @indice = 1
 

WHILE (@INDICE) < 8
BEGIN
 
 select @NUM_CON = '0'
 select @NUM_ORD = '0'
 select @NUM_FID = '0'
 select @NUM_QST = '0'
 
 SELECT @appodata = CONVERT(CHAR,GETDATE() - @indice,112)
 
 select @NUM_CON = count (*)
 from lsrcon_gev
 where lsrcon_GeV_flag_anag = '1'
  and lsrcon_GeV_key_data_ins = @appodata
 
 SELECT @NUM_ORD =isnull(sum (convert(int, lsrord_gev_numero_pacchi)), 0 )
 from lsrord_gev
 where lsrord_GeV_flag_anag = '1'
  and lsrord_GeV_key_data_ins =  @appodata
 
 SELECT @NUM_FID = count (*)
 from lsrfid_gev
 where lsrfid_GeV_flag_anag = '1'
  and lsrfid_GeV_key_data_ins = @appodata
 
 SELECT @NUM_QST = count (*)
 from lsrqst_gev
 where lsrqst_GeV_flag_anag = '1'
  and lsrqst_GeV_key_data_ins = @appodata
  
 insert into  Report_Documenti_Acquisiti_GEV
 values (@appodata,
  @NUM_CON,
  @NUM_ORD,
  @NUM_FID,
  @NUM_QST
  )
 select @indice = @indice + 1
END
 

drop table #temp1
drop table #temp2
GO
