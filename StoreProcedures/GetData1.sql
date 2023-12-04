create procedure dbo.spExamData_GetData2
as
begin
	select ExamNumber, ExamName, ExamId, ExamPlace
	from dbo.Labexam
end

-- to Call:
-- exec dbo.spExamData_GetData2


-- to alter:
alter procedure dbo.spExamData_GetData2
as
begin
	set nocount on; -- hides the count of rows

	select ExamNumber, ExamName, ExamId, ExamPlace
	from dbo.Labexam
end


