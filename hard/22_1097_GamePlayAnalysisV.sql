-- 1097. Game play analysis V
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
-- The install date of a player is the first login day of that player.
-- 
-- We define day one retention of some date x to be the number of players whose install date is x and they logged back in on the day right after x, divided by the number of players whose install date is x, rounded to 2 decimal places.
-- 
-- Write an SQL query to report for each install date, the number of players that installed the game on that day, and the day one retention.
-- 
-- Return the result table in any order.

-------------------------------------------------------------------------
-- Solution
# Write your MySQL query statement below
SELECT DISTINCT A.first_dt AS install_dt,
       COUNT(A.player_id) AS installs, 
       ROUND(COUNT(B.player_id) / COUNT(A.player_id), 2) AS Day1_retention
FROM 
(
    SELECT player_id, MIN(event_date) AS first_dt
    FROM Activity
    GROUP BY player_id
) A 
LEFT JOIN Activity B
ON A.player_id = B.player_id 
AND DATEDIFF(B.event_date, A.first_dt) = 1
GROUP BY A.first_dt

-- Input: 
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-03-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-01 | 0            |
-- | 3         | 4         | 2016-07-03 | 5            |
-- +-----------+-----------+------------+--------------+
-- Output: 
-- +------------+----------+----------------+
-- | install_dt | installs | Day1_retention |
-- +------------+----------+----------------+
-- | 2016-03-01 | 2        | 0.50           |
-- | 2017-06-25 | 1        | 0.00           |
-- +------------+----------+----------------+

---------------------------------------------------------
-- Note
-- Steps through I-IV
