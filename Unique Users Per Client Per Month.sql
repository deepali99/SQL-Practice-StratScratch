/*
https://platform.stratascratch.com/coding/2024-unique-users-per-client-per-month/official-solution?code_type=3
Write a query that returns the number of unique users per client for each month. Assume all events occur within the same year, so only month needs to be be in the output as a number from 1 to 12.
*/



SELECT client_id,
       MONTH(time_id) as month,
       COUNT(DISTINCT user_id) as users_num
FROM fact_events
GROUP BY client_id,
          MONTH(time_id)
