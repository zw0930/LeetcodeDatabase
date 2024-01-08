-- 550. Game Play Analysis IV
-- Table: Activity
-- 
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
--  
-- 
-- Write an SQL query to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

--------------------------------------------------------------------
-- Solution
-- Write your MySQL query statement below
SELECT ROUND(COUNT(B.player_id) / COUNT(A.player_id), 2) AS fraction 
FROM 
(
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
) A 
LEFT JOIN Activity B
ON A.player_id = B.player_id 
AND DATEDIFF(B.event_date, A.first_date) = 1

-- Input: 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- Output: 
-- +-----------+
-- | fraction  |
-- +-----------+
-- | 0.33      |
-- +-----------+

------------------------------------------------------------
-- Note:
-- Left join 
-- Keep all records from the left table A
-- If there's no match in the right table B, filling in null
-- number of records in B is the number of matched records


