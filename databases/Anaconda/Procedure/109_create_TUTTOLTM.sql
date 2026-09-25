/****** Object:  StoredProcedure [dbo].[TUTTOLTM]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[TUTTOLTM] as 




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
into #tmpterm
FROM condiviso.dbo.LST02A a
WHERE 
LTRIM(RTRIM(LST02A_RICEVITORIA)) <> ''
AND LST02A_DATA_DISINSTAL = '00000000'
--AND LST02A_RICEVITORIA = 'RM0223'
GROUP BY LST02A_RICEVITORIA
----------------------------------
--select count(*) from #tmpterm
------------------------------


--drop table #de_santis
select 	lsr01a_key_id_ricev as ric, lsr01a_decod_ricev as denominazione, 
	lsr01a_flag_esercizio as tipo_rice, lsr01a_indirizzo as indirizzo,
	lsr01a_comune_ricev as comune, lsr01a_prov_ricev as prov, 
	lsr01a_cap as cap, lsr01a_term_inst as term_inst,
	lcr01a_abi as abi_ltm, lcr01a_cab as cab_ltm,
	null AS ABI_CONI, null AS CAB_CONI, 
	lwk.abi as abi_lis, lwk.cab as cab_lis,
	0 as m320, 0 as m350, 0 as m370, 0 as m380
INTO #de_santis
from 	condiviso.dbo.lsr01a lsr
	,Lwk04a_Archivio_Attuale lwk
	,[Sql-dbsan1\a].condiviso.dbo.lcr01a lcr

where 	substring(lsr01a_key_id_ricev,2,1) <>'x'
and 	substring(lsr01a_key_id_ricev,2,1) <>'w'

and 	lsr01a_key_id_ricev *= cod_lottomatica
and 	lsr01a_key_id_ricev *= lcr01a_key_id_ricev

and 	lcr01a_data_inizio_val <= convert(char(8),getdate(),112)
and 	lcr01a_key_data_fine_val >= convert(char(8),getdate(),112)
and 	lcr01a_tipo_gioco ='01'

------------------------
--drop table #rid_coni
select lcr01a_key_id_ricev ,lcr01a_abi, lcr01a_cab
into #rid_coni
from [Sql-dbsan1\a].condiviso.dbo.lcr01a 
where lcr01a_data_inizio_val <= convert(char(8),getdate(),112)
and lcr01a_key_data_fine_val >= convert(char(8),getdate(),112)
and lcr01a_tipo_gioco ='11'
and lcr01a_key_id_ricev in 
	(select lto0aa_key_id_ricev
	from condiviso.dbo.lto0aa
	where lto0aa_data_inizio_val <= convert(char(8),getdate(),112)
	and lto0aa_key_data_fine_val >= convert(char(8),getdate(),112) 
	and lto0aa_key2_codice_banca <> '')
----------------------

update #de_santis
set 	m320 = isnull(b.m320,0),
	m350 = isnull(b.m350,0),
	m370 = isnull(b.m370,0),
	m380 = isnull(b.m380,0)
from #de_santis a, #tmpterm b
where a.ric = b.LST02A_RICEVITORIA
--

update #de_santis
set 	abi_coni = isnull(b.lcr01a_abi,0),
	cab_coni = isnull(b.lcr01a_cab,0)
from #de_santis a, #rid_coni b
where a.ric = b.lcr01a_key_id_ricev



update #de_santis
set 	abi_lis = isnull(abi_lis,0),
	cab_lis = isnull( cab_lis,0)



INSERT INTO TUTTO_LTM
select * from #de_santis
GO
