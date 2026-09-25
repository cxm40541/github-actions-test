/****** Object:  Default [DF_S2T_zucchetti_cliente_dataoracreazione]    Script Date: 11/17/2025 15:18:29 ******/
ALTER TABLE [dbo].[S2T_zucchetti_cliente] ADD  CONSTRAINT [DF_S2T_zucchetti_cliente_dataoracreazione]  DEFAULT (getdate()) FOR [dataoracreazione]
GO
