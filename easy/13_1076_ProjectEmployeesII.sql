-- 1076. Project employees II
-- Table: Project
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key of this table.
-- employee_id is a foreign key to Employee table.
-- Each row of this table indicates that the employee with employee_id is working on the project with project_id.
--  
-- 
-- Table: Employee
-- 
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key of this table.
-- Each row of this table contains information about one employee.
--  
-- 
-- Write an SQL query that reports all the projects that have the most employees.
-- 
-- Return the result table in any order.

--------------------------------------------------------------
-- Solution
-- Write your MySQL query statement below
SELECT A.project_id
FROM (
    SELECT project_id,
    DENSE_RANK() OVER (ORDER BY COUNT(employee_id) DESC) AS rk
    FROM Project
    GROUP BY project_id
    ) A
WHERE A.rk = 1;

-- Input: 
-- Project table:
-- +-------------+-------------+
-- | project_id  | employee_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- | 1           | 2           |
-- | 1           | 3           |
-- | 2           | 1           |
-- | 2           | 4           |
-- +-------------+-------------+
-- Employee table:
-- +-------------+--------+------------------+
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+
-- Output: 
-- +-------------+
-- | project_id  |
-- +-------------+
-- | 1           |
-- +-------------+

-------------------------------------------------------------------------------------
-- Note
-- DENSE_RANK() in case there maybe more than one project that has the most employees
