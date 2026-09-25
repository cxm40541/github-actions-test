/****** Object:  View [dbo].[sv_inquiry]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sv_inquiry] as
(
select * from [sql-dbsan2\b].PSS.dbo.sv_inquiry 
where 
category1= 'Problema'
)
GO
