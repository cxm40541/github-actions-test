/****** Object:  View [dbo].[V_TAB_SCASSETTAMENTI]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_TAB_SCASSETTAMENTI] as

select ParTipoScheda.TextTS as Modello_awp,'Comma6' as Tipo_awp,
       bizDedicati.Identificativo as Cod_id_awp,Contatore1 as CNTTOTIN,Contatore2 as CNTTOTOT,
       Incassi.Data as Data_Scassettamento 
from (Incassi LEFT JOIN bizdedicati ON bizdedicati.IdDedicato = Incassi.CodiceOggetto)
      LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = bizDedicati.ParTipoScheda  
where IsC6a = 0
UNION 
select ParTipoScheda.TextTS as Modello_awp,'Comma6A' as Tipo_awp,
       bizDedicati.Identificativo as Cod_id_awp,Contatore1 as CNTTOTIN,Contatore2 as CNTTOTOT,
       Incassi.Data as Data_Scassettamento 
from (Incassi LEFT JOIN bizdedicati ON bizdedicati.IdDedicato = Incassi.CodiceOggetto)
      LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = bizDedicati.ParTipoScheda 
where IsC6a <> 0
GO
