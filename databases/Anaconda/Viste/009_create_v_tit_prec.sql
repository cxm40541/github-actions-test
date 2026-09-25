/****** Object:  View [dbo].[v_tit_prec]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_tit_prec]
AS
SELECT lsrtit_key_id_ricev, 
    lsrtit_cognome AS cognome_precedente, 
    lsrtit_nome AS nome_precedente
FROM dbo.lsrtit A
WHERE (lsrtit_flag_validita = 'Y') AND 
    (lsrtit_data_validita + lsrtit_ora_validita =
        (SELECT MAX(LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)
      FROM LSRTIT B
      WHERE A.LSRTIT_KEY_ID_RICEV = B.LSRTIT_KEY_ID_RICEV
            AND LSRTIT_FLAG_VALIDITA = 'Y' AND 
           (LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA) 
           <
               (SELECT MAX(LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)
             FROM LSRTIT C
             WHERE C.LSRTIT_KEY_ID_RICEV = A.LSRTIT_KEY_ID_RICEV
                   AND LSRTIT_TIPO = 'T' AND 
                  (LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA)
                   <=
                      (SELECT MAX((LSRTIT_DATA_VALIDITA + LSRTIT_ORA_VALIDITA))
                    FROM LSRTIT D
                    WHERE D.LSRTIT_KEY_ID_RICEV = A.LSRTIT_KEY_ID_RICEV
                          AND 
                         LSRTIT_DATA_VALIDITA <=
                             (SELECT CONVERT(char(8), 
                                getdate(), 112)) AND 
                         LSRTIT_FLAG_VALIDITA = 'Y') AND 
                  LSRTIT_FLAG_VALIDITA = 'Y' AND 
                 LSRTIT_TIPO_PROVV = 'I' )))
GO
