/****** Object:  StoredProcedure [dbo].[CARICA_CONFIDA_TRIS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 	SCOPO:		Carica la tabella POSIZIONE_TRIS
	DATA RILASCIO :	Marzo 2002
	SCRITTA DA : 		Fabrizio Giovanni Nunziante
*/

CREATE PROCEDURE [dbo].[CARICA_CONFIDA_TRIS] AS

DECLARE 	
		@ric char(6), 
		@dataorak char(16), 
		@cognome char(25), 
		@nome char(25), 
		@telefono char(12), 
		@dataval char(8), 
		@dataContratto char(8),

		@dataServizio char(8),
		@Aps char(1),
		@fidNow char(4),

		@ricOLD char(6),
		@dataorakOLD char(16),
		@cognomeOLD char(25),
		@nomeOLD char(25),
		@telefonoOLD char(12),
		@datavalOLD char(8),
		@dataContrattoOLD char(8),
		
		@dataServizioOLD char(8),
		@fidNowOLD char(4),
		@ApsOLD char(1),

		@dataNewTit char(8),
		@anno char(4)


select @anno=convert(char(4),getdate(),112)

declare tit_cursor cursor for
	SELECT lsrtit.lsrtit_key_id_ricev, lsrtit.lsrtit_key_data_ins + lsrtit.lsrtit_key_ora_ins AS keytit,
	     lsrtit.lsrtit_cognome, lsrtit.lsrtit_nome, lsrtit.lsrtit_telefono, lsrtit.lsrtit_data_validita, 
	    lsrcon_Tris.lsrcon_Tris_data_contratto, lsraps_Tris.lsraps_Tris_aut_ps, lsrfid_Tris.lsrfid_Tris_anno_rif
	FROM lsrtit 
	LEFT OUTER JOIN lsraps_Tris 
	ON lsrtit.lsrtit_key_id_ricev = lsraps_Tris.lsraps_Tris_key_id_ricev
	AND (lsraps_Tris.lsraps_Tris_fk_data_ins_tit + lsraps_Tris.lsraps_Tris_fk_ora_ins_tit = dbo.lsrtit.lsrtit_key_data_ins + dbo.lsrtit.lsrtit_key_ora_ins)
	LEFT OUTER JOIN lsrcon_Tris
	ON lsrtit.lsrtit_key_id_ricev = lsrcon_Tris.lsrcon_Tris_key_id_ricev
	AND (lsrcon_Tris.lsrcon_Tris_fk_data_ins_tit + lsrcon_Tris.lsrcon_Tris_fk_ora_ins_tit = dbo.lsrtit.lsrtit_key_data_ins + dbo.lsrtit.lsrtit_key_ora_ins)
	LEFT OUTER JOIN lsrfid_Tris
	ON lsrtit.lsrtit_key_id_ricev = lsrfid_Tris.lsrfid_Tris_key_id_ricev
	AND (lsrfid_Tris.lsrfid_Tris_fk_data_ins_tit + lsrfid_Tris.lsrfid_Tris_fk_ora_ins_tit = dbo.lsrtit.lsrtit_key_data_ins + dbo.lsrtit.lsrtit_key_ora_ins)
	AND (lsrfid_Tris.lsrfid_Tris_anno_rif = @anno)
	WHERE (lsrtit.lsrtit_flag_validita = 'Y')
	--AND (lsrtit.lsrtit_key_id_ricev = 'BA0059')
	ORDER BY lsrtit.lsrtit_key_id_ricev, lsrtit.lsrtit_data_validita

open tit_cursor

fetch next from tit_cursor
into @ric, @dataorak , @cognome, @nome, @telefono, @dataval, @dataContratto, @Aps, @fidNow

select @ricOLD = @ric
select @dataorakOLD = @dataorak
select @cognomeOLD = @cognome
select @nomeOLD = @nome
select @telefonoOLD = @telefono
select @datavalOLD = @dataval
select @dataContrattoOLD = @dataContratto
select @dataServizioOLD = @dataServizio
select @ApsOLD = @Aps
select @fidNowOLD = @fidNow

truncate table ConFidA_Tris

while @@fetch_status=0
begin

	if @ric<> @ricOLD
	begin

		select @dataNewTit = convert(char(8),getdate(),112)
		select @dataServizioOLD = lsrser_tris_data_decor
		from lsrser_tris 
		where lsrser_tris_flag_validita = 'Y' 
		and lsrser_tris_key_id_ricev = @ricOLD
		and lsrser_tris_stato = '1'
		and lsrser_tris_data_decor = (select max(a.lsrser_tris_data_decor) 
			from lsrser_tris a
			where a.lsrser_tris_flag_validita = 'Y' 
			and a.lsrser_tris_key_id_ricev = @ricOLD
			and a.lsrser_tris_stato = '1'
			and a.lsrser_tris_data_decor between @datavalOLD and @dataNewTit)
/*
		select @anno=convert(char(4),getdate(),112)
		select @fidnowOLD = ''
		select @fidNowOLD=lsrfid_Tris_anno_rif from lsrfid_tris where lsrfid_tris_key_id_ricev = @ricOLD
		and lsrfid_Tris_fk_data_ins_tit + lsrfid_Tris_fk_ora_ins_tit = @dataorakOLD
		and lsrfid_Tris_anno_rif = @anno
		select @anno = @anno - 1
		select @fidprecOLD = ''
		select @fidPrecOLD=lsrfid_Tris_anno_rif from lsrfid_tris where lsrfid_tris_key_id_ricev = @ricOLD
		and lsrfid_Tris_fk_data_ins_tit + lsrfid_Tris_fk_ora_ins_tit = @dataorakOLD
		and lsrfid_Tris_anno_rif = @anno
*/
		insert into ConFidA_Tris values(@ricOLD, @cognomeOLD, @nomeOLD, @telefonoOLD, @datavalOLD, @dataContrattoOLD, @dataServizioOLD, @fidNowOLD, @ApsOLD)

		select @ricOLD = @ric
		select @dataorakOLD = @dataorak
		select @cognomeOLD = @cognome
		select @nomeOLD = @nome
		select @telefonoOLD = @telefono
		select @datavalOLD = @dataval
		select @dataContrattoOLD = @dataContratto
		select @ApsOLD = @Aps
		select @fidNowOLD = @fidNow
		select @dataServizioOLD = ''
	end

		if @dataorak <> @dataorakold 
		begin 
			select @dataNewTit = @dataval
			select @dataServizioOLD = lsrser_tris_data_decor
			from lsrser_tris 
			where lsrser_tris_flag_validita = 'Y' 
			and lsrser_tris_key_id_ricev = @ricOLD
			and lsrser_tris_stato = '1'
			and lsrser_tris_data_decor = (select max(a.lsrser_tris_data_decor) 
				from lsrser_tris a
				where a.lsrser_tris_flag_validita = 'Y' 
				and a.lsrser_tris_key_id_ricev = @ricOLD
				and a.lsrser_tris_stato = '1'
				and a.lsrser_tris_data_decor between @datavalOLD and @dataNewTit)
/*
			select @anno=convert(char(4),getdate(),112)
			select @fidnowOLD = ''
			select @fidNowOLD=lsrfid_Tris_anno_rif from lsrfid_tris where lsrfid_tris_key_id_ricev = @ricOLD
			and lsrfid_Tris_fk_data_ins_tit + lsrfid_Tris_fk_ora_ins_tit = @dataorakOLD
			and lsrfid_Tris_anno_rif = @anno

			select @anno = @anno - 1
			select @fidprecOLD = ''
			select @fidPrecOLD=lsrfid_Tris_anno_rif from lsrfid_tris where lsrfid_tris_key_id_ricev = @ricOLD
			and lsrfid_Tris_fk_data_ins_tit + lsrfid_Tris_fk_ora_ins_tit = @dataorakOLD
			and lsrfid_Tris_anno_rif = @anno
*/
			insert into ConFidA_Tris values(@ricOLD, @cognomeOLD, @nomeOLD, @telefonoOLD, @datavalOLD, @dataContrattoOLD, @dataServizioOLD, @fidNowOLD, @ApsOLD)

			select @ricOLD = @ric
			select @dataorakOLD = @dataorak
			select @cognomeOLD = @cognome
			select @nomeOLD = @nome
			select @telefonoOLD = @telefono
			select @datavalOLD = @dataval
			select @dataContrattoOLD = @dataContratto
			select @ApsOLD = @Aps
			select @fidNowOLD = @fidNow
			select @dataServizioOLD = ''
		end

	fetch next from tit_cursor
	into @ric, @dataorak , @cognome, @nome, @telefono, @dataval, @dataContratto, @Aps, @fidNow

end

select @dataNewTit = convert(char(8),getdate(),112)
select @dataServizioOLD = lsrser_tris_data_decor
from lsrser_tris 
where lsrser_tris_flag_validita = 'Y' 
and lsrser_tris_key_id_ricev = @ricOLD
and lsrser_tris_stato = '1'
and lsrser_tris_data_decor = (select max(a.lsrser_tris_data_decor) 
	from lsrser_tris a
	where a.lsrser_tris_flag_validita = 'Y' 
	and a.lsrser_tris_key_id_ricev = @ricOLD
	and a.lsrser_tris_stato = '1'
	and a.lsrser_tris_data_decor between @datavalOLD and @dataNewTit)
/*
select @anno=convert(char(4),getdate(),112)
select @fidnowOLD = ''
select @fidNowOLD=lsrfid_Tris_anno_rif from lsrfid_tris where lsrfid_tris_key_id_ricev = @ricOLD
and lsrfid_Tris_fk_data_ins_tit + lsrfid_Tris_fk_ora_ins_tit = @dataorakOLD
and lsrfid_Tris_anno_rif = @anno

select @anno = @anno - 1
select @fidprecOLD = ''
select @fidPrecOLD=lsrfid_Tris_anno_rif from lsrfid_tris where lsrfid_tris_key_id_ricev = @ricOLD
and lsrfid_Tris_fk_data_ins_tit + lsrfid_Tris_fk_ora_ins_tit = @dataorakOLD
and lsrfid_Tris_anno_rif = @anno
*/
insert into ConFidA_Tris values(@ricOLD, @cognomeOLD, @nomeOLD, @telefonoOLD, @datavalOLD, @dataContrattoOLD, @dataServizioOLD, @fidNowOLD, @ApsOLD)

close tit_cursor
deallocate tit_cursor
GO
