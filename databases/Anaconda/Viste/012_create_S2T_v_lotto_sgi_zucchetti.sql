/****** Object:  View [dbo].[S2T_v_lotto_sgi_zucchetti]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[S2T_v_lotto_sgi_zucchetti] as 
select a.codice_lotto, 
	   a.codice_sgi, 
	   a.codice_zucchetti_cliente,
	   a.codice_zucchetti_cliente_numerico,
	   b.codice_zucchetti_pos,
	   b.codice_zucchetti_pos_numerico,
	   b.ultima_carta
from S2T_zucchetti_cliente a, S2T_zucchetti_pos b
where a.codice_lotto = b.codice_lotto
GO
