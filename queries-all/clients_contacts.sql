CREATE TABLE client (
    id INT PRIMARY KEY,
    clientName VARCHAR(255),
    cityId VARCHAR(255),
    clientAddress VARCHAR(255),
    contactPerson VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255),
    is_active BOOLEAN
);

CREATE TABLE user (
    id INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    userName VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255),
    is_active BOOLEAN
);

CREATE TABLE contact (
    id INT PRIMARY KEY,
    user_id INT,
    client_id INT,
    contact_type_id INT,
    contact_outcome_id INT,
    additionalComment VARCHAR(255),
    initiated_by_client BOOLEAN,
    initiated_by_user BOOLEAN
);

-- if 'user' and 'client' tables have relationships with the 'contact' table:
-- ALTER TABLE contact ADD FOREIGN KEY (user_id) REFERENCES user(id);
-- ALTER TABLE contact ADD FOREIGN KEY (client_id) REFERENCES client(id);
-- ALTER TABLE contact ADD FOREIGN KEY (contact_type_id) REFERENCES contact_type(id);
-- ALTER TABLE contact ADD FOREIGN KEY (contact_outcome_id) REFERENCES contact_outcome(id);


INSERT INTO client (id, clientName, cityId, clientAddress, contactPerson, email, phone, is_active)
VALUES
    (1, 'client 1', 'City 1', 'Address 1', 'Contact Person 1', 'client1@example.com', '123-456-7890', true),
    (2, 'client 2', 'City 2', 'Address 2', 'Contact Person 2', 'client2@example.com', '987-654-3210', true),
    (3, 'client 3', 'City 3', 'Address 3', 'Contact Person 3', 'client3@example.com', '555-555-5555', true),
    (4, 'client 4', 'City 4', 'Address 4', 'Contact Person 4', 'client4@example.com', '111-222-3333', true),
    (5, 'client 5', 'City 5', 'Address 5', 'Contact Person 5', 'client5@example.com', '777-888-9999', true)

INSERT INTO user (id, firstName, lastName, userName, password, email, phone, is_active)
VALUES
    (1, 'First 1', 'Last 1', 'user1', 'password1', 'user1@example.com', '111-222-3333', true),
    (2, 'First 2', 'Last 2', 'user2', 'password2', 'user2@example.com', '222-333-4444', true),
    (3, 'First 3', 'Last 3', 'user3', 'password3', 'user3@example.com', '333-444-5555', true)

INSERT INTO contact (id, user_id, client_id, contact_type_id, contact_outcome_id, additionalComment, initiated_by_client, initiated_by_user)
VALUES
    (1, 1, 1, 1, 1, 'Comment 1', true, false),
    (2, 1, 3, 2, 2, 'Comment 2', true, false),
    (3, 2, 3, 1, 2, 'Comment 3', true, false),
    (4, 2, 3, 2, 1, 'Comment 4', true, false),
    (5, 3, 3, 1, 2, 'Comment 5', true, false),
    (6, 2, 2, 2, 1, 'Comment 6', true, false),
    (7, 3, 4, 1, 2, 'Comment 7', true, false),
    (8, 3, 5, 2, 1, 'Comment 8', false, true),
    (9, 3, 2, 1, 2, 'Comment 9', true, false),
    (10, 3, 1, 2, 1, 'Comment 10', false, true);


-- another
UPDATE `contact` SET `user_id` = '2' WHERE `contact`.`id` = 15;



-- another
SELECT
    u.id AS user_id,
    u.firstName,
    u.lastName,
    c.id AS client_id,
    c.clientName AS client_name,
    COUNT(ct.initiated_by_client) + COUNT(ct.initiated_by_user) AS number_of_contacts
FROM
    user u
INNER JOIN
    contact ct ON u.id = ct.user_id
INNER JOIN
    client c ON ct.client_id = c.id
WHERE C.id = 3 -- this one can be removed to get everyones
GROUP BY
    u.id, u.firstName, u.lastName, c.id, c.clientName;


-- script
SELECT
    ct.id AS customer_id,
    ct.customerName AS customer_name,
    SUM(cn.initiated_by_customer) AS number_of_C_BYcUST,
    SUM(cn.initiated_by_user) AS number_of_c_BYuSER,
    SUM(cn.initiated_by_customer) + SUM(cn.initiated_by_user) as TOTAL_CON
FROM
    contact cn
INNER JOIN
    customer ct ON cn.customer_id = ct.id
WHERE cn.customer_id = 3 -- this one can be removed to get everyones
GROUP BY
    ct.id



-- script
SELECT
    ua.id AS user_account_id,
    ua.firstName,
    ua.lastName,
    c.id AS customer_id,
    c.customerName AS customer_name,
    COUNT(co.id) AS num_contacts
FROM
    user_account ua
INNER JOIN
    contact co ON ua.id = co.user_account_id
INNER JOIN
    customer c ON co.customer_id = c.id
GROUP BY
    ua.id, ua.firstName, ua.lastName, c.id, c.customerName
HAVING
    COUNT(co.id) > 1;


-- script
select * from (
SELECT
    ua.id AS user_account_id,
    ua.firstName,
    ua.lastName,
    c.id AS customer_id,
    c.customerName AS customer_name,
    COUNT(co.id) AS num_contacts
--    SUM(co.id) AS sum
FROM
    user_account ua
INNER JOIN
    contact co ON ua.id = co.user_account_id
INNER JOIN
    customer c ON co.customer_id = c.id
GROUP BY
    ua.id, ua.firstName, ua.lastName, c.id, c.customerName
) a
where a.num_contacts > 1