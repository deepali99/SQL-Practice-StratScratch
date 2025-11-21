/*
https://platform.stratascratch.com/coding/10183-total-cost-of-orders?code_type=3
Find the total cost of each customer's orders. Output customer's id, first name, and the total order cost. Order records by customer's first name alphabetically.
*/


SELECT 
    cust.id,
    first_name,
    SUM(total_order_cost)
FROM customers cust JOIN orders ordrs
ON cust.id = ordrs.cust_id
GROUP BY cust.id,
         cust.first_name
ORDER BY first_name ASC
    
