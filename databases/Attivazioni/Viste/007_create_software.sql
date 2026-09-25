/****** Object:  View [dbo].[software]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[software] as
(
select *
from postazioni.dbo.LSR_SW_TERM
where Data_ins=
(select max(data_ins) from postazioni.dbo.LSR_SW_TERM))
GO
