-- 1070. Product sales analysis III
-- Table: Sales
-- 
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- (sale_id, year) is the primary key of this table.
-- product_id is a foreign key to Product table.
-- Each row of this table shows a sale on the product product_id in a certain year.
-- Note that the price is per unit.
--  
-- 
-- Table: Product
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id is the primary key of this table.
-- Each row of this table indicates the product name of each product.
--  
-- 
-- Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.
-- 
-- Return the resulting table in any order.

-----------------------------------------------------------
-- Solution 1
WITH CTE AS (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY 1
)
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (SELECT * FROM CTE);

-- Solution 2 
-- 
-- SELECT product_id, year AS first_year, quantity, price
-- FROM Sales
-- WHERE (product_id, year) IN (
--     SELECT product_id, MIN(year)
--     FROM Sales
--     GROUP BY 1
-- );
 
-- Solution 3
-- SELECT A.product_id, A.year AS first_year, A.quantity, A.price
-- FROM (
--     SELECT product_id, year, quantity, price,
--     RANK() OVER (PARTITION BY product_id ORDER BY year) AS rk
--     FROM Sales
-- ) A
-- WHERE A.rk = 1;

-- Input: 
-- Sales table:
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+ 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+
-- Product table:
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+
-- Output: 
-- +------------+------------+----------+-------+
-- | product_id | first_year | quantity | price |
-- +------------+------------+----------+-------+ 
-- | 100        | 2008       | 10       | 5000  |
-- | 200        | 2011       | 15       | 9000  |
-- +------------+------------+----------+-------+

-------------------------------------------------------------------
-- Note
-- Select (product_id, year) pair instead of them indivitually
-- Use CTE (common table expression) tp create a temperory table
-- RANK() OVER (PARTITION BY ... ORDER BY ...)
