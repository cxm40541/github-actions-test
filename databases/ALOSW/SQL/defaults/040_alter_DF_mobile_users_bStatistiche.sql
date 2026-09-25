/****** Object:  Default [DF_mobile_users_bStatistiche]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[mobile_users] ADD  CONSTRAINT [DF_mobile_users_bStatistiche]  DEFAULT ((0)) FOR [bStatistiche]
GO
