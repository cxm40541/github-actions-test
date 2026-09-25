/****** Object:  StoredProcedure [dbo].[ADESIONE_TRIS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ADESIONE_TRIS]
	@Ricev 		char(6),
	@DataAdes		char(8),
	@Firma			char(17),
	@MsgErr 		varchar(100) output
AS

DECLARE 	@DataIns	char(8),
		@OraIns	char(8),
		@StatoTris	char(1),
		@TipoProvv	char(1),
		@ChkRicev	char(6)


SELECT @DataIns = substring(convert(char(25),getdate(),121),1,4)+
		substring(convert(char(25),getdate(),121),6,2)+
		substring(convert(char(25),getdate(),121),9,2)

SELECT @OraIns = substring(convert(char(25),getdate(),121),12,2)+
		substring(convert(char(25),getdate(),121),15,2)+
		substring(convert(char(25),getdate(),121),18,2)+
		substring(convert(char(25),getdate(),121),21,2)

/*
' Eseguo i controlli nel caso di attivazione al servizio TRIS:
' 1) - Esiste la ricevitoria in lsrric
' 2)  NON esiste la ricevitoria in lsrser_tris OPPURE esista ma il tipo provvedimento sia I (cambio intestatario)
*/


/*
Controllo 1
*/
SELECT @ChkRicev = lsrric_key_id_ricev FROM lsrric
WHERE lsrric_key_id_ricev = @Ricev

IF @ChkRicev = '' OR @ChkRicev IS NULL

BEGIN
	SELECT @MsgErr = '8888 - ' + @Ricev +' RICEVITORIA INESISTENTE SU LSRRIC'
	RETURN
END

/*
Controllo 2
*/
SELECT @ChkRicev = lsrser_tris_key_id_ricev FROM lsrser_tris
WHERE lsrser_tris_key_id_ricev = @Ricev

IF  @ChkRicev IS NOT NULL

BEGIN
	SELECT @TipoProvv= lsrser_tris_tipo_provv
	FROM lsrser_tris
	WHERE lsrser_tris_key_id_ricev = @Ricev
	AND lsrser_tris_flag_validita = 'Y'
	AND lsrser_tris_data_decor =
	(SELECT MAX(lsrser_tris_data_decor) FROM lsrser_tris
	WHERE lsrser_tris_key_id_ricev = @Ricev
	AND lsrser_tris_flag_validita = 'Y'
	AND lsrser_tris_data_decor <= @DataAdes)

	IF @TipoProvv <> 'I'  OR @TipoProvv IS NULL
	BEGIN
		SELECT @MsgErr = '8888 - ' + @Ricev +' RICEVITORIA GIA PRESENTE SU LSRSER_TRIS'
		RETURN
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION

		INSERT INTO lsrser_tris VALUES (@Ricev,@DataIns,@OraIns,'0',@DataAdes,null,null,null,null,@Firma,null,'00000000','Y')

		IF @@error <> 0 
			BEGIN
				SELECT @MsgErr = '9999 - ' + @Ricev +' ERRORE IN INSERT SU LSRSER_TRIS'
				ROLLBACK TRANSACTION
				RETURN
			END

		ELSE
			BEGIN
				SELECT @MsgErr = '0000 - ELABORAZIONE TERMINATA CORRETTAMENTE'
				COMMIT TRANSACTION
				RETURN
			END

	END
END
ELSE
BEGIN
	BEGIN TRANSACTION

	INSERT INTO lsrser_tris VALUES (@Ricev,@DataIns,@OraIns,'0',@DataAdes,null,null,null,null,@Firma,null,'00000000','Y')

	IF @@error <> 0 
		BEGIN
			SELECT @MsgErr = '9999 - ' + @Ricev +' ERRORE IN INSERT SU LSRSER_TRIS'
			ROLLBACK TRANSACTION
			RETURN
		END

	ELSE
		BEGIN
			SELECT @MsgErr = '0000 - ELABORAZIONE TERMINATA CORRETTAMENTE'
			COMMIT TRANSACTION
			RETURN
		END
END
GO
