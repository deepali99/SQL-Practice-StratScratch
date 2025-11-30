/*

https://platform.stratascratch.com/coding/10553-finding-purchases?code_type=3
Identify returning active users by finding users who made a second purchase within 7 days or less of any previous transaction, excluding same-day purchases. Output a list of these user_id.

*/

SELECT DISTINCT a.user_id
FROM amazon_transactions a
JOIN amazon_transactions b 
    ON a.user_id = b.user_id          
    AND b.created_at > a.created_at    
    AND b.created_at - a.created_at <= 7 
ORDER BY a.user_id;                   
