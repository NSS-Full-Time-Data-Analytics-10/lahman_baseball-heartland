--9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.


SELECT CONCAT(people.namefirst,' ', people.namelast) AS tsn_mgr_of_year, teams.name AS team, awardsmanagers.yearid AS year_won
FROM managers 
JOIN people 
USING (playerid)
JOIN awardsmanagers ON managers.playerid = awardsmanagers.playerid AND managers.yearid = awardsmanagers.yearid
JOIN teams ON managers.yearid = teams.yearid AND managers.teamid = teams.teamid
WHERE awardsmanagers.playerid IN (SELECT playerid
				  					FROM awardsmanagers
				  					WHERE awardid ILIKE '%tsn%'
				  					AND lgid = 'NL')
									AND awardsmanagers.playerid IN 
									(SELECT playerid
				  					FROM awardsmanagers
				  					WHERE awardid ILIKE '%tsn%'
				  					AND lgid = 'AL')	
GROUP BY tsn_mgr_of_year, team, year_won
ORDER BY tsn_mgr_of_year, year_won;



									