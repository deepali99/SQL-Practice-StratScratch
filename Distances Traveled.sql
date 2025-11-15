/*
Find the top 10 users that have traveled the greatest distance. Output their id, name and a total distance traveled.
https://platform.stratascratch.com/coding/10324-distances-traveled?code_type=3
*/


WITH ranked_distance AS (
SELECT 
    u.id, 
    name,
    SUM(distance) AS total_distance, 
    RANK() OVER(ORDER BY SUM(distance) DESC) AS rnk
FROM lyft_users u JOIN lyft_rides_log r
ON u.id = r.user_id
GROUP BY u.id,name) 

SELECT 
    id, 
    name, 
    total_distance
FROM ranked_distance
WHERE rnk <=10







