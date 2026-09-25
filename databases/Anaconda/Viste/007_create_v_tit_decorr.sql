/****** Object:  View [dbo].[v_tit_decorr]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_tit_decorr]
AS
SELECT lsrtit_key_id_ricev AS key_id_ricev, 
    lsrtit_cognome AS cognome_corrente, 
    lsrtit_nome AS nome_corrente, 
    lsrtit_data_validita AS data_validita, 
    lsrtit_key_data_ins AS data_inserimento
FROM dbo.lsrtit a
WHERE --(lsrtit_tipo_provv = 'I' ) AND
 (lsrtit_flag_validita = 'Y') AND 
    (lsrtit_data_validita <=
        (SELECT CONVERT(char(8), getdate(), 112))) AND 
    (lsrtit_data_validita =
        (SELECT MAX(lsrtit_data_validita)
      FROM dbo.lsrtit b
      WHERE (lsrtit_tipo_provv = 'I' OR lsrtit_tipo_provv='C') AND 
           lsrtit_flag_validita = 'Y' AND 
           lsrtit_data_validita <=
               (SELECT CONVERT(char(8), getdate(), 112)) AND 
           a.lsrtit_key_id_ricev = b.lsrtit_key_id_ricev))
GO
