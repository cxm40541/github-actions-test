/****** Object:  View [dbo].[v_lsrlet_totali_dest]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_lsrlet_totali_dest] AS
	SELECT DISTINCT lsrlet_destinatario , lsrlet_cod_destinatario, lsrlet_cod_servizio, count(lsrlet_key_id_ricev) as nro_movimentazioni, "MOVIMENTI" AS tipo_let
	FROM lsrlet_appoggio 
	WHERE lsrlet_causale NOT LIKE 'SEGNALAZ%' OR lsrlet_causale IS NULL
	GROUP BY lsrlet_destinatario , lsrlet_cod_destinatario, lsrlet_cod_servizio
	UNION
	SELECT DISTINCT lsrlet_destinatario , lsrlet_cod_destinatario, lsrlet_cod_servizio, count(lsrlet_key_id_ricev) as nro_movimentazioni, "SEGNALAZIONI" AS tipo_let
	FROM lsrlet_appoggio 
	WHERE lsrlet_causale LIKE 'SEGNALAZ%'
	GROUP BY lsrlet_destinatario , lsrlet_cod_destinatario, lsrlet_cod_servizio
GO
