/****** Object:  View [dbo].[V_LAST_PARTITA_IVA]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_LAST_PARTITA_IVA] AS 
SELECT LSRCON_LIS_KEY_ID_RICEV, LSRCON_LIS_PARTITA_IVA, lsrcon_lis_fk_data_ins_tit + '-' + lsrcon_lis_fk_ora_ins_tit as fktit
FROM Anaconda.dbo.LSRCON_LIS a
WHERE LSRCON_LIS_FLAG_ANAG = '1'
AND lsrcon_lis_fk_data_ins_tit + '-' + lsrcon_lis_fk_ora_ins_tit = (
	SELECT MAX(lsrcon_lis_fk_data_ins_tit + '-' + lsrcon_lis_fk_ora_ins_tit)
	FROM Anaconda.dbo.LSRCON_LIS xa
	WHERE xa.LSRCON_LIS_KEY_ID_RICEV = a.LSRCON_LIS_KEY_ID_RICEV
	AND xa.LSRCON_LIS_FLAG_ANAG = '1'
)
GO
