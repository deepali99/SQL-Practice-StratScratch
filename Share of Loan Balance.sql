/*
https://platform.stratascratch.com/coding/2001-share-of-loan-balance?code_type=3
Write a query that returns the rate_type, loan_id, loan balance , and a column that shows with what percentage the loan's balance contributes to the total balance among the loans of the same rate type. 
Sort the final output by rate_type and loan_id.

*/

WITH total AS 
(
    SELECT 
        rate_type,
        SUM(balance) AS total_balance 
    FROM submissions
    GROUP BY rate_type
) 
SELECT 
    sub.loan_id,
    sub.rate_type, 
    sub.balance,
    sub.balance / tot.total_balance AS balance_share
FROM submissions sub 
JOIN total tot
    ON sub.rate_type = tot.rate_type
ORDER BY sub.rate_type, sub.loan_id;

