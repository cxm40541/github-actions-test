/****** Object:  View [dbo].[v_tit_decorr_prec_parziale]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_tit_decorr_prec_parziale]
AS
SELECT dbo.v_tit_decorr.key_id_ricev, 
    dbo.v_tit_decorr.cognome_corrente, 
    dbo.v_tit_decorr.nome_corrente, 
    case when (dbo.v_tit_prec.cognome_precedente is null or dbo.v_tit_prec.cognome_precedente='')
	then (select max (lsrpro_decor_dal) from lsrpro 
		where lsrpro_key_id_ricev = v_tit_decorr.key_id_ricev
		--Modifica del 07/01/2002 : eliminata la condizione sul tipo del provvedimento e aggiunta quella sul flag annull
		--and lsrpro_key_tipo_rec='C' 
		and (lsrpro_flag_annul <> '1' or lsrpro_flag_annul is null)
		and (lsrpro_flag_validita='Y' or lsrpro_flag_validita='V')
		--Modifica del 07/02/2002: aggiunta la condizione che il provvediemnto non deve essere di cambiamento stato del lotto
		and lsrpro_key_tipo_rec NOT IN( 'S','R','M','A')
		)
	else dbo.v_tit_decorr.data_validita
    end as data_validita,
    dbo.v_tit_decorr.data_inserimento, 
    dbo.v_tit_prec.cognome_precedente, 
    dbo.v_tit_prec.nome_precedente
FROM dbo.v_tit_decorr LEFT OUTER JOIN
    dbo.v_tit_prec ON 
    dbo.v_tit_decorr.key_id_ricev = dbo.v_tit_prec.lsrtit_key_id_ricev
GO
