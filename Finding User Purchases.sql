/*
Identify returning active users by finding users who made a second purchase within 1 to 7 days after their first purchase. Ignore same-day purchases. Output a list of these 
https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=3
*/


WITH ranked_purchase_dates AS 
(
SELECT 
    user_id,
    created_at, 
    RANK() OVER (PARTITION BY user_id ORDER BY created_at ASC) AS purchase_rank
FROM amazon_transactions
), 

first_second_purchase AS
(
SELECT 
    user_id, 
    MAX(CASE WHEN purchase_rank = 1 THEN created_at END) AS first_purchase, 
    MAX(CASE WHEN purchase_rank = 2 THEN created_at END) AS 
    second_purchase
FROM ranked_purchase_dates
GROUP BY user_id
), 

purchase_difference AS 
(
SELECT 
    user_id
FROM first_second_purchase
WHERE 
    first_purchase IS NOT NULL 
    AND
    second_purchase IS NOT NULL 
    AND
    DATEDIFF(second_purchase,first_purchase) BETWEEN 1 AND 7 

)

SELECT * FROM purchase_difference




