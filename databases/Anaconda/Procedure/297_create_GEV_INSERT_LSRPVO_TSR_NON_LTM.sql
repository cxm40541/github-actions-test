/****** Object:  StoredProcedure [dbo].[GEV_INSERT_LSRPVO_TSR_NON_LTM]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     PROCEDURE [dbo].[GEV_INSERT_LSRPVO_TSR_NON_LTM] 
AS
 
--***********************************************************************
--** Descrizione Procedura
--***********************************************************************
 
set nocount on
 
DECLARE @OGGI  CHAR(8),
        @DATA_IN_NUOVO_INVIO_SGI  CHAR(8)
 
--***********************************************************************
--** Selezione date elaborazione
--***********************************************************************
 
SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
SELECT @DATA_IN_NUOVO_INVIO_SGI=CONVERT(VARCHAR, CONVERT(datetime, @OGGI,103)-6,112)
 
--******************************************
--** SELEZIONE RICEVITORIE CONTRATTUALIZZATE 
--******************************************
-- seleziono tutte le ricevitorie contrattualizzate nella settimana
-- oppure tutte quelle non contrattualizzate ma attivate
 
--drop table #tmp_altre
create table #tmp_altre (
      catena char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
      ricevitoria char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
      operatore char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
      gg_contatto char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
      ingresso char(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
 
insert into #tmp_altre
select       catena = substring(b.Rete_SGI,1,1)
      ,ricevitoria = lsrpvo_key_id_ricev
      ,operatore = null
      ,gg_contatto = null
      ,ingresso = lsrpvo_data_inizio
from  lsrpvo a
      ,gev_decod_ltm_sgi b
where    substring(lsrpvo_key_id_ricev,1,2) = b.Rete_LTM
and      b.Key_Desc not in ('LTM', 'CONI')
and     (lsrpvo_data_inizio    between @DATA_IN_NUOVO_INVIO_SGI and @OGGI
or       lsrpvo_data_invio_SGI between @DATA_IN_NUOVO_INVIO_SGI and @OGGI)
and     (rtrim(ltrim(lsrpvo_operatore)) = '' or lsrpvo_operatore is null)
--order by lsrpvo_data_inizio, lsrpvo_key_id_ricev
 
/*
select ricevitoria, right(ricevitoria,1) ult , (right(ricevitoria,1) % 2) as modulo2
from #tmp_altre  
 
select       distinct b.key_desc 
      ,substring(b.Rete_SGI,1,1) as PrimoB
      ,substring(b.Rete_SGI,1,3) as Primi3 
      --, a.* 
from lsrpvo a
      ,gev_decod_ltm_sgi b 
where       substring(a.lsrpvo_key_id_ricev,1,2) = b.Rete_LTM
and   b.key_desc not in ('LTM','CONI')
 
*/
 
declare @catena char(1)
declare @oper char(1)
declare @nro decimal(10,0)
declare @TOTnro decimal(10,0)
 
set @catena = ''
set @oper = ''
set @nro = 0
set @TOTnro = 0
 
declare cur_catena cursor for 
      select   distinct substring(b.Rete_SGI,1,1) as catena
                  ,'W' AS Oper
            --,case substring(b.Rete_SGI,1,1) 
            --      WHEN '9' then 'B'
            --      WHEN '5' then 'W'
            --      WHEN '4' then 'S'
            --      WHEN '2' then 'E'
            --else ' '
            --end as Oper
      from lsrpvo a, gev_decod_ltm_sgi b 
      where substring(a.lsrpvo_key_id_ricev,1,2) = b.Rete_LTM
      and b.key_desc not in ('LTM','CONI')
 
 
open cur_catena
 
fetch next from cur_catena 
into @catena, @oper
 
while @@fetch_status = 0 
begin
      create table ##tmp_catena (
            id_num int IDENTITY(1,1),
            catena char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
            ricevitoria char(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
            operatore char(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
            gg_contatto char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
            ingresso char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
      )
      
      insert into ##tmp_catena (catena, ricevitoria)
      select catena, ricevitoria  
      from #tmp_altre 
      where catena = @catena
      order by catena,ingresso,ricevitoria
 
      -- select * from ##tmp_catena
 
      select @nro = count(*) 
      from ##tmp_catena
 
      if @nro <> 0 
      begin
            -- ricevitorie presenti
            --print 'inizio elaborazione catena ' + @catena
      
            -- prelevo il totale delle ricevitorie
            -- della stessa catena già elaborate in passato
            select @TOTnro = count(a.lsrpvo_key_id_ricev) 
            from lsrpvo a, gev_decod_ltm_sgi b
            where substring(a.lsrpvo_key_id_ricev,1,2) = b.Rete_LTM
            and substring(b.Rete_SGI,1,1) = @catena
            and lsrpvo_key_id_ricev not in (select ricevitoria from ##tmp_catena)
      
            --print 'totali precedenti ' + convert(varchar,@TOTnro)
            --print 'da elaborare correnti ' + convert(varchar,@nro)
 
          /*
            select ricevitoria
                  ,operatore = @oper + right('00' + 
                             cast((
                                case when substring(ricevitoria, 3,4)%2 = 0 then 1 else 0 end
                              + ceiling((@TOTnro + id_num)/1000)
                              + floor((@TOTnro + id_num)/1000)
                             )as varchar)
                           ,2)
                  --, (@TOTnro + id_num) totcorr
                  , (cast((@TOTnro + id_num)as varchar)%5) + 1 as callday
                  --, ceiling((@TOTnro + id_num)/1000) ceil
                  --, floor((@TOTnro + id_num)/1000) flor
                  --, cast(@TOTnro + id_num as varchar)%1000 summmod1000
                  --, substring(ricevitoria, 3,4)%2 dispari
                  --, case when substring(ricevitoria, 3,4)%2 = 0 then 2 else 1 end as pari
            into ##tmp_oper_catena
            from ##tmp_catena
          */
 
            select ricevitoria
                  ,operatore = case when left(ricevitoria,2) = 'B0' then '   ' 
                                    when left(ricevitoria,2) = 'B1' then '   ' 
                                    else @oper + right('00' + cast((case when right(ricevitoria, 1)%2 = 0 then '2' else '1' end) as varchar) ,2) 
                               end 
                  --, (@TOTnro + id_num) totcorr
                  ,callday = case when left(ricevitoria,2) = 'B0' then 1
                                  when left(ricevitoria,2) = 'B1' then 1
                                else (cast((@TOTnro + id_num)as varchar)%5) + 1 end
                  --, ceiling((@TOTnro + id_num)/1000) ceil
                  --, floor((@TOTnro + id_num)/1000) flor
                  --, cast(@TOTnro + id_num as varchar)%1000 summmod1000
                  --, substring(ricevitoria, 3,4)%2 dispari
                  --, case when substring(ricevitoria, 3,4)%2 = 0 then 2 else 1 end as pari
            into ##tmp_oper_catena
            from ##tmp_catena
 
            update ##tmp_catena 
            set operatore = b.operatore
               ,gg_contatto = b.callday
            from ##tmp_catena a, ##tmp_oper_catena b
            where b.ricevitoria = a.ricevitoria
 
            update lsrpvo
            set lsrpvo_operatore = b.operatore
               ,lsrpvo_gg_contatto = b.gg_contatto
            --select lsrpvo_key_id_ricev, lsrpvo_data_inizio, lsrpvo_operatore, lsrpvo_gg_contatto, operatore, gg_contatto
            from lsrpvo a, ##tmp_catena b
            where a.lsrpvo_key_id_ricev = b.ricevitoria
            and (a.lsrpvo_operatore <> b.operatore or a.lsrpvo_gg_contatto <> b.gg_contatto)
            --order by ingresso, ricevitoria
            
            -- equamente distribuiti sui giorni di contatto
            --select gg_contatto, count(*) 
            --from ##tmp_catena 
            --group by gg_contatto
 
           drop table ##tmp_oper_catena
      end
      --else
      --begin
            -- nessuna ricevitoria
            ----print 'nessun record da elaborare per catena ' + @catena
      --end
 
      set @catena = ''
      set @oper = ''
      set @nro = 0
      set @TOTnro = 0
 
      fetch next from cur_catena 
      into @catena, @oper
 
      drop table ##tmp_catena
end
 
close cur_catena
deallocate cur_catena
 
set nocount off
GO
