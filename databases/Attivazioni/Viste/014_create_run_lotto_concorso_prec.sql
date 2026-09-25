/****** Object:  View [dbo].[run_lotto_concorso_prec]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[run_lotto_concorso_prec] as
(
select 
data_raccolta,
run,

case 
when substring(max(ora_alle),1,2) = '00'
then '23:50'
else 
substring(max(ora_alle),1,2)+':'+substring(max(ora_alle),3,1)+'0' end as orario,

case 
when substring(max(ora_alle),1,2) = '00'
then '2350'
else 
substring(max(ora_alle),1,4) end as ora_alle,

substring(min(ora_dalle),1,4) as ora_dalle,

sum(convert(int,contatore_gio) - convert(int,contatore_ann)) as num_giocate,
sum(convert(int,importo_giocate) - convert(int,importo_annullate)) as imp_giocate

from [2k-lh-gest-dc].gestione.dbo.tab_giocate_orarie_his
where data_raccolta = 
(
case datename(weekday,convert(datetime,getdate(),112))
when 'lunedì' then convert(char(8),getdate()-3,112)
when 'martedì' then convert(char(8),getdate()-3,112)
else convert(char(8),getdate()-2,112)
end
)
group by 
data_raccolta,
run
)
GO
