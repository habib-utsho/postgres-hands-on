create TABLE product (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price INT check (price > 0),
    weight INT NOT NULL
)

INSERT INTO
    product (product_name, price, weight)
VALUES ('CMF TWS', 2000, 0.500),
    ('Charger light', 1000, 0.66),
    ('Silling fan', 1200, 1),
    ('Table', 2500, 3)

SELECT * from product;

create TABLE customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    district VARCHAR(25) NOT NULL
)

INSERT INTO
    customer (name, dob, district)
VALUES (
        'Habib',
        '05-05-2000',
        'Kurigram'
    ),
    (
        'Utsho',
        '01-02-1999',
        'Dhaka'
    ),
    (
        'Ahashan',
        '01-01-1998',
        'Pabna'
    ),
    (
        'Akash',
        '01-01-2005',
        'Natore'
    )

SELECT name, id, age (CURRENT_DATE, dob) FROM customer

CREATE TABLE "order" (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customer (id) not NULL,
    product_id INTEGER REFERENCES product (id) not NULL,
    order_time TIMESTAMP
)

INSERT INTO
    "order" (
        customer_id,
        product_id,
        order_time
    )
VALUES (3, 1, current_timestamp),
    (4, 6, current_timestamp),
    (5, 7, current_timestamp),
    (3, 8, current_timestamp)

SELECT
    "order".id AS order_id,
    "order".order_time,
    product.id AS product_id,
    product.product_name,
    product.price,
    product.weight,
    customer.id AS customer_id,
    customer.name AS customer_name,
    age (customer.dob) as customer_age
FROM
    "order"
    JOIN product ON "order".product_id = product.id
    JOIN customer ON "order".customer_id = customer.id

-- Get  products total sale, total selling amount and avg selling amount in desc order
SELECT
    product.product_name,
    COUNT(*) as total_sale,
    sum(price) as total_sale_amount,
    round(avg(price)) as avg_sale_amount
FROM "order"
    JOIN product ON "order".product_id = product.id
GROUP BY
    product.product_name
ORDER BY total_sale_amount desc

-- filter by customer_id = 3
SELECT * from "order" WHERE customer_id = 3;

-- show all customers who places at least one order
-- option 1
SELECT DISTINCT customer_id from "order"

-- option 2
SELECT customer_id from "order" GROUP BY customer_id

-- Total order per customer
SELECT
    customer_id,
    count(*) AS total_order,
    sum(price) AS total_purchase_amount
from "order"
    JOIN product on "order".product_id = product.id
GROUP BY
    customer_id
ORDER BY total_purchase_amount DESC

-- Find most expensive product ever ordered
SELECT product_name, max(price) as max_price
from "order"
    JOIN product on "order".product_id = product.id
GROUP BY
    product_name
ORDER BY max_price DESC
LIMIT 1

-- Find customers who never ordered
SELECT * from customer 
 LEFT JOIN "order" ON customer.id = "order".customer_id
 WHERE "order".id IS NULL


SELECT * from "order"