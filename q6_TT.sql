 --Question 6:Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.
 SELECT p.namefirst, p.namelast, sb, (sb::numeric * 100 / SUM(sb + cs)) AS percent
FROM batting AS b
INNER JOIN people AS p
    USING (playerid)
WHERE b.yearid = 2016 
    AND b.sb + b.cs >= 20
GROUP BY p.namefirst, p.namelast, b.sb, p.playerid
ORDER BY percent DESC
LIMIT 1;
--Chris Owings