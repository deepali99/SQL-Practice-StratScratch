/*
Find the Olympics with the highest number of unique athletes. 
The Olympics game is a combination of the year and the season, and is found in the games column. 
Output the Olympics along with the corresponding number of athletes. The id column uniquely identifies an athlete.
*/




WITH ranked_athletes AS
(
SELECT 
    games, 
    COUNT(DISTINCT id) AS athletes_count, 
    RANK() OVER(ORDER BY COUNT(DISTINCT id) DESC) AS rnk
FROM olympics_athletes_events
GROUP BY games
) 


SELECT
    games, 
    athletes_count
FROM ranked_athletes
WHERE rnk = 1





