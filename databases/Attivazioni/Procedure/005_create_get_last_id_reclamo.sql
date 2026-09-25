/****** Object:  StoredProcedure [dbo].[get_last_id_reclamo]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[get_last_id_reclamo]
	@id int output
AS
declare @temp_id int
declare @check int
begin
Select @temp_id=last_one 
from counter 
Where item='reclami'

set @check=0
while @check=0
begin
	Update counter 
	set last_one = @temp_id + 1
	Where item='reclami'
	and last_one = @temp_id
	IF @@ROWCOUNT > 0 set @check=1
end

if @@error=0 
begin
	select @id=@temp_id + 1 
	return 0
end
else
begin
	select @id=0
	return 1

end
end
GO
