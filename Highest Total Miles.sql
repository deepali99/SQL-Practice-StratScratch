/*

https://platform.stratascratch.com/coding/10169-highest-total-miles?code_type=3
You’re given a table of Uber rides that contains the mileage and the purpose for the business expense. 
You’re asked to find business purposes that generate the most miles driven for passengers that use Uber for their business transportation. 
Find the top 3 business purpose categories by total mileage.
*/


WITH ranked_business AS 
(
SELECT 
    purpose, 
    SUM(miles) AS miles_sum, 
    RANK()OVER(ORDER BY SUM(miles) DESC) AS rnk
FROM my_uber_drives
WHERE category = 'Business'
GROUP BY purpose
) 

SELECT 
    purpose, 
    miles_sum
FROM ranked_business
WHERE rnk<=3
    
