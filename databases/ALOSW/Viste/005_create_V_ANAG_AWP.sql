/****** Object:  View [dbo].[V_ANAG_AWP]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_ANAG_AWP] as
Select ParTipoScheda.TextTS as Modello_awp,'Comma6' as Tipo_awp,Identificativo as Cod_id_awp,
       BizLocali.Codice,ParGenerelocale.Descrizione as Tipologia_PV,
       BizLocali.Indirizzo as Indirizzo_PV,Bizlocali.Ind_CAP as CAP_PV,
       BizLocali.Ind_Prov as Provincia_PV,Bizlocali.telefono as Telefono_PV,
       Bizlocali.CodEsercente as Cod_esercente,BizSocieta.Codice as Cod_gestore,
       BizSocieta.RagioneSociale as Denominazione_gestore, 
       Data_riferimento = convert(varchar(10),getdate(),105)
FROM ((((BizDedicati LEFT JOIN Move ON BizDedicati.IdDedicato = Move.Dedicato)
      LEFT JOIN BizLocali ON Move.Locale = BizLocali.IdLocale)
      LEFT JOIN BizSocieta ON Bizsocieta.IdSocieta = BizDedicati.Prop)
      LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = BizDedicati.ParTipoScheda) 
      LEFT JOIN ParGenereLocale ON ParGenereLocale.IdPar = BizLocali.Genere 
WHERE BizDedicati.DataFine is Null AND IsC6a = 0 
UNION 
Select ParTipoScheda.TextTS as Modello_awp,'Comma6A' as Tipo_awp,Identificativo as Cod_id_awp,
       BizLocali.Codice,ParGenerelocale.Descrizione as Tipologia_PV,
       BizLocali.Indirizzo as Indirizzo_PV,Bizlocali.Ind_CAP as CAP_PV,
       BizLocali.Ind_Prov as Provincia_PV,Bizlocali.telefono as Telefono_PV,
       Bizlocali.CodEsercente as Cod_esercente,BizSocieta.Codice as Cod_gestore,
       BizSocieta.RagioneSociale as Denominazione_gestore,
       Data_riferimento = convert(varchar(10),getdate(),105)
FROM ((((BizDedicati LEFT JOIN Move ON BizDedicati.IdDedicato = Move.Dedicato)
     LEFT JOIN BizLocali ON Move.Locale = BizLocali.IdLocale)
     LEFT JOIN BizSocieta ON Bizsocieta.IdSocieta = BizDedicati.Prop)
     LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = BizDedicati.ParTipoScheda) 
     LEFT JOIN ParGenereLocale ON ParGenereLocale.IdPar = BizLocali.Genere 
WHERE BizDedicati.DataFine is Null AND IsC6a <> 0
GO
