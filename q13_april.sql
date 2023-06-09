---There is a slight positive correlation in left-handedness and conferment for Cy Young Award.
---There is a slight negative correlation in left-handness and Hall of Fame induction.

---Percentage of left handed players from total of left+right
---27
SELECT ROUND(
(SELECT COUNT(DISTINCT playerid)
FROM people INNER JOIN pitching USING(playerid)
WHERE throws = 'L') * 100 /
(SELECT COUNT(DISTINCT playerid)
FROM people INNER JOIN pitching USING(playerid)
WHERE throws IS NOT NULL AND throws != 'S'), 0)
AS percent_left_from_leftplusright; 

---Percentage of left handed players from total of left+right who won Cy Young Award
---31
SELECT ROUND(
(SELECT COUNT(DISTINCT playerid)
FROM people INNER JOIN pitching USING(playerid)
INNER JOIN awardsplayers USING(playerid)
WHERE throws = 'L'
AND awardid LIKE 'Cy Young Award') * 100 /
(SELECT COUNT(DISTINCT playerid)
FROM people INNER JOIN pitching USING(playerid)
INNER JOIN awardsplayers USING(playerid)
WHERE throws IS NOT NULL AND throws != 'S'
AND awardid LIKE 'Cy Young Award'), 0)
AS percent_left_from_leftplusright_cy;

---Percentage of left handed players from total of left+right who were inducted to Hall of Fame
---22
SELECT ROUND(
(SELECT COUNT(DISTINCT playerid)
FROM people INNER JOIN pitching USING(playerid)
INNER JOIN halloffame USING(playerid)
WHERE throws = 'L'
AND inducted = 'Y') * 100 /
(SELECT COUNT(DISTINCT playerid)
FROM people INNER JOIN pitching USING(playerid)
INNER JOIN halloffame USING(playerid)
WHERE throws IS NOT NULL AND throws != 'S'
AND inducted = 'Y'), 0)
AS percent_left_from_leftplusright_hof;








