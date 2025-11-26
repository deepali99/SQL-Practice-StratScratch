/*

https://platform.stratascratch.com/coding/9724-find-the-postal-code-which-has-the-highest-average-inspection-score?code_type=3
Find the postal code which has the highest average inspection score.
Output the corresponding postal code along with the result.
*/



WITH avg_score_table AS 
(
SELECT 
    business_postal_code, 
    AVG(inspection_score) AS avg_score
FROM 
    sf_restaurant_health_violations
GROUP BY 
    business_postal_code
) 


SELECT 
    business_postal_code, 
    avg_score
FROM 
    avg_score_table
WHERE
    avg_score = (SELECT MAX(avg_score) FROM avg_score_table)


    
