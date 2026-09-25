/****** Object:  StoredProcedure [dbo].[ANA_REP_TRASFERIMENTI]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ANA_REP_TRASFERIMENTI] 
AS 
BEGIN
SELECT 
lsrpro_key_ID_RICEV,
lsrpro_key_tipo_rec,
lsrpro_key_data_provv,
lsrpro_key_prog_provv
FROM lsrpro 
WHERE lsrpro_key_tipo_rec = 'T'
and lsrpro_ft_vos = CONVERT(CHAR(8),GETDATE(),112)

END
GO
