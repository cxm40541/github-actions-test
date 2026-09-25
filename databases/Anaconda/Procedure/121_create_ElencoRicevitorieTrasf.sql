/****** Object:  StoredProcedure [dbo].[ElencoRicevitorieTrasf]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ElencoRicevitorieTrasf]
	@COMUNE char(24),
	@nome char(20),
	@cognome char(24),
	@codlotto char(6),
	@codamm char(6),
  	@MSGERR 	VARCHAR(100) OUTPUT
        

 AS
declare @data char(8)
select @data= convert(char(8), getDate(),112)
select *
from lsrric A join lsrtit B 
on lsrric_key_id_ricev = lsrtit_key_id_ricev 
where (lsrric_data_validita + lsrric_ora_validita) = 
	(select max(lsrric_data_validita + lsrric_ora_validita) from lsrric 
	where lsrric_key_id_ricev = A.lsrric_key_id_ricev
	 and  lsrric_data_validita <= @DATA 
	 and  lsrric_flag_validita = 'Y')
and (lsrtit_data_validita + lsrtit_ora_validita) = 
	(select max((lsrtit_data_validita + lsrtit_ora_validita)) from lsrtit 
	where lsrtit_key_id_ricev = B.lsrtit_key_id_ricev
	and  lsrtit_data_validita <= @DATA 
	and  lsrtit_flag_validita = 'Y')
and  lsrric_flag_validita = 'Y'
and  lsrtit_flag_validita = 'Y'
AND (@CODLOTTO='*' OR (lsrric_key_id_ricev = @CODLOTTO and lsrtit_key_id_ricev = @CODLOTTO))
AND (@CODAMM='*' OR lsrric_cod_amm = @CODAMM)
AND (@COMUNE = '*' OR lsrric_comune_ricev like  ltrim(rtrim(@COMUNE))+'%')
AND (@NOME = '*' OR lsrtit_nome like ltrim(rtrim(@NOME))+'%')
AND (@COGNOME = '*' OR lsrtit_cognome like ltrim(rtrim(@COGNOME))+'%')
order by 1
GO
