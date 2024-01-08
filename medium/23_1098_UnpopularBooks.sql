-- 1098. Unpopular books
-- Table: Books
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | book_id        | int     |
-- | name           | varchar |
-- | available_from | date    |
-- +----------------+---------+
-- book_id is the primary key of this table.
--  
-- 
-- Table: Orders
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | order_id       | int     |
-- | book_id        | int     |
-- | quantity       | int     |
-- | dispatch_date  | date    |
-- +----------------+---------+
-- order_id is the primary key of this table.
-- book_id is a foreign key to the Books table.
--  
-- 
-- Write an SQL query that reports the books that have sold less than 10 copies in the last year, excluding books that have been available for less than one month from today. Assume today is 2019-06-23.
-- 
-- Return the result table in any order.

------------------------------------------------------------------------
-- Solution 1
SELECT book_id, name
FROM Books
WHERE book_id NOT IN (
    SELECT book_id
    FROM Orders
    WHERE dispatch_date >= '2018-06-23' AND dispatch_date <= '2019-06-23'
    GROUP BY book_id
    HAVING SUM(quantity) >= 10
) 
AND available_from <= '2019-05-23'

-- Solution 2
/*
SELECT A.book_id, A.name
FROM Books A
LEFT JOIN Orders B
ON A.book_id = B.book_id 
   AND B.dispatch_date >= '2018-06-23' AND B.dispatch_date <= '2019-06-23'
WHERE A.available_from <= '2019-05-23'
GROUP BY A.book_id
HAVING SUM(IFNULL(B.quantity, 0)) < 10
*/

---------------------------------------------------------------------------
-- Note
-- 1. NOT IN
-- 2. IFNULL 
