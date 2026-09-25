/****** Object:  UserDefinedFunction [dbo].[f_ana_ultimo_fide]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/* Reperimento ultimo ente fideuissorio per ricevitoria/prodotto */
/* vale solo per coni,tris,gev                                   */
 
CREATE  FUNCTION [dbo].[f_ana_ultimo_fide](@ricevit as varchar(6), @prod as varchar(2) )
 
RETURNS varchar(50)
AS
 
BEGIN
DECLARE @Ente as varchar(50)
DECLARE @ricev as varchar(6)
DECLARE @cod_prod as varchar(2)
 
SELECT @Ente = NULL
SELECT @ricev = rtrim(ltrim(@ricevit))
SELECT @cod_prod = rtrim(ltrim(@prod))
--tris (vecchia)
IF @cod_prod  = '08'
   BEGIN
 select @Ente = convert(varchar,ltrim(rtrim(lsrsoc_descrizione)))
 from lsrfid_tris A left outer join dbo.lsrsoc B
 on lsrfid_tris_id_soc = lsrsoc_key_id_soc
 where lsrfid_tris_key_id_ricev = @ricev
 and lsrfid_tris_flag_anag = 1
 and lsrfid_tris_anno_rif = (select max(lsrfid_tris_anno_rif) from lsrfid_tris where lsrfid_tris_key_id_ricev = @ricev )   
   END 
-- GeV
IF @cod_prod  = '09'
   BEGIN
 select @Ente =  convert(varchar,ltrim(rtrim(lsrsoc_descrizione)))
        from lsrfid_gev A left outer join dbo.lsrsoc B
 on lsrfid_gev_id_soc = lsrsoc_key_id_soc
 where lsrfid_GeV_cod_lotto = @ricev
 and lsrfid_gev_flag_anag = 1
 and lsrfid_gev_anno_rif = (select max(lsrfid_gev_anno_rif) from lsrfid_gev where lsrfid_GeV_cod_lotto = @ricev )  
   END 
-- CONI
IF @cod_prod  = '11'
   BEGIN
 select @Ente = convert(varchar,ltrim(rtrim(lsrsoc_descrizione)))
 from lsrfid_coni A left outer join dbo.lsrsoc B
 on lsrfid_coni_id_soc = lsrsoc_key_id_soc
 where lsrfid_coni_key_id_ricev = @ricev
 and lsrfid_coni_flag_anag = 1
 and lsrfid_coni_anno_rif = (select max(lsrfid_coni_anno_rif) from lsrfid_coni where lsrfid_coni_key_id_ricev = @ricev )   
   END 
 
select @Ente = isnull(@Ente, ' ')
RETURN @Ente
 
END
GO
