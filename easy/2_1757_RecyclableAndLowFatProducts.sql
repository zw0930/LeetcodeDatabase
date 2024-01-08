-- 1757. Recyclable and Low Fat Products
-- Table: Products

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | low_fats    | enum    |
-- | recyclable  | enum    |
-- +-------------+---------+
-- product_id is the primary key for this table.
-- low_fats is an ENUM of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
-- recyclable is an ENUM of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
 

-- Write an SQL query to find the ids of products that are both low fat and recyclable.

-- Return the result table in any order.

-----------------------------------------
-- Solution
-- Write your MySQL query statement below
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- Output
-- +-------------+
-- | product_id  |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+

-----------------------------------------
-- Note
-- ENUM data type
-- 1. String e.g. ENUM ('val1', 'val2', 'val3')
-- 2. Filtering out data by ENUM indices or the string
-- 3. Ordered by indices assigned when created the table
