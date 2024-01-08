-- 1107. New users daily count
-- Table: Traffic
-- 
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | activity      | enum    |
-- | activity_date | date    |
-- +---------------+---------+
-- There is no primary key for this table, it may have duplicate rows.
-- The activity column is an ENUM type of ('login', 'logout', 'jobs', 'groups', 'homepage').
--  
-- 
-- Write an SQL query to reports for every date within at most 90 days from today, the number of users that logged in for the first time on that date. Assume today is 2019-06-30.
-- 
-- Return the result table in any order.

----------------------------------------------------------------
-- Solution
SELECT A.first_login AS login_date, COUNT(user_id) AS user_count
FROM (
    SELECT user_id, activity, MIN(activity_date) AS first_login
    FROM Traffic
    WHERE activity = 'login' 
    GROUP BY user_id
) A
WHERE DATEDIFF('2019-06-30', A.first_login) <= 90
GROUP BY login_date

