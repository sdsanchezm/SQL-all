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



### References and nice sources:
[^1]: [Nice Reference](https://learnsql.com/blog/how-to-join-3-tables-or-more-in-sql)