/****** Object:  StoredProcedure [dbo].[check_pwd]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================================
-- Author:		Berardinelli
-- Create date: 06/12/2006
-- Description:	Controllo requisiti password come prescrive il D.Lgs.196/03 (all. B, punto 5)
-- ==============================================================================================
CREATE PROCEDURE [dbo].[check_pwd]
	@user_name	varchar(32), 
	@user_password	varchar(16),
	@azione		char(1),   
    -- azione:
    --     L   --> login
    --     M   --> modifica
    --     I   --> inserimento
	@codice_ritorno char(1) output,
	@message	varchar(1000) output
AS
DECLARE 
	@cod_ascii		as int,
	@pwd_ok			as int,
	@tentativo		as int,
	@cont			as int,
	@usr_name		as varchar(32),
	@usr_password	as varchar(16),
	@dataoggi 	as char(8),
	@dataieri 	as char(8),
	@data_23	as char(8)

	SELECT @DATAOGGI = CONVERT (CHAR(8), GETDATE(), 112)
	SELECT @DATAIERI = CONVERT (CHAR(8), GETDATE() -1, 112)
	SELECT @DATA_23 = CONVERT (CHAR(8), GETDATE() + 25, 112)

	set @message = ''
	set @usr_name = rtrim(@user_name)
	set @usr_password = rtrim(@user_password)

	if @azione = 'L' -- login
	begin 
		--verifica che l'utente esiste
		select rep
		from   user_password
		where  rep=@usr_name

		-- utente non trovato
		if @@rowcount = 0 
		begin
			set @message='Account ' + @usr_name + ' non trovato.'
			set @codice_ritorno=2
			return 1
		end
	
		--verifica che l'account utente non sia bloccato
		select rep
		from   user_password
		where  rep=@usr_name and
			   bloccato = 'Y'

		-- acoount bloccato
		if @@rowcount > 0 
		begin
			set @message='Account ' + @usr_name + ' bloccato, contattare l''amministratore.'
			set @codice_ritorno=2
			return 1
		end

		--verifica che la password è corretta
		select rep
		from   user_password
		where  rep=@usr_name and 
			   pwdcompare(@usr_password, psw_1)=1 

		-- se inserita password sbagliata
		if @@rowcount = 0 
		begin
			-- incremento il numero di tentativi di inserimento password
			update user_password
			set    num_tentativo=num_tentativo + 1
			where  rep=@usr_name
			
			-- ricavo il numero di tentativi 
			select @tentativo = num_tentativo
			from   user_password
			where  rep=@usr_name

			-- se si sbaglia l'inserimento della password per più di 2 volte, l'account viene bloccato
			if @tentativo > 2
			begin
				-- l'account viene bloccato
				update user_password
				set    bloccato='Y'
				where  rep=@usr_name

				set @message='Account ' + @usr_name + ' bloccato, contattare l''amministratore.'
				set @codice_ritorno=2
				return 1
			end
			else
			begin
				set @message='Password errata.'
				set @codice_ritorno=2
				return 1
			end
		end
		--la password inserita è corretta
		else 
		begin
			-- azzero il conteggio di tentativi di inserimento password
			update user_password
			set    num_tentativo=0
			where  rep=@usr_name

			--verifica che la password non sia scaduta
			select rep
			from   user_password
			where  rep=@usr_name and
				   data_scad > @DATAOGGI

			-- acoount scaduto
			if @@rowcount = 0 
			begin
				set @message='Password scaduta.'
				set @codice_ritorno=3
				return 1
			end
			else
			begin
				set @codice_ritorno=0
				return 0
			end
		end
	end -- fine login
	
	if @azione = 'R' -- reset
	begin
		-- aggiorna password
		update user_password
		set    psw_1 = pwdencrypt('old'),
			   data_mod = @DATAOGGI, 
			   data_scad = @DATAIERI,
			   num_tentativo = 0,
			   bloccato=null
		where  rep=@usr_name
		return 0
	end

	set @cont=0

	-- verifica la lunghezza della password, deve essere almeno di 8 caratteri
	if len(@usr_password) < 8
	begin
		set @message='La password deve essere almeno di 8 caratteri.'
		set @codice_ritorno=1
		return 1
	end

	-- verifica presenza almeno un carattere numerico
	set @cod_ascii=48
	set @pwd_ok=0
	while @cod_ascii <= 57
	begin
		if charindex(char(@cod_ascii), @usr_password) > 0
		begin
			set @pwd_ok=1
			break
		end
		set @cod_ascii=@cod_ascii + 1
	end

	if @pwd_ok = 0
	begin
		print 'numerico'
		set @message=@message+char(10)+char(13)+'La password deve contenere almeno un carattere numerico.'
	end
	else
		set @cont=@cont + 1



-- verifica presenza almeno un carattere maiuscolo
	set @pwd_ok=0

	if BINARY_CHECKSUM(@usr_password) <> BINARY_CHECKSUM(lower(@usr_password))
	begin
		set @pwd_ok=1
	end

	if @pwd_ok = 0
	begin
		print 'maiu'

		set @message=@message+char(10)+char(13)+'La password deve contenere almeno un carattere maiuscolo.'
	end
	else
		set @cont=@cont + 1

	-- verifica presenza almeno di un carattere speciale #$@_-*%&
	if charindex(char(35), @usr_password) = 0 and -- carattere #
      	charindex(char(36), @usr_password) = 0 and -- carattere $
	charindex(char(64), @usr_password) = 0 and -- carattere @
	charindex(char(95), @usr_password) = 0 and -- carattere _
	charindex(char(45), @usr_password) = 0 and -- carattere -
	charindex(char(42), @usr_password) = 0 and -- carattere *
	charindex(char(37), @usr_password) = 0 and -- carattere %
	charindex(char(38), @usr_password) = 0 -- carattere &
	begin
		print 'spec'

		set @message=@message+char(10)+char(13)+'La password deve contenere almeno un carattere speciale #$@_-*%&.'
	end
	else
		set @cont=@cont + 1

	if @cont < 2
	begin
		set @message='La password digitata non è valida.'
		set @message=@message+char(10)+char(13)+char(10)+char(13)+'La password deve rispettare almeno 2 delle seguenti regole:'
		set @message=@message+char(10)+char(13)+'    - La password deve contenere almeno un carattere numerico.'
		set @message=@message+char(10)+char(13)+'    - La password deve contenere almeno un carattere minuscolo.'
		set @message=@message+char(10)+char(13)+'    - La password deve contenere almeno un carattere speciale #$@_-*%&.'
		set @codice_ritorno=1
		return 1
	end

	-- se inserimento password nuovo utente
	if @azione = 'I'
	begin
		set @codice_ritorno=1
		return 1
	end

	-- se modifica password utente
	if @azione = 'M'
	begin
		-- verifica cinque password precedenti
		select rep
		from   user_password
		where  rep=@usr_name and
           (pwdcompare(@usr_password, psw_1)=1 or
			pwdcompare(@usr_password, psw_2)=1 or 
			pwdcompare(@usr_password, psw_3)=1 or 
			pwdcompare(@usr_password, psw_4)=1 or 
			pwdcompare(@usr_password, psw_5)=1)

		if @@rowcount > 0 
		begin
			set @message='Password già utilizzata.'
			set @codice_ritorno=1
			return 1
		end

		-- aggiorna password
		update user_password
		set    psw_5 = psw_4,
               		psw_4 = psw_3,
               		psw_3 = psw_2,
               		psw_2 = psw_1,
               		psw_1 = pwdencrypt(@usr_password),
					data_mod = ltrim(rtrim(@DATAOGGI)), 
					data_scad = ltrim(rtrim(@DATA_23)),
					num_tentativo = 0
		where  rep=@usr_name
		set @message='Password modificata.'
		set @codice_ritorno=0
		return 0
	end

	set @codice_ritorno=0
	print  @codice_ritorno
	return 0
GO
