/****** Object:  StoredProcedure [dbo].[ANA_REP_STATO_RICEVITORIA]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[ANA_REP_STATO_RICEVITORIA] 
@STATO varchar(1)
AS 
BEGIN
select lsrser_lotto_key_id_ricev, lsrser_lotto_tipo_provv, lsrtit_cognome, lsrtit_nome,
lsrric_decod_ricev as denominazione,lsrric_comune_ricev,
lsrric_prov_ricev,
lsrric_cap,
lsrric_indirizzo
from lsrric A, lsrtit B, lsrser_lotto C
where lsrric_key_id_ricev = lsrser_lotto_key_id_ricev
 and lsrric_key_id_ricev = lsrtit_key_id_ricev 
 and (lsrric_data_validita + lsrric_ora_validita) = 
  (select max(lsrric_data_validita + lsrric_ora_validita) from lsrric 
  where lsrric_key_id_ricev = A.lsrric_key_id_ricev
   and  lsrric_data_validita <= convert(char(8),getdate(),112)
   and  lsrric_flag_validita = 'Y')
 and (lsrtit_data_validita + lsrtit_ora_validita) = 
  (select max((lsrtit_data_validita + lsrtit_ora_validita)) from lsrtit 
  where lsrtit_key_id_ricev = B.lsrtit_key_id_ricev
   and  lsrtit_data_validita <= convert(char(8),getdate(),112)
   and  lsrtit_flag_validita = 'Y')
  and  lsrric_flag_validita = 'Y'
 and  lsrtit_flag_validita = 'Y'
 and lsrser_lotto_data_decor = 
  (SELECT MAX(lsrser_lotto_data_decor) FROM lsrser_lotto 
  WHERE lsrser_lotto_key_id_ricev = C.lsrser_lotto_key_id_ricev
 and lsrser_lotto_data_decor <= (select convert(char(8),getdate(),112))
 and lsrser_lotto_flag_validita = 'Y') 
 and lsrser_lotto_flag_validita = 'Y' 
 and lsrser_lotto_tipo_provv = @STATO
 ORDER by 1
END
GO
