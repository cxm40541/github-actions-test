/****** Object:  StoredProcedure [dbo].[ElencoRicevitorieTrasfInJoinNew]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ElencoRicevitorieTrasfInJoinNew]
	@codlotto char(6),
	@codamm char(6),
	@datains char(8),
        @ft_vos varchar(8),
  	@MSGERR 	VARCHAR(100) OUTPUT

AS
declare @data char(8)
select @data= convert(char(8), getDate(),112)

select *
from lsrric A join lsrtit B 
on lsrric_key_id_ricev = lsrtit_key_id_ricev ,
lsrpro_tra,lsrpro_tra_tipo C,
condiviso.dbo.lsr01a D
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
       and lsrpro_tra_key_id_ricev=lsrric_key_id_ricev
       and lsrpro_tra_key_id_ricev=lsrtit_key_id_ricev
       and  lsrric_flag_validita = 'Y'
       and  lsrtit_flag_validita = 'Y'
       and  lsrpro_tra_flag_validita = 'Y'
  AND ((@ft_vos='*' and LTRIM(RTRIM(lsrpro_tra_ft_vos)) <>'0')  OR (LTRIM(RTRIM(lsrpro_tra_ft_vos)) = LTRIM(RTRIM(@ft_vos)))  )
       AND C.lsrpro_tra_codice = lsrpro_tra_key_tipo_rec
       AND D.lsr01a_key_id_ricev = lsrpro_tra_key_id_ricev
       AND (@CODLOTTO='*' OR (lsrric_key_id_ricev = @CODLOTTO and lsrtit_key_id_ricev = @CODLOTTO))
       AND (@CODAMM='*' OR lsrric_cod_amm = @CODAMM)
         and (@dataIns='*' or LTRIM(RTRIM(lsrpro_tra_data_ins))=LTRIM(RTRIM(@datains)))
	order by   lsrpro_tra_data_ins, lsrpro_tra_key_id_ricev
GO
