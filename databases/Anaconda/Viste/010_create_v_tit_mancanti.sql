/****** Object:  View [dbo].[v_tit_mancanti]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_tit_mancanti]
AS
select  lsrtit_key_id_ricev AS key_id_ricev, 
    lsrtit_cognome AS cognome_corrente, 
    lsrtit_nome AS nome_corrente, 
    lsrtit_data_validita AS data_validita, 
    lsrtit_key_data_ins AS data_inserimento, ' ' as cognome_precedente,
    ' ' as nome_precedente
from lsrtit where lsrtit_key_id_ricev in(
	select lsrtit_key_id_ricev from lsrtit 
	where lsrtit_flag_validita='Y'
	group by lsrtit_key_id_ricev
	having count(lsrtit_key_id_ricev)=1
	
)
and lsrtit_tipo_provv in ('E', 'C')
GO
