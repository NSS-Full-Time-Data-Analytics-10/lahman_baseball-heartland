--9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.
SELECT *
FROM awardsmanagers;

SELECT *
FROM awardsmanagers
WHERE awardid ILIKE '%TSN%'
AND lgid = 'NL';

SELECT *
FROM awardsmanagers
WHERE awardid ILIKE '%TSN%'
AND lgid = 'AL';

--final query--

WITH mgr_id AS ((SELECT playerid
					FROM awardsmanagers
					WHERE awardid ILIKE '%TSN%'
					AND lgid = 'NL')
					INTERSECT
					(SELECT playerid
					FROM awardsmanagers
					WHERE awardid ILIKE '%TSN%'
					AND lgid = 'AL'))
SELECT CONCAT(namefirst,' ', namelast) AS tsn_al_nl_mgr_of_year
FROM mgr_id
JOIN people USING(playerid);
					
					

			