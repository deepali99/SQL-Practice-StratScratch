/*

https://platform.stratascratch.com/coding/2119-most-lucrative-products?code_type=3
You have been asked to find the 5 most lucrative products (including ties) in terms of total revenue for the first half of 2022 (from January to June inclusive).
Output their IDs and the total revenue. There may be more than 5 rows in the output since you are including ties.
*/


WITH productwise_revenue AS 
(
SELECT 
    product_id, 
    SUM(cost_in_dollars*units_sold) AS revenue, 
    RANK()OVER(ORDER BY SUM(cost_in_dollars*units_sold) DESC) AS rnk
FROM online_orders
WHERE 
    YEAR(date_sold) = 2022 AND 
    MONTH(date_sold) BETWEEN 1 AND 7 
GROUP BY product_id
) 


SELECT 
    product_id, 
    revenue
FROM productwise_revenue
WHERE rnk<=5
