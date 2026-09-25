/****** Object:  StoredProcedure [dbo].[ANA_REP_ATTIVAZPOSGIALLO]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [dbo].[ANA_REP_ATTIVAZPOSGIALLO]  
      @DATAINIZIO CHAR(8), 
      @DATAFINE   CHAR(8)
AS 
BEGIN

	SELECT 
		lsr01a_key_id_ricev,
		lsr01a_cognome,
		lsr01a_nome,
		lsr01a_decod_ricev,
		lsr01a_indirizzo,
		lsr01a_cap,
		lsr01a_comune_ricev,
		lsr01a_prov_ricev,
		lsr01a_tel_ricevitoria
        FROM LSRSER_GEV JOIN
			Condiviso.dbo.lsr01a on 
                        LSRSER_GEV.LSRSER_GEV_key_id_ricev = Condiviso.dbo.lsr01a.lsr01a_key_id_ricev
	WHERE (LSRSER_GEV_KEY_ID_RICEV LIKE 'A%' or LSRSER_GEV_KEY_ID_RICEV LIKE 'B0%' or LSRSER_GEV_KEY_ID_RICEV LIKE 'B1%' or LSRSER_GEV_KEY_ID_RICEV LIKE 'B2%' or LSRSER_GEV_KEY_ID_RICEV LIKE 'B3%' )
		AND LSRSER_GEV_TIPO_MOV = 'A'
      	        AND LSRSER_GEV_FLAG_VALIDITA = 'Y'
		AND LSRSER_GEV_DATA_DECOR BETWEEN @DATAINIZIO AND @DATAFINE
        ORDER BY 1
END
GO
