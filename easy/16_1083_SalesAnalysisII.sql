-- 1083. Sales analysis II
-- Table: Product
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- | unit_price   | int     |
-- +--------------+---------+
-- product_id is the primary key of this table.
-- Each row of this table indicates the name and the price of each product.
-- Table: Sales
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | seller_id   | int     |
-- | product_id  | int     |
-- | buyer_id    | int     |
-- | sale_date   | date    |
-- | quantity    | int     |
-- | price       | int     |
-- +-------------+---------+
-- This table has no primary key, it can have repeated rows.
-- product_id is a foreign key to the Product table.
-- buyer_id is never NULL. 
-- sale_date is never NULL. 
-- Each row of this table contains some information about one sale.
--  
-- 
-- Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.
-- 
-- Return the result table in any order.

-----------------------------------------------
-- Solution 1
-- Write your MySQL query statement below
WITH CTE AS (
    SELECT DISTINCT buyer_id, product_name
    FROM Sales A
    JOIN Product B
    ON A.product_id = B.product_id
)
SELECT buyer_id
FROM CTE
WHERE product_name = 'S8' AND buyer_id NOT IN (
    SELECT DISTINCT buyer_id
    FROM CTE
    WHERE product_name = 'iPhone'
);

-- Solution 2 (Shorter and faster!)
-- SELECT A.buyer_id
-- FROM Sales A 
-- JOIN Product B 
-- USING(product_id)
-- GROUP BY A.buyer_id
-- HAVING SUM(B.product_name = 'S8') > 0 AND SUM(B.product_name = 'iPhone') = 0;

-- Input: 
-- Product table:
-- +------------+--------------+------------+
-- | product_id | product_name | unit_price |
-- +------------+--------------+------------+
-- | 1          | S8           | 1000       |
-- | 2          | G4           | 800        |
-- | 3          | iPhone       | 1400       |
-- +------------+--------------+------------+
-- Sales table:
-- +-----------+------------+----------+------------+----------+-------+
-- | seller_id | product_id | buyer_id | sale_date  | quantity | price |
-- +-----------+------------+----------+------------+----------+-------+
-- | 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
-- | 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
-- | 2         | 1          | 3        | 2019-06-02 | 1        | 800   |
-- | 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |
-- +-----------+------------+----------+------------+----------+-------+
-- Output: 
-- +-------------+
-- | buyer_id    |
-- +-------------+
-- | 1           |
-- +-------------+

--------------------------------------------
-- Note
-- DISTINCT
-- Using SUM() to determin if a statement is true in any case
-- if SUM() > 0, at least one TRUE case
-- if SUM() = 0, never TRUE
