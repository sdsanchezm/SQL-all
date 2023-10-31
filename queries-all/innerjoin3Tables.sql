-- create tables here
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

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(255),
    quantity INT,
    unit_price DECIMAL(10, 2)
);


-- inser data
INSERT INTO customers (customer_id, customer_name, email) VALUES
(1, 'Jamecho', 'jamecho@example.com'),
(2, 'Jara', 'jara@example.com'),
(3, 'Amparo', 'amparo@example.com'),
(4, 'Azabache', 'azabache@example.com'),
(5, 'tiche', 'tiche@example.com'),
(6, 'Marrana', 'marrana@example.com')

INSERT INTO orders (order_id, order_date, customer_id, total_amount) VALUES
(1, '2023-10-01', 1, 100.00),
(2, '2023-10-02', 2, 150.00),
(3, '2023-10-03', 3, 90.00),
(4, '2023-10-03', 1, 100.00),
(5, '2023-10-03', 1, 50.00),
(6, '2023-10-03', 2, 30.00)

INSERT INTO order_items (order_item_id, order_id, product_name, quantity, unit_price) VALUES
(1, 1, 'Chocorramo', 2, 25.00),
(2, 2, 'Tostaco', 3, 20.00),
(3, 3, 'Empanada', 2, 30.00),
(4, 1, 'Tamal', 2, 30.00),
(5, 1, 'Ajiaco', 1, 60.00)


-- validate
select * from customers;
select * from orders;
select * from order_items;


-- query 1
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.email,
    SUM(oi.quantity * oi.unit_price) AS total_order_amount
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.total_amount > 20
    AND o.order_id > 10
GROUP BY
    o.order_date
ORDER BY
    o.order_date DESC;


-- query 2
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.email,
    SUM(oi.quantity * oi.unit_price) AS total_order_amount
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.total_amount > 0
GROUP BY
    o.order_date
ORDER BY
    o.order_date DESC;


    -- query 3
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.email,
    SUM(oi.quantity * oi.unit_price) AS total_order_amount,
    SUM(oi.quantity) AS total_units
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    order_items oi ON o.order_id = oi.order_id
WHERE
    o.total_amount > 0
GROUP BY
    o.order_date
ORDER BY
    o.order_date DESC;


-- query 4
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    oi.product_name
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    order_items oi ON o.order_id = oi.order_id
ORDER BY
    o.order_date DESC;
