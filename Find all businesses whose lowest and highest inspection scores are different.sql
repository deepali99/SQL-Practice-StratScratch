/*

https://platform.stratascratch.com/coding/9731-find-all-businesses-whose-lowest-and-highest-inspection-scores-are-different?code_type=3
Find all businesses whose lowest and highest inspection scores are different.
Output the corresponding business name and the lowest and highest scores of each business.
HINT: you can assume there are no different businesses that share the same business name
Order the result based on the business name in ascending order.
*/



ELECT 
    business_name,
    MIN(inspection_score) AS min_score, 
    MAX(inspection_score) AS max_score
FROM 
    sf_restaurant_health_violations
GROUP BY 
    business_name
HAVING 
    MAX(inspection_score) <> MIN(inspection_score)
ORDER BY 
    business_name ASC
