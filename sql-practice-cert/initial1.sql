-- First try

SELECT TOP (1000) [id]
      ,[username]
  FROM [test3].[dbo].[user]


DROP TABLE IF EXISTS records1;

CREATE TABLE records1 (
  id int NOT NULL,
  name1 varchar(50) NULL,
  code1 varchar(20) NULL,
  PRIMARY KEY (id)
)

  DECLARE @Records TABLE (
    ID INT,
    Column2 VARCHAR(255),
    Column3 VARCHAR(255)
);


-- Second Try

DROP TABLE IF EXISTS `records1`;

CREATE TABLE records1 (
  id int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(50) NOT NULL,
  `appyear` year(4) NOT NULL,
  PRIMARY KEY (`id`)
)

-- Thrird Try

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
