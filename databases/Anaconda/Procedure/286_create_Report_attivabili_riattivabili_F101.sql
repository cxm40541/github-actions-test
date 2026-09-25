/****** Object:  StoredProcedure [dbo].[Report_attivabili_riattivabili_F101]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROCEDURE [dbo].[Report_attivabili_riattivabili_F101] 
		@FLAG_LOTTO 	 	CHAR(1) = '1',
		@FLAG_ATTIV_RIATTIV 	CHAR(1) = 'A',
		@FILE			CHAR(255)  OUTPUT
AS

IF (@FLAG_ATTIV_RIATTIV = 'A') 
BEGIN
	EXECUTE Report_attivabili_F101_con_fidejussione @FLAG_LOTTO, @FILE OUTPUT
END
ELSE
BEGIN
	EXECUTE Report_riattivabili_F101_con_fidejussione @FLAG_LOTTO, @FILE OUTPUT
END
GO
