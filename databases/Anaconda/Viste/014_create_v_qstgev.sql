/****** Object:  View [dbo].[v_qstgev]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_qstgev]
AS
SELECT * 
FROM lsrqst_GeV b
WHERE lsrqst_GeV_key_data_ins in
      (SELECT max(lsrqst_GeV_key_data_ins)
       FROM lsrqst_GeV a
       WHERE a.lsrqst_GeV_key_id_ricev = b.lsrqst_GeV_key_id_ricev)
GO
