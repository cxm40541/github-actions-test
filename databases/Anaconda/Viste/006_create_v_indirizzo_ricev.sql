/****** Object:  View [dbo].[v_indirizzo_ricev]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_indirizzo_ricev] as
SELECT lsrric_key_id_ricev, lsrric_comune_ricev, lsrric_prov_ricev, 
    lsrric_cap, lsrric_indirizzo,  lsrric_tel_ricevitoria, 
    MAX(lsrric_data_validita) AS lsrric_data_validita
FROM dbo.lsrric
WHERE lsrric_flag_validita = 'Y'
GROUP BY lsrric_key_id_ricev, lsrric_comune_ricev, 
    lsrric_prov_ricev, lsrric_cap, lsrric_indirizzo, 
    lsrric_tel_ricevitoria
GO
