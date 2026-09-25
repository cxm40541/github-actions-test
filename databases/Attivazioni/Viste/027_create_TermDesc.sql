/****** Object:  View [dbo].[TermDesc]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  View dbo.TermDesc    Script Date: 13/02/2002 15.45.20 ******/
create view [dbo].[TermDesc] as
select cod_appar,id_piano,a.cod_tipo_appar,data_valid,matricola,note,tecnici,desc_tipo_appar 
from apparecchiature a, codici_tipo_appar b
where a.cod_tipo_appar=b.cod_tipo_appar
GO
