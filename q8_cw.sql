

--8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.

--working queries--

SELECT *
FROM homegames;

SELECT *
FROM parks;

SELECT *
FROM teams;

SELECT DISTINCT park
FROM homegames
ORDER BY park;

SELECT *
FROM homegames
WHERE year = 2016
AND games > 10;

SELECT team, park_name, attendance, games, (attendance/games) AS avg_attendance
FROM homegames
JOIN parks USING(park)
WHERE year = 2016
AND games > 10
ORDER BY avg_attendance DESC
LIMIT 5;

--I thought this CTE would work to join on teams, but I only got 4 results the bottom 5 query. The Oakland stadium has a different name on this table so it was ommitted in the results. I had to find another solution. I had missed that there is an attendance column exists in the homegames and teams tables and does match. It's a simpler solution anyway. I'll delete all this on final push, but wanted to show how I messed up before I got to the final query--

WITH top_five AS (SELECT park_name, (attendance/games) AS avg_attendance
					FROM homegames
					JOIN parks USING(park)
					WHERE year = 2016
					AND games > 10
					ORDER BY avg_attendance DESC
					LIMIT 5)
SELECT DISTINCT park_name, name AS team_name, avg_attendance
FROM top_five
INNER JOIN teams ON top_five.park_name = teams.park
WHERE yearid = 2016
ORDER BY avg_attendance DESC;

WITH bottom_five AS (SELECT park_name, (attendance/games) AS avg_attendance
					FROM homegames
					JOIN parks USING(park)
					WHERE year = 2016
					AND games > 10
					ORDER BY avg_attendance ASC
					LIMIT 5)
SELECT DISTINCT park_name, name AS team_name, avg_attendance
FROM bottom_five
LEFT JOIN teams ON bottom_five.park_name = teams.park
WHERE yearid = 2016
ORDER BY avg_attendance ASC;

--final queries--

SELECT name AS team_name, park_name AS park_name, (attendance/games) AS avg_attendance
FROM homegames
JOIN parks USING(park)
JOIN teams USING(attendance)
WHERE year = 2016
AND games > 10
ORDER BY avg_attendance DESC
LIMIT 5;

SELECT name AS team_name, park_name, (attendance/games) AS avg_attendance
FROM homegames
JOIN parks USING(park)
JOIN teams USING(attendance)
WHERE year = 2016
AND games > 10
ORDER BY avg_attendance ASC
LIMIT 5;

