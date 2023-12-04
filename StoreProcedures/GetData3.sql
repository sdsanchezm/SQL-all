create procedure dbo.spExamData_GetData3
	@name1 nvarchar(10),
    @number int
as
begin
	select ExamNumber, ExamName, ExamId, ExamPlace
	from dbo.Labexam
	where ExamName = @name1
        and ExamNumber = @number;
end


-- to call it
-- exec dbo.spExamData_GetData3 @name1 = 'Griba8'
-- exec dbo.spExamData_GetData3 'Griba8', 221188

