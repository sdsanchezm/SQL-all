# SQL-all
Database Practice and tracking learning process and applications

## Join examples tables join[^1]

1. Join default

    ```sql
    SELECT
    table1.first_n,
    table1.last_n,
    table2.usern
    FROM table1
    JOIN table2
    ON table1.id = table2.table2_id
    JOIN table3
    ON table3.id = table2.table2_id;
    ```

- 3 tables join

    ```sql
    SELECT questionset.id, questionset.questionset_question, responseSet.response, count(responseSet.response),  responseSet.token
    FROM questionset
    JOIN responseSet
    ON responseSet.questionId = questionset.id
    WHERE responseSet.questionid = item
    AND responseSet.token = token
    GROUP BY responseSet.response;
    ```

## SQL COUNT(), AVG() and SUM()

- example

    ```sql
    select COUNT(column_name)
    FROM table_name
    WHERE condition;
    ```

- example

    ```sql
    select avg(column1)
    FROM table1
    WHERE condition;
    ```

- example

    ```sql
    select sum(column1)
    FROM table1
    WHERE condition;
    ```

- example
    ```sql
    Basic Join 2 tables first_name,
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

    ```bash
    mysql -u user33 -p < sp_distance_between_sections.sql
    ```

- Db start session

    ```
    mysql  -u user33 -p
    ```

- Use/Call the store procedure

    ```sql
    USE sales_virginia;
    CALL sp_distance_between_sections( POINT(-58.23344567, -48.43311321), POINT(-98.54466767, -78.87766765), false);
    ```

    ```sql
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

- Prepared Statements 

    ```sql
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

- [https com/en-us/sql/t-sql/queries/queries?view=sql-server-ver16]


## Summary for the course

1. `SELECT` data 

   ```sql
   SELECT * FROM customers;
   ```

2. `SELECT DISTINCT` values

   ```sql
   SELECT DISTINCT city FROM customers;
   ```

3. `WHERE` filter records based on a specific condition

   ```sql
   SELECT * FROM customers WHERE country = 'USA';
   ```

4. `AND, OR` combine conditions in a `WHERE`

   ```sql
   SELECT * FROM products WHERE category = 'Electronics' AND price > 500;
   ```

5. `NOW` current date and time

   ```sql
   SELECT NOW();
   ```

6. `ORDER BY` used to sort the result ascending `ASC` or descending `DESC`

   ```sql
   SELECT * FROM products ORDER BY price DESC;
   ```

7. `INSERT INTO` insert records

   ```sql
   INSERT INTO customers (name, email) VALUES ('Jamecho Sanc', 'jamecho@example.com');
   ```

8. `NULL VALUES` jsut the null data

   ```sql
   INSERT INTO employees (name, age) VALUES ('Jamecho Sanc', NULL);
   ```

9. `UPDATE` modify existing records

   ```sql
   UPDATE products SET price = 599.99 WHERE id = 123;
   ```

10. `DELETE` delete records

    ```sql
    DELETE FROM customers WHERE id = 456;
    ```

11. `SELECT TOP` feature is not avail in MySQL, gotta use `LIMIT` instead

    ```sql
    SELECT * FROM orders LIMIT 5;
    ```

12. `MIN and MAX` return the min and max values respectively

    ```sql
    SELECT MIN(price) AS min_price, MAX(price) AS max_price FROM products;
    ```

13. `COUNT, AVG, SUM` aggregate functions to count, to calcule averages, and and to sum 

    ```sql
    SELECT COUNT(*) AS total_customers FROM customers;
    SELECT AVG(price) AS avg_price FROM products;
    SELECT SUM(quantity) AS total_quantity FROM orders;
    ```

14. `LIKE` used in a `WHERE` to search for specific patterns in a column

    ```sql
    SELECT * FROM products WHERE name LIKE 'App%';
    ```

15. `Wildcards` such as `LIKE` uses wildcards like `%` (that matches any string with 0 or more chars). The `_` matches any single character

    ```sql
    SELECT * FROM products WHERE name LIKE 'iPhone%';
    ```

16. `IN` allows to specify multiple values in a `WHERE`

    ```sql
    SELECT * FROM products WHERE category IN ('Electronics', 'Clothing');
    ```

17. `BETWEEN` used to filter the result set within a range

    ```sql
    SELECT * FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';
    ```

18. `Aliases` temporary names assigned to columns or tables in a query

    ```sql
    SELECT name AS product_name, price AS unit_price FROM products;
    ```

19. `Create Database (CREATE DATABASE)` used to create a new database

   ```sql
   CREATE DATABASE my_database;
   ```

20. `Drop Database (DROP DATABASE)` used to delete an existing database

   ```sql
   DROP DATABASE my_database;
   ```

21. `Backup Database` multiple methods for database backup - `mysqldump` is one - or like MySQL Workbench

22. `Create Table (CREATE TABLE)` used to create a new table within a database

   ```sql
   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(50) NOT NULL,
       email VARCHAR(100) UNIQUE,
       age INT,
       city VARCHAR(50)
   );
   ```

23. `Drop Table (DROP TABLE)` delete an existing table from the database

   ```sql
   DROP TABLE users;
   ```

24. `Alter Table (ALTER TABLE)` modify an existing table structure

   ```sql
   ALTER TABLE users ADD COLUMN gender ENUM('Male', 'Female');
   ```

25. `Constraints` used to enforce data columns to maintain integrity and accuracy of the data

26. `NOT NULL` indicates that a column cannot contain NULL values

   ```sql
   CREATE TABLE products (
       id INT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       price DECIMAL(10, 2) NOT NULL
   );
   ```

27. `UNIQUE` values in a column are unique

   ```sql
   CREATE TABLE employees (
       id INT PRIMARY KEY,
       email VARCHAR(100) UNIQUE,
       name VARCHAR(100)
   );
   ```

28. `Primary Key` identifies each record in a table - each table can have only one primary key

    ```sql
    CREATE TABLE orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE,
        total_amount DECIMAL(10, 2)
    );
    ```

29. `Foreign Key`used to create a relation between 2 tables - referential integrity between tables

    ```sql
    CREATE TABLE orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        FOREIGN KEY (customer_id) REFERENCES customers(id)
    );
    ```


### References and nice sources

 [^1]: [Nice Reference](https://learnsql.com/blog/how-to-join-3-tables-or-more-in-sql)
