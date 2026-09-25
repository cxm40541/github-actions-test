/****** Object:  StoredProcedure [dbo].[GEV_AGGIORNA_OPERATORE_DOPO_CI]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[GEV_AGGIORNA_OPERATORE_DOPO_CI] ( 

        @data varchar(8) = ''

)

as

begin 

        --declare @data varchar(8)

        --select @data = '20040806'

        --

        -- se la data non и valorizzata, data corrente.

        if @data is null or rtrim(ltrim(@data)) = '' 

        begin

                select @data = convert(varchar(8),getdate(),112)

        end

        --

        -- seleziono tutti i records di lsrser_gev riattivati in @data

        -- che provengono da un cambio di intestazione

        select distinct A.lsrser_gev_key_id_ricev as Ricev

        into ##tmp_riattiv_CI

        from lsrser_gev A,

        ( 

                select lsrser_gev_key_id_ricev, lsrser_gev_data_decor, lsrser_gev_tipo_mov

                from lsrser_gev 

                where lsrser_gev_data_decor = @data

                and lsrser_gev_tipo_mov = 'R'

                and lsrser_gev_flag_validita = 'Y'

        ) RCI

        ,

        ( 

                select lsrser_gev_key_id_ricev, max(lsrser_gev_data_decor) as lsrser_gev_data_decor

                from lsrser_gev 

                where lsrser_gev_data_decor < @data

                and lsrser_gev_tipo_mov IN ('A','R')

                and lsrser_gev_flag_validita = 'Y'

                group by lsrser_gev_key_id_ricev

        ) OLD

        where A.lsrser_gev_key_id_ricev = OLD.lsrser_gev_key_id_ricev

        and   A.lsrser_gev_key_id_ricev = RCI.lsrser_gev_key_id_ricev

        and   A.lsrser_gev_data_decor between OLD.lsrser_gev_data_decor and RCI.lsrser_gev_data_decor 

        and   A.lsrser_gev_tipo_provv = 'I'

        

        --

        -- se l'operatore и di tipo 'E0%' vanno riassegnate la classe a B

        -- e l'operatore a 'W01' (dispari) o 'W02' (pari)

        select distinct lsrpvo_key_id_ricev as ricev

                  ,classe =  case when lsrpvo_operatore like 'E0%'

                                                                then 'B'

                                                                else lsrpvo_classe

                                                       end

              ,operatore = case when lsrpvo_operatore like 'E0%'

                                                                then 'W' + right('00' + convert(varchar,(2 - substring(lsrpvo_key_id_ricev,3,4)%2)),2) 

                                                                else lsrpvo_operatore

                                                       end

        into ##tmp_update

        from ##tmp_riattiv_ci, lsrpvo

        where lsrpvo_key_id_ricev = ricev

        and lsrpvo_operatore like 'E0%'

        

        if @@rowcount > 0

        begin

                -- aggiorno i record selezionati

                update lsrpvo

                set lsrpvo_operatore = operatore 

                   ,lsrpvo_classe = classe 

                from ##tmp_update, lsrpvo

                where lsrpvo_key_id_ricev = ricev

 

        end

 

        drop table ##tmp_update

        drop table ##tmp_riattiv_CI

end
GO
