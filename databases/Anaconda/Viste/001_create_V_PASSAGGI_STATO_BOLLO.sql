/****** Object:  View [dbo].[V_PASSAGGI_STATO_BOLLO]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE view [dbo].[V_PASSAGGI_STATO_BOLLO] AS
	SELECT ricev=lsrser_bollo_key_id_ricev, stato=lsrser_bollo_stato, data=lsrser_bollo_data_decor
	FROM lsrser_bollo A
	WHERE lsrser_bollo_flag_validita = 'y'
	AND lsrser_bollo_data_decor <= CONVERT (varchar(22), getdate(),112)
	AND lsrser_bollo_key_data_ins NOT IN
	        (SELECT lsrlet_key_data_ins
		 FROM lsrlet
		 WHERE lsrlet_cod_servizio = '05' 
		 AND lsrlet_key_id_ricev = A.lsrser_bollo_key_id_ricev 
		 AND (lsrlet_data_lettera = '19000101' OR lsrlet_note LIKE 'SEGNALAZ%'))
GO
