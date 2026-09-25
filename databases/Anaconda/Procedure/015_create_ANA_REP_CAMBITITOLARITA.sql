/****** Object:  StoredProcedure [dbo].[ANA_REP_CAMBITITOLARITA]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     PROCEDURE [dbo].[ANA_REP_CAMBITITOLARITA] 
AS 
BEGIN

SELECT lsrpro_key_ID_RICEV,
      	lsrpro_key_tipo_rec,
      	lsrpro_key_data_provv,
      	lsrpro_key_prog_provv,
	lsrser_gev_stato,
	lsrser_BOLLO_stato
FROM lsrpro A
             LEFT OUTER JOIN 
	    (SELECT *   FROM lsrser_gev 
	     WHERE   lsrser_GeV_tipo_provv = 'I' AND
	             lsrser_gev_flag_validita = 'Y' AND
	             lsrser_gev_stato = '2') AS Tlsrser_gev 
             ON (A.lsrpro_key_tipo_rec   =  Tlsrser_gev.lsrser_GeV_tipo_provv   ) AND 
                (A.lsrpro_key_data_provv =  Tlsrser_gev.lsrser_GeV_data_provv   ) AND 
                (A.lsrpro_key_prog_provv =  Tlsrser_gev.lsrser_GeV_prog_provv   ) AND
                (A.lsrpro_key_ID_RICEV   =  Tlsrser_gev.lsrser_GeV_key_id_ricev ) 
             LEFT OUTER JOIN 
	    (SELECT  *  FROM lsrser_BOLLO 
             WHERE   lsrser_BOLLO_tipo_provv = 'I' AND
              	     lsrser_BOLLO_flag_validita = 'Y' AND
                     lsrser_BOLLO_stato = '2') AS Tlsrser_BOLLO 
             ON (A.lsrpro_key_tipo_rec   =  Tlsrser_BOLLO.lsrser_BOLLO_tipo_provv     ) AND 
                (A.lsrpro_key_data_provv =  Tlsrser_BOLLO.lsrser_BOLLO_data_provv     ) AND 
                (A.lsrpro_key_prog_provv =  Tlsrser_BOLLO.lsrser_BOLLO_prog_provv    ) AND
                (A.lsrpro_key_ID_RICEV   =  Tlsrser_BOLLO.lsrser_BOLLO_key_id_ricev ) 
WHERE (lsrpro_key_tipo_rec = 'I') 
AND (lsrpro_ft_vos = (CONVERT(CHAR(8),GETDATE(),112)))

END
GO
