/****** Object:  StoredProcedure [dbo].[ANA_REP_DELTACONTPOSGIALLO]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         PROCEDURE [dbo].[ANA_REP_DELTACONTPOSGIALLO]
@DATAELAB       CHAR(8)  
AS
BEGIN
		SELECT
		LSRCON_GEV.LSRCON_GEV_cod_lotto,
		LSR01a_DECOD_RICEV as RAGSOC,
                LSRCON_GEV_cognome,
	        LSRCON_GEV_nome,
	 	LSRCON_GEV_partita_iva,
		LSRCON_GEV_cod_fisc,
                LSRCON_GEV_indirizzo,
               	LSRCON_GEV_cap,
	        LSRCON_GEV_comune,
		LSRCON_GEV_provincia,
	        LSRCON_GEV_note,
	        LSRCON_GEV_KEY_DATA_INS,
                (CASE 
		     WHEN A.LSRCON_GEV_cod_lotto IS NULL THEN ''
                     WHEN A.LSRCON_GEV_cod_lotto IS NOT NULL THEN 'S'
		 END) As CAMBIOTITOLARITA		
		FROM LSRCON_GEV 
                LEFT OUTER JOIN Condiviso.dbo.LSR01a 
                ON LSRCON_GEV.LSRCON_GEV_cod_lotto= Condiviso.dbo.LSR01a.LSR01a_key_id_ricev
                LEFT OUTER JOIN 
                (SELECT LSRCON_GEV_cod_lotto
		        FROM LSRCON_GEV 
		        WHERE  
	                LSRCON_GEV_FLAG_ANAG > '1'
		        AND LSRCON_GEV_COD_LOTTO LIKE 'A%'	
                        AND LSRCON_GEV.LSRCON_GEV_cod_lotto in 
			(		SELECT LSRCON_GEV.LSRCON_GEV_cod_lotto
					FROM LSRCON_GEV 
			                LEFT OUTER JOIN LSRRIC 
			                ON LSRCON_GEV.LSRCON_GEV_key_id_ricev= LSRRIC.lsrric_key_id_ricev
					WHERE 
                                        LSRCON_GEV_KEY_DATA_INS =@DATAELAB AND
					 LSRCON_GEV_FLAG_ANAG = '1'
					AND LSRCON_GEV_COD_LOTTO LIKE 'A%'	
                       )) AS A
                ON LSRCON_GEV.LSRCON_GEV_cod_lotto=  A.LSRCON_GEV_cod_lotto
		WHERE LSRCON_GEV.LSRCON_GEV_KEY_DATA_INS = @DATAELAB AND 
		LSRCON_GEV.LSRCON_GEV_FLAG_ANAG = '1'
		AND LSRCON_GEV.LSRCON_GEV_COD_LOTTO LIKE 'A%'	
		ORDER BY 1

END
GO
