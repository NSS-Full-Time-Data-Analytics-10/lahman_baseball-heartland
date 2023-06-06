---Q2 name, height, num of games, team of shortest player
---Eddie Gaedel, 43 in, 1 game, SLA
SELECT namefirst AS first_name, namelast AS last_name, height AS height_inches, g_all AS games_played, name AS team
FROM people INNER JOIN appearances USING(playerid)
INNER JOIN teams USING(teamid)
ORDER BY height ASC
LIMIT 1;
