/****** Object:  View [dbo].[run_lotto_per_cem]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[run_lotto_per_cem] as

select
convert(char(8),getdate(),112) as data_conc_corr,
run,
cem,
sum(case when giorno = 'CONC_CORR' then num_giocate else 0 end) as num_giocate_conc_corr,
sum(case when giorno = 'CONC_CORR' then imp_giocate else 0 end) as imp_giocate_conc_corr,
sum(case when giorno = 'CONC_SETT_PREC' then num_giocate else 0 end) as num_giocate_conc_sett_prec,
sum(case when giorno = 'CONC_SETT_PREC' then imp_giocate else 0 end) as imp_giocate_conc_sett_prec
from
(

-- GIORNO CORRENTE --
(
select 
'CONC_CORR' as giorno,
data_raccolta,
run,
right(filler2,3) as cem,
sum(convert(int,contatore_gio) - convert(int,contatore_ann)) as num_giocate,
sum(convert(int,importo_giocate) - convert(int,importo_annullate)) as imp_giocate

from 
[2k-lh-gest-dc].gestione.dbo.tab_giocate_orarie_day

where 
data_raccolta = convert(char(8),getdate(),112)

group by 
data_raccolta,
run,
right(filler2,3)
) 


union all


(
select 
'CONC_CORR' as giorno,
data_raccolta,
run,
right(filler2,3) as cem,
sum(convert(int,contatore_gio) - convert(int,contatore_ann)) as num_giocate,
sum(convert(int,importo_giocate) - convert(int,importo_annullate)) as imp_giocate

from 
[2k-lh-gest-dc].gestione.dbo.tab_giocate_orarie_his

where 
data_raccolta = convert(char(8),getdate(),112)

group by 
data_raccolta,
run,
right(filler2,3)
) 


union all


-- GIORNO SETTIMANA PRECEDENTE --
(
select 
'CONC_SETT_PREC' as giorno,
data_raccolta,
run,
right(filler2,3) as cem,
sum(convert(int,contatore_gio) - convert(int,contatore_ann)) as num_giocate,
sum(convert(int,importo_giocate) - convert(int,importo_annullate)) as imp_giocate

from 
[2k-lh-gest-dc].gestione.dbo.tab_giocate_orarie_his

where 
data_raccolta = convert(char(8),getdate()-7,112)

group by 
data_raccolta,
run,
right(filler2,3)
) 

) a

group by
run,
cem
GO
