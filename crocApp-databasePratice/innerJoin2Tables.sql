
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

INSERT INTO customers (customer_id, customer_name, email)
VALUES
    (1, 'Jamecho Sanc', 'jamecho@example.com'),
    (2, 'Tiche Sanc', 'tiche@example.com');

INSERT INTO orders (order_id, order_date, customer_id, total_amount)
VALUES
    (101, '2017-11-21', 1, 100.50),
    (102, '2018-11-22', 2, 75.25),
    (103, '2017-11-23', 1, 50.75);


SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.email,
    o.total_amount
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id;

SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.email,
    o.total_amount
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    o.total_amount > 20
    AND o.order_id > 10
ORDER BY
    o.order_id DESC;

SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.email,
    o.total_amount
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    o.total_amount > 20
    AND o.order_id > 10
GROUP BY
    o.order_date
ORDER BY
    o.order_date DESC;
