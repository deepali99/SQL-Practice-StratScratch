/*

Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019. An active user is a customer who made at least one transaction in March 2019.
Output the revenue along with the customer id and sort the results based on the revenue in descending order.
*/


SELECT 
    cust_id, 
    SUM(total_order_cost) AS total_revenue
FROM orders 
WHERE 
    MONTH(order_date) = 3 AND 
    YEAR(order_date) = 2019
GROUP BY cust_id
ORDER BY total_revenue DESC
