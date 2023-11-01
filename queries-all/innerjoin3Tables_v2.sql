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
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2)
);


INSERT INTO customers (customer_id, customer_name, email)
VALUES
    (1, 'jamecho', 'jamecho@example.com'),
    (2, 'tiche', 'tiche@example.com'),
    (3, 'amparo', 'amparo@example.com'),
    (4, 'Jara', 'jara@example.com'),
    (5, 'marrana', 'marrana@example.com'),
    (6, 'nairo', 'nairo@example.com')

INSERT INTO products (product_id, product_name, unit_price)
VALUES
    (1, 'Chocorramo', 20.00),
    (2, 'Empanada', 15.00),
    (3, 'Ajiaco', 30.00),
    (4, 'Ducales', 25.00),
    (5, 'Pandebono', 35.00),
    (6, 'Carimanola', 18.00)

INSERT INTO orders (order_id, order_date, customer_id, product_id, quantity, total_amount)
VALUES
    (1, '2023-09-28', 1, 1, 2, 40.00),
    (2, '2023-09-29', 2, 3, 3, 90.00),
    (3, '2023-09-30', 3, 2, 1, 15.00),
    (4, '2023-09-30', 4, 4, 4, 100.00),
    (5, '2023-09-01', 5, 6, 2, 36.00),
    (6, '2023-09-02', 1, 5, 3, 10.00),
    (7, '2023-09-02', 1, 4, 2, 10.00),
    (8, '2023-09-02', 1, 3, 2, 10.00),
    (9, '2023-09-01', 1, 3, 1, 20.00),
    (10, '2023-09-01', 1, 3, 1, 30.00)


-- UPDATE
UPDATE orders
SET quantity = 0
WHERE product_id = 1;

-- validate
select * from customers;
select * from products;
select * from orders;


-- customers per product quantity
SELECT
    c.customer_name,
    p.product_name,
    SUM(quantity) as total_value
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    o.total_amount > 0
GROUP BY
    p.product_name
ORDER BY
    o.order_date DESC;


-- customers per product quantity
SELECT
    c.customer_name,
    p.product_name,
    SUM(quantity) as total_value
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    o.total_amount > 0
GROUP BY
    p.product_name
ORDER BY
    total_value DESC;


-- products not sold yet
SELECT
    c.customer_name,
    p.product_name,
    SUM(quantity) as total_value
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    o.quantity = 0
GROUP BY
    p.product_name
ORDER BY
    total_value DESC;


-- total number of products, HAVING more than 1
SELECT
	c.customer_id,
    c.customer_name,
    p.product_name,
    SUM(quantity) as total_value
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    c.customer_id > 0
GROUP BY
    c.customer_name, p.product_name
HAVING
	COUNT(c.customer_name) > 0
ORDER BY
    total_value DESC


-- total number of products, using a ranking function
SELECT
	c.customer_id,
    c.customer_name,
    p.product_name,
    SUM(quantity) as total_value,
    RANK() OVER (ORDER BY c.customer_name DESC) as rank_here
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    c.customer_id > 0
GROUP BY
    c.customer_name
HAVING
	COUNT(c.customer_name) > 0
ORDER BY
    rank_here ASC


-- Rank by product  name, based on customer name
SELECT
	c.customer_id,
    c.customer_name,
    p.product_name,
    SUM(quantity) as total_value,
    RANK() OVER (ORDER BY c.customer_name ASC) as rank_customName,
    RANK() OVER (PARTITION BY c.customer_name ORDER BY p.product_name ASC) as rank_ProdName
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    c.customer_id > 0
GROUP BY
    c.customer_name, p.product_name
HAVING
	COUNT(c.customer_name) > 0
ORDER BY
    c.customer_name ASC


-- Expression ORDER BY the Ranking
SELECT
	c.customer_id,
    c.customer_name,
    p.product_name,
    o.quantity * p.unit_price as K1_price,
    SUM(quantity) as total_value,
    RANK() OVER (ORDER BY c.customer_name ASC) as rank_customName,
    RANK() OVER (PARTITION BY c.customer_name ORDER BY p.unit_price * o.quantity ASC) as rank_Tot
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    c.customer_id > 0
GROUP BY
    c.customer_name, p.product_name
HAVING
	COUNT(c.customer_name) > 0
ORDER BY
    c.customer_name ASC


-- DENSE_RANK()
-- ROW_NUMBER()
SELECT
	c.customer_id,
    c.customer_name,
    p.product_name,
    o.quantity * p.unit_price as K1_price,
    SUM(quantity) as total_value,
    RANK() OVER (ORDER BY c.customer_name ASC, c.customer_id) as rank_k1,
    RANK() OVER (PARTITION BY c.customer_name ORDER BY p.unit_price * o.quantity ASC) as k2,
    ROW_NUMBER() OVER (PARTITION BY c.customer_name ORDER BY p.unit_price * o.quantity ASC) as k3,
    DENSE_RANK() OVER (ORDER BY K1_price) as k4
FROM
    orders o
INNER JOIN
    customers c ON o.customer_id = c.customer_id
INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    c.customer_id > 0
GROUP BY
    c.customer_name, p.product_name
HAVING
	COUNT(c.customer_name) > 0
ORDER BY
    c.customer_name ASC

