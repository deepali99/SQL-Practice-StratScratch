/*
You have been asked to find the 5 most lucrative products (including ties) in terms of total revenue for the first half of 2022 (from January to June inclusive).
Output their IDs and the total revenue. There may be more than 5 rows in the output since you are including ties.

https://platform.stratascratch.com/coding/2119-most-lucrative-products?code_type=3

*/

SELECT 
    product_id,
    SUM(cost_in_dollars * units_sold) AS total_revenue
FROM online_orders
WHERE date_sold BETWEEN '2022-01-01' AND '2022-06-30'
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5 
;
