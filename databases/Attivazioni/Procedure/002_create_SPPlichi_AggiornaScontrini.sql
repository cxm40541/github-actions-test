/****** Object:  StoredProcedure [dbo].[SPPlichi_AggiornaScontrini]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SPPlichi_AggiornaScontrini] 
@TipoArchivio char(1)
as
begin transaction

declare @DataElaborazione char(8)

-- Ricavo la data di elaborazione!
select @DataElaborazione = convert(char(8),getdate(),112)

if @TipoArchivio = 'A'
begin
	-- Inserimento Scontrini Annullati
	insert into dbo.[Scontrino Atteso]
	(BarCode, [Codice Lottomatica], [Mese Contabile], Tipo, [Flag Acquisito], [Data Inserimento])
	select Matrice, [Codice Lottomatica], [Mese Contabile].[Mese Contabile], 'A', 'N', @DataElaborazione from dbo.[Scontrini Attesi Annullati From File], dbo.[Mese Contabile]
	where [Data Annullamento] >=  [Primo Giorno] and [Data Annullamento] <= [Ultimo Giorno]

	-- Inserimento Ricevitorie
	insert into dbo.Ricevitoria
	([Codice Lottomatica],Denominazione)
	select distinct [Codice Lottomatica] , 'New'
	from dbo.[Scontrini Attesi Annullati From File]
	where [Codice Lottomatica] not in (select [Codice Lottomatica] from dbo.Ricevitoria)
	if @@rowcount > 0
	begin
		insert into dbo.[Stato Ricevitoria In Mese Contabile]
		([Codice Lottomatica], [Mese Contabile], Stato)
		select distinct [Scontrino Atteso].[Codice Lottomatica],[Scontrino Atteso].[Mese Contabile],'' from dbo.Ricevitoria, [Scontrino Atteso]
		where Denominazione = 'New' and 
		Ricevitoria.[Codice Lottomatica] = [Scontrino Atteso].[Codice Lottomatica]

		update dbo.Ricevitoria
		set Denominazione = lsr01a_decod_ricev
		from condiviso.dbo.lsr01a
		where [Codice Lottomatica] = lsr01a_key_id_ricev
		and Denominazione = 'New'
	end
end
else
begin
	-- Inserimento Scontrini Pagati
	insert into dbo.[Scontrino Atteso]
	(BarCode, [Codice Lottomatica], [Mese Contabile], Tipo, [Flag Acquisito], [Data Inserimento])
	select Matrice, [Codice Lottomatica], [Mese Contabile].[Mese Contabile], 'P', 'N', @DataElaborazione from dbo.[Scontrini Attesi Pagati From File], dbo.[Mese Contabile]
	where [Data Pagamento] >=  [Primo Giorno] and [Data Pagamento] <= [Ultimo Giorno] and [Pagata Prenotata] = '1' 

	-- Inserimento Scontrini Prenotati
	insert into dbo.[Scontrino Atteso]
	(BarCode, [Codice Lottomatica], [Mese Contabile], Tipo, [Flag Acquisito], [Data Inserimento])
	select Matrice, [Codice Lottomatica], [Mese Contabile].[Mese Contabile], 'R', 'N', @DataElaborazione from dbo.[Scontrini Attesi Pagati From File], dbo.[Mese Contabile]
	where [Data Pagamento] >=  [Primo Giorno] and [Data Pagamento] <= [Ultimo Giorno] and [Pagata Prenotata] = '2' 

	-- Inserimento Ricevitorie
	insert into dbo.Ricevitoria
	([Codice Lottomatica],Denominazione)
	select distinct [Codice Lottomatica] , 'New'
	from dbo.[Scontrini Attesi Pagati From File]
	where [Codice Lottomatica] not in (select [Codice Lottomatica] from dbo.Ricevitoria)
	if @@rowcount > 0
	begin
		insert into dbo.[Stato Ricevitoria In Mese Contabile]
		([Codice Lottomatica], [Mese Contabile], Stato)
		select distinct [Scontrino Atteso].[Codice Lottomatica],[Scontrino Atteso].[Mese Contabile],'' from dbo.Ricevitoria, [Scontrino Atteso]
		where Denominazione = 'New' and 
		Ricevitoria.[Codice Lottomatica] = [Scontrino Atteso].[Codice Lottomatica]

		update dbo.Ricevitoria
		set Denominazione = lsr01a_decod_ricev
		from condiviso.dbo.lsr01a
		where [Codice Lottomatica] = lsr01a_key_id_ricev
		and Denominazione = 'New'
	end
end
if @@error <> 0
	begin
		rollback transaction
	end
else
	begin
		commit transaction
	end
GO
