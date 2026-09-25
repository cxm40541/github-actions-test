/****** Object:  View [dbo].[v_tit_decorr_prec]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[v_tit_decorr_prec]
AS select * from v_tit_decorr_prec_parziale --union select * from  v_tit_mancanti
GO
