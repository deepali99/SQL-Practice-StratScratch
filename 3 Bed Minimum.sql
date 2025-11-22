

/*
https://platform.stratascratch.com/coding/9627-3-bed-minimum?code_type=3
Find the average number of beds in each neighborhood that has at least 3 beds in total.
Output results along with the neighborhood name and sort the results based on the number of average beds in descending order.
*/

SELECT 
    neighbourhood, 
    AVG(beds) AS n_beds_avg
FROM airbnb_search_details
GROUP BY neighbourhood
HAVING SUM(beds)>=3
ORDER BY n_beds_avg DESC
