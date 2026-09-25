/****** Object:  View [dbo].[sv_inquiry_audit]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[sv_inquiry_audit] as
(
select b.inquiry_id,b.ia_action,b.entered_by,b.action_dt,b.new_value,b.old_value 
from [sql-dbsan2\b].PSS.dbo.sv_inquiry a ,[sql-dbsan2\b].PSS.dbo.sv_inquiry_audit b  
where 
a.category1= 'Problema'
and a.inquiry_id = b.inquiry_id
)
GO
