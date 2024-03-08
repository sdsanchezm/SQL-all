BULK INSERT TableName1
FROM 'C:\temp\theCSVFile.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    BATCHSIZE = 10000
);
