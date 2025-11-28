/*
https://platform.stratascratch.com/coding/9624-accommodates-to-bed-ratio?code_type=3
Find the average accommodates-to-beds ratio for shared rooms in each city. Sort your results by listing cities with the highest ratios first.
*/


SELECT 
    city,
    AVG(accommodates/beds) AS avg_crowdness_ratio
FROM 
    airbnb_search_details
WHERE 
    room_type = 'Shared room'
GROUP BY 
    city
ORDER BY 
    avg_crowdness_ratio DESC
