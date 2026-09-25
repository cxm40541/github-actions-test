/****** Object:  StoredProcedure [dbo].[CHIUSURA_LAVORAZIONI_SDLC_IP]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/* INSERIMENTO ESITI LAVORAZIONI MIGRAZIONE TERMINALI SU LINEA IP

DATA RILASCIO : 15/10/2002
SCRITTA DA : M. Rossi */

CREATE procedure [dbo].[CHIUSURA_LAVORAZIONI_SDLC_IP] (@cod_lotto as char(6), 
                                                   				          @cod_amm as char(6),
                                                   				          @postazione as char(2), 
                                                   				          @flag as char(1),
		                                                                             @codice as char(5),
			                                                                @utente as char(6),
                                                   				          @note as char (200),
                                                   				          @msg as varchar(60) output)
as

declare @rc as int
declare @flag1 as char (2)
declare @conta as int
declare @cnttab_lav as int
select @rc = 0
select @msg = 'AGGIORNAMENTO EFFETTUATO CON SUCCESSO'
select @flag1 = @flag
if @flag = '1' select @flag1 = '4'

begin

select @cnttab_lav = count(*) from tab_lavorazioni
	where cod_lotto = @cod_lotto and postazione = @postazione	
if @cnttab_lav <> 0 
	begin
		update tab_lavorazioni set cod_lotto = @cod_lotto,postazione = @postazione,flag = @flag,data=getdate(),codice = @codice,utente = @utente,note = @note
			where cod_lotto = @cod_lotto and postazione = @postazione and cod_amm = @cod_amm
	end
else
	begin

		insert into tab_lavorazioni (cod_lotto,cod_amm,postazione,flag,data,codice,utente,note) 
                          		  values (@cod_lotto,@cod_amm,@postazione,@flag,getdate(),@codice,@utente,@note)
    
	end 

select @conta = count(*)  from tab_telecom 
            where cod_lotto = @cod_lotto and postazione = @postazione --and utente = @utente
if @conta <> 0 
	begin
		update tab_telecom set stato_lavorazione = @flag1, data_end_lav = getdate(), utente = @utente
            			where cod_lotto = @cod_lotto and postazione = @postazione --and utente = @utente
	end
else
	begin
		INSERT INTO TAB_TELECOM VALUES(@cod_lotto,@cod_amm,@postazione,null,GETDATE(),@flag1,@utente,GETDATE(),GETDATE(),null,'1','0',null,null)
		select @msg = 'AGGIORNAMENTO EFFETTUATO CON SUCCESSO,IN TAB_TELECOM INSERITO RECORD PERCHE MANCANTE.'
	end

end

if @@error <> 0

begin
select @rc = 1
select @msg = 'ATTENZIONE AGGIORNAMENTO TERMINATO CON ERRORE'
end 

return (@rc)
GO
