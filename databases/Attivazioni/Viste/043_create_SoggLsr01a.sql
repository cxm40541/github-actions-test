/****** Object:  View [dbo].[SoggLsr01a]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.SoggLsr01a    Script Date: 13/02/2002 15.45.19 ******/
CREATE VIEW [dbo].[SoggLsr01a] AS 
SELECT LTRIM(RTRIM(a.id_soggetto)) as id_soggetto, a.id_piano, 
  CONVERT(CHAR(10), b.data_in_gioco, 103) as Data,
  c.lsr01a_cod_amm,c.lsr01a_cognome, 
  c.lsr01a_nome, c.lsr01a_stato, c.lsr01a_flag_esercizio
  ,LTRIM(RTRIM(SUBSTRING(d.cod_appar,3,10))) as ter
FROM soggetti_del_piano AS a 
  LEFT OUTER JOIN soggetti_in_gestione AS b
  ON a.id_soggetto = b.id_soggetto
  and  a.id_piano = b.id_piano   
  LEFT OUTER JOIN condiviso.dbo.lsr01a AS c
  ON (a.id_soggetto = c.lsr01a_key_id_ricev)
  LEFT OUTER JOIN stato_avanzamento AS d
  ON a.id_soggetto = d.id_soggetto
  and  a.id_piano = d.id_piano,   
  piani as e ,legenda as f
  WHERE e.tipo_piano = f.tipo_piano
  and d.id_attivita = f.cod_attivita
  and d.cod_avanzamento=f.cod_avanzamento 
  and e.id_piano=a.id_piano
  and f.id_record=19
GO
