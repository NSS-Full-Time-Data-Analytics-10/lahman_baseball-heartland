

SELECT name AS team_name, park_name AS park_name, (attendance/games) AS highest_avg_attendance
FROM homegames
JOIN parks USING(park)
JOIN teams USING(attendance)
WHERE year = 2016
AND games >= 10
ORDER BY highest_avg_attendance DESC
LIMIT 5;

SELECT name AS team_name, park_name, (attendance/games) AS lowest_avg_attendance
FROM homegames
JOIN parks USING(park)
JOIN teams USING(attendance)
WHERE year = 2016
AND games >= 10
ORDER BY lowest_avg_attendance ASC
LIMIT 5;

