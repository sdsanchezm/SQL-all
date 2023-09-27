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

