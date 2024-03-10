CREATE PROCEDURE InsertRecord 
    @param1 INT,
    @param2 VARCHAR(255),
    @param3 VARCHAR(255)
AS
BEGIN
    DECLARE @inserted_id INT;

    INSERT INTO dbo.records1 (id, name1, code1)
    VALUES (@param1, @param2, @param3);

    SET @inserted_id = SCOPE_IDENTITY();

    SELECT @inserted_id AS inserted_id;
END;


EXEC InsertRecord @param1 = 6, @param2 = 'asdasd', @param3 = 'QQAAZZ';
