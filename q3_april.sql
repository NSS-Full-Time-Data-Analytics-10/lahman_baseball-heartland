---Q3 FN, LN, total salary for all players from Vanderbilt (salary DESC)
SELECT namefirst, namelast, SUM(salary)
FROM people INNER JOIN salaries USING(playerid)
INNER JOIN collegeplaying USING(playerid)
INNER JOIN schools USING(schoolid)
WHERE schoolname LIKE 'Vanderbilt%'
GROUP BY namefirst, namelast
ORDER BY SUM(salary) DESC;

