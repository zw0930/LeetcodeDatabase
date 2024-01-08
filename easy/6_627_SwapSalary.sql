-- 627. Swap Salaries
-- Table: Salary

--+-------------+----------+
--| Column Name | Type     |
--+-------------+----------+
--| id          | int      |
--| name        | varchar  |
--| sex         | ENUM     |
--| salary      | int      |
--+-------------+----------+
--id is the primary key for this table.
--The sex column is ENUM value of type ('m', 'f').
--The table contains information about an employee.


--Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

--Note that you must write a single update statement, do not write any select statement for this problem.

------------------------------------------
-- Solution 1
UPDATE Salary
SET sex = IF(sex = 'f', 'm', 'f');

-- Solution 2 
-- UPDATE Salary
-- SET sex = CASE WHEN sex = 'm' THEN 'f'
--                ELSE 'm'
--                END;

-- Input: 
-- Salary table:
-- +----+------+-----+--------+
-- | id | name | sex | salary |
-- +----+------+-----+--------+
-- | 1  | A    | m   | 2500   |
-- | 2  | B    | f   | 1500   |
-- | 3  | C    | m   | 5500   |
-- | 4  | D    | f   | 500    |
-- +----+------+-----+--------+
-- Output: 
-- +----+------+-----+--------+
-- | id | name | sex | salary |
-- +----+------+-----+--------+
-- | 1  | A    | f   | 2500   |
-- | 2  | B    | m   | 1500   |
-- | 3  | C    | f   | 5500   |
-- | 4  | D    | m   | 500    |
-- +----+------+-----+--------+
