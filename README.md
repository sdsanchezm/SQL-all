# SQL-all
Database Practice and tracking learning process and applications

## Join examples:

- 3 tables join[^1]

```SELECT
  table1.first_n,
  table1.last_n,
  table2.usern
FROM table1
JOIN table2
  ON table1.id = table2.table2_id
JOIN table3
  ON table3.id = table2.table2_id;
  ```
- 


- 3 Tables join example:

```SELECT questionset.id, questionset.questionset_question, responseSet.response, count(responseSet.response),  responseSet.token
FROM questionset
JOIN responseSet
ON responseSet.questionId = questionset.id
WHERE responseSet.questionid = item
AND responseSet.token = token
GROUP BY responseSet.response;
```

## SQL COUNT(), AVG() and SUM()

- count function():

```
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
```

- avg() function:
```
SELECT AVG(column1)
FROM table1
WHERE condition;
```

- Sum function:
```
SELECT SUM(column1)
FROM table1
WHERE condition;
```


- Basic Join 2 tables:
```
SELECT
  table1.first_name,
  table1.last_name,
  table1.id,
  table2.table1_id,
  table2.name,
  table2.id
FROM table1
JOIN table2
  ON table1.id = table2.table1_id;
 ```


## MariaDB in F36

- install
  - `dnf install mariadb-server mariadb`
  - `sudo systemctl start mariadb`
  - `sudo mysql_secure_installation`


### MySQL and Maria DB Store Procedures

- to delete A STORE PROCEDURE
```sql
USE sales_virginia;
DELETE PROCEDURE calculate_distance_between_sections;
```

- To read/load a Store procedure
```SQL
mysql -u user33 -p < sp_distance_between_sections.sql
```

- Db start session
```SQL
mysql  -u user33 -p
```

- Use/Call the store procedure
```SQL
USE sales_virginia;
CALL sp_distance_between_sections( POINT(-58.23344567, -48.43311321), POINT(-98.54466767, -78.87766765), false);
```

```SQL
USE sales_florida;

DELIMITER //
CREATE PROCEDURE sp_distance_between_sections(
    IN section_first POINT,
    IN section_second POINT,
    IN in_meters BOOLEAN
)
BEGIN

    IF in_meters THEN

        SELECT
        ST_Distance_Sphere(section_first, section_second) AS distances;

    ELSE

        SELECT
        ST_Distance_Sphere(section_first, section_second) / 1000 AS distances;

    END IF;

END //

DELIMITER ;
```

- Another example grabbing data from a table

```sql
USE sales_virginia;

DELIMITER //
CREATE PROCEDURE sp_calculate_line_distance(IN saleName1 VARCHAR(50), IN saleName2 VARCHAR(50), IN in_meters BOOLEAN)
BEGIN
    DECLARE response FLOAT;
    SET response = (
        SELECT ST_Distance_Sphere(
            (
                SELECT `locations`.`location`
                FROM `locations`
                INNER JOIN `sales`
                ON `sales`.`id` = `locations`.`sale_id`
                WHERE `sales`.`name` COLLATE utf8mb4_unicode_ci = saleName1
            ),
             (
                SELECT `locations`.`location`
                FROM `locations`
                INNER JOIN `sales`
                ON `sales`.`id` = `locations`.`sale_id`
                WHERE `sales`.`name` COLLATE utf8mb4_unicode_ci = saleName2
             )
        ) AS distances
    );
    IF in_meters THEN
        SET response = (response/1000);
    END IF;
    SELECT response;
END //
```

### MySQL and MariaDB Prepared Statements


```SQL
USE sales_florida;

DELIMITER //
CREATE PROCEDURE get_sale_sections(
    IN section_name VARCHAR(15)
)
BEGIN

	-- this is a way of saving values of a query in a variable
    DECLARE section_id BIGINT(20);

    SELECT id
    INTO section_id
    FROM `sales_florida`
    WHERE name = section_name
    COLLATE utf8mb4_unicode_ci;

	-- this is another way to save values from a query in a variable

    SET @sql = CONCAT("
        SELECT
            `section_florida`.`id` AS relation_id,
            `section`.`name` AS section_name,
            `section`.`name` AS section_name
        FROM `sales_florida`
        INNER JOIN `sections`
        ON `sections`.`id` = `sales_florida`.`section_id`
        INNER JOIN `sales`
        ON `sales_florida`.`id` = `sales_florida`.`sale_id`
        WHERE `sales_florida`.`sale_id` = ", sale_id);

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;
```

- Use/Call the prepared statement
```SQL
USE sales_florida;
CALL get_sale_sections("bocaraton");
```

### MySQL and Maria DB Triggers

```SQL
USE sales_virginia;

CREATE TRIGGER update_sales_at_field
BEFORE UPDATE
ON `sales_virginia`
FOR EACH ROW
SET NEW.updated_at = NOW();
```

- equivalent with no triggers

```SQL
ALTER TABLE `sales_virginia`
	CHANGE COLUMN `updated_at` `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `created_at`;
```

## T-SQL documentation from Microsoft

- [https://learn.microsoft.com/en-us/sql/t-sql/queries/queries?view=sql-server-ver16]



### References and nice sources:
[^1]: [Nice Reference](https://learnsql.com/blog/how-to-join-3-tables-or-more-in-sql)