/****** Object:  UserDefinedFunction [dbo].[f_gev_calcola_merceologica]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    function [dbo].[f_gev_calcola_merceologica]  (
       @ricevitoria varchar(7) = null
)
returns char(4)
as
begin
      declare @merceologica char(4)
      select @merceologica = case when lsrcon_gev_cod_merce = '00'
                            then case substring(lsrcon_GeV_key_id_ricev,1,1)
                                       when '1' then '0004'
                                       when '2' then '0003'
                                       when '3' then '0001'
                                       when '4' then '0001'
                                       when '5' then '0000'
                                       when '7' then '0009'
                                       when '9' then '0000'
                                   else '0000' end
                            else right('0000' + convert(varchar,lsrcon_gev_cod_merce),4) end
      from     dbo.lsrcon_GeV
      where    lsrcon_GeV_flag_anag = '1'
      and      lsrcon_GeV_cod_lotto = @ricevitoria
      if @@rowcount = 0 
      begin
        declare @codsgi char(7)
        select @codsgi = dbo.f_gev_codifica_ltm_sgi(@ricevitoria)
        select @merceologica = 
            case substring(@codsgi,1,1)
                   when '1' then '0004'
                   when '2' then '0003'
                   when '3' then '0001'
                   when '4' then '0001'
                   when '5' then '0000'
                   when '7' then '0009'
                   when '9' then '0000'
            else '0000' end
      end 
              if @merceologica is null or rtrim(ltrim(@merceologica)) = '' 
              begin
                         select @merceologica = '0000'
              end
      return @merceologica
end
GO
