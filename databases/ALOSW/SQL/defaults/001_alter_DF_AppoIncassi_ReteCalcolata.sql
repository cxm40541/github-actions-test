/****** Object:  Default [DF_AppoIncassi_ReteCalcolata]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[AppoIncassi] ADD  CONSTRAINT [DF_AppoIncassi_ReteCalcolata]  DEFAULT ((0)) FOR [ReteCalcolata]
GO
