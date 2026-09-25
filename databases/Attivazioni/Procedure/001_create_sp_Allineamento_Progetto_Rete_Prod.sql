/****** Object:  StoredProcedure [dbo].[sp_Allineamento_Progetto_Rete_Prod]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Allineamento_Progetto_Rete_Prod]
 
AS 
 
BEGIN 
 
DECLARE @IdLineaMigrata          INT
DECLARE @IdContrattoSedFornitore INT
DECLARE @DescContrattoSedFornitore  NVARCHAR(30)
DECLARE @IdTipoLinea             INT
DECLARE @CodLottomatica          NVARCHAR(30)
DECLARE @TdLineaNuova            NVARCHAR(30)
DECLARE @Td_linea_vecchia        NVARCHAR(30)
DECLARE @IpWanRouter             NVARCHAR(30)
DECLARE @LanRemota               NVARCHAR(30)
DECLARE @Tipo_T                  NVARCHAR(30)
 
 declare @Tgu_t nvarchar(30)
 declare @Lotto_telecom nvarchar(30)
 declare @Idlottomatica nvarchar(30)
 
 declare @td nvarchar(30)
 declare @Nter nvarchar(30)
 declare @td_adsl nvarchar(30)
 declare @tipo_linea nvarchar(30) 
 declare @ip_broadcast nvarchar(30) 
 declare @ip_ftp nvarchar(30) 
 declare @ret2 nvarchar(30) 
 declare @note nvarchar(100) 
 declare @timestamp datetime
 declare @SedLavorato int
 
 DECLARE csrLinee CURSOR READ_ONLY FOR
 
 select  t.nter,
   t.id_lottomatica,
   t.tgu_t,
   t.lotto_telecom,
   t.td,
   t.td_adsl,
   t.tipo_t,
      t.ip_broadcast, 
   t.ip_ftp, 
   t.ret2, 
   t.note,
   t.sed_lavorato
 from [SQLSED].PROGETTO_RETE_COPY.DBO.COLLEGAMENTI_TERMINALI as t 
 where sed_operazione='U' and (sed_lavorato=0 or sed_lavorato=2)
 
 OPEN csrLinee
 FETCH csrLinee INTO @Nter,@Idlottomatica,@Tgu_t,@Lotto_telecom,@td,@td_adsl,@tipo_linea,@ip_broadcast,@ip_ftp,@ret2,@note,@SedLavorato
 
select @timestamp=getdate()


 WHILE @@Fetch_Status = 0
 BEGIN 

 
 if @SedLavorato = 0
 begin 
 --begin transaction
  update collegamenti_terminali
   set tgu_t =@Tgu_t,
    Lotto_telecom  = @Lotto_telecom
  where nter = @Nter
 
 
  update [SQLSED].PROGETTO_RETE_COPY.DBO.COLLEGAMENTI_TERMINALI set sed_lavorato = 1, DATA_MODIFICA = @timestamp
  where nter = @Nter

 --commit
 end
 else if @SedLavorato = 2
 begin
  --begin transaction
  update collegamenti_terminali
   set td=    @td,
    td_adsl=  @td_adsl, 
    tipo_t=   @tipo_linea, 
    ip_broadcast= @ip_broadcast, 
    ip_ftp=   @ip_ftp, 
    ret2=   @ret2, 
    note=   @note 
  where nter = @Nter
 
  update [SQLSED].PROGETTO_RETE_COPY.DBO.COLLEGAMENTI_TERMINALI set sed_lavorato =  3,DATA_MODIFICA = @timestamp
   where nter = @Nter

 --commit
 end
 
 FETCH csrLinee INTO @Nter,@Idlottomatica,@Tgu_t,@Lotto_telecom,@td,@td_adsl,@tipo_linea,@ip_broadcast,@ip_ftp,@ret2,@note,@SedLavorato

 END
 
 CLOSE csrLinee
 DEALLOCATE csrLinee
 
END
GO
