/****** Object:  StoredProcedure [dbo].[ASSOCIAZIONE_BOLLO_DATA]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE      PROCEDURE [dbo].[ASSOCIAZIONE_BOLLO_DATA]  
 
  @dataricerca  varchar(8)
 ,@associazione   char(1)
 
 AS
 
begin
 
 if rtrim(ltrim(@associazione)) = '' or @associazione is null
 begin
  select @associazione = '*'
 end 
 
-- declare @dataricerca varchar(8)
-- select @dataricerca = convert(varchar(8),getdate(),112)
 
 select  distinct 
   LSR.ricev as Cod_lottomatica
 /*
  ,RAD.AssocRAD
  ,CON.AssocCON
  ,SER.AssocSER
  
  ,RAD2.AssocRAD2
  ,CON2.AssocCON2
 */
  ,case  isnull(SER.StatoSER,null)
   when '' then null
   else SER.StatoSER
  end as Stato_Bollo
  
  ,case isnull(SER.DecorSER,null)
   when '00000000' then null
   when '' then null
   else convert(varchar(10),convert(datetime,SER.DecorSER,112),103) 
  end as Data_Decorrenza_Bollo
  
  ,case 
   when  isnull(RAD.AssocRAD,isnull(CON.AssocCON,isnull(SER.AssocSER,isnull(RAD2.AssocRAD2,isnull(CON2.AssocCON2,null))))) = '' then null
   else  isnull(RAD.AssocRAD,isnull(CON.AssocCON,isnull(SER.AssocSER,isnull(RAD2.AssocRAD2,isnull(CON2.AssocCON2,null))))) 
  end as Associazione_Bollo
  
 into #tmp_bollo
   
 from 
 (
  select  distinct lsr01a_key_id_ricev as Ricev
  from  condiviso.dbo.lsr01a
  where  substring(lsr01a_key_id_ricev,2,1) not in ('X','W')
 ) as LSR
 ,
 (
   select  lsrrad_key_id_ricev as Ricev, 
   lsrrad_cod_associazione as AssocRAD, 
   lsrrad_data_invio_doc as DataDocRAD
  from anaconda.dbo.lsrrad r
  where lsrrad_fonte = 'A'
  and lsrrad_tipo_servizio = '05' 
  and lsrrad_flag_anag = '1'
  and lsrrad_data_invio_doc = 
   (
    select  max(xr.lsrrad_data_invio_doc) 
    from anaconda.dbo.lsrrad xr
    where   xr.lsrrad_key_id_ricev = r.lsrrad_key_id_ricev
    and  lsrrad_fonte = 'A'
    and   lsrrad_tipo_servizio = '05' 
    and   lsrrad_flag_anag = '1'
    -- ??? 
    and lsrrad_data_invio_doc <= @dataricerca 
   )
 ) as RAD
 ,
 (
   select  lsrrad_key_id_ricev as Ricev, 
   lsrrad_cod_associazione as AssocRAD2, 
   lsrrad_data_invio_doc as DataDocRAD2
  from anaconda.dbo.lsrrad r
  where lsrrad_fonte = 'A'
  and lsrrad_tipo_servizio = '05' 
  and lsrrad_flag_anag = '2'
  and lsrrad_data_invio_doc = 
   (
    select  max(xr.lsrrad_data_invio_doc) 
    from anaconda.dbo.lsrrad xr
    where   xr.lsrrad_key_id_ricev = r.lsrrad_key_id_ricev
    and  lsrrad_fonte = 'A'
    and   lsrrad_tipo_servizio = '05' 
    and   lsrrad_flag_anag = '2'
    -- ??? 
    and lsrrad_data_invio_doc <= @dataricerca 
   )
 ) as RAD2
 , 
 (
  select lsrcon_bollo_key_id_ricev as Ricev, 
   lsrcon_bollo_associazione as AssocCON,
   lsrcon_bollo_data_contratto as DataDocCon
  from anaconda.dbo.lsrcon_bollo c
  where  lsrcon_bollo_flag_anag = '1'
  and  lsrcon_bollo_tipo_doc = 'C'
  and  lsrcon_bollo_data_contratto = 
   (
    select  max(xc.lsrcon_bollo_data_contratto)
    from anaconda.dbo.lsrcon_bollo xc
    where  xc.lsrcon_bollo_key_id_ricev = c.lsrcon_bollo_key_id_ricev
    and  lsrcon_bollo_tipo_doc = 'C'
    and  lsrcon_bollo_flag_anag = '1'
    -- ??? 
    and lsrcon_bollo_data_contratto <= @dataricerca 
   )
 ) as CON
 , 
 (
  select lsrcon_bollo_key_id_ricev as Ricev, 
   lsrcon_bollo_associazione as AssocCON2,
   lsrcon_bollo_data_contratto as DataDocCon2
  from anaconda.dbo.lsrcon_bollo c
  where  lsrcon_bollo_flag_anag = '2'
  and  lsrcon_bollo_tipo_doc = 'C'
  and  lsrcon_bollo_data_contratto = 
   (
    select  max(xc.lsrcon_bollo_data_contratto)
    from anaconda.dbo.lsrcon_bollo xc
    where  xc.lsrcon_bollo_key_id_ricev = c.lsrcon_bollo_key_id_ricev
    and  lsrcon_bollo_tipo_doc = 'C'
    and  lsrcon_bollo_flag_anag = '2'
    -- ??? 
    and lsrcon_bollo_data_contratto <= @dataricerca 
   )
 ) as CON2
 ,
 (
  select  lsrser_bollo_key_id_ricev as Ricev
   ,case 
      when isnull(rtrim(ltrim(lsrser_bollo_associazione)),null) = '' then null
     else isnull(rtrim(ltrim(lsrser_bollo_associazione)),null) 
   end as AssocSER
 
   ,lsrser_bollo_data_decor as DecorSER
   ,case 
      when isnull(lsrser_bollo_stato,null) = '' then null
     else isnull(lsrser_bollo_stato,null) 
   end as StatoSER
  from anaconda.dbo.lsrser_bollo s
  where  lsrser_bollo_flag_validita = 'y'
  and  lsrser_bollo_ft_vos <> '00000000'
  and    lsrser_bollo_data_decor = 
   (
    select  max(xs.lsrser_bollo_data_decor)
    from anaconda.dbo.lsrser_bollo xs
    where  xs.lsrser_bollo_key_id_ricev = s.lsrser_bollo_key_id_ricev
    and  lsrser_bollo_flag_validita = 'y'
    and  lsrser_bollo_ft_vos <> '00000000'
    -- ???
    and lsrser_Bollo_data_decor <= @dataricerca 
   )
 ) as SER
 
 where  LSR.Ricev *= RAD.Ricev
 and  LSR.Ricev *= CON.Ricev
 and  LSR.Ricev *= SER.Ricev
 and  LSR.Ricev *= RAD2.Ricev
 and  LSR.Ricev *= CON2.Ricev
 
 select * 
 from #tmp_bollo 
 where stato_bollo is not null 
 and stato_bollo <> '0'
 and (@associazione = '*' or Associazione_Bollo = @associazione)
 
end
GO
