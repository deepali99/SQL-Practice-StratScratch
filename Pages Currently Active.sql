/*
https://platform.stratascratch.com/coding/10556-pages-currently-active?code_type=3

You are monitoring a system where pages can be turned on or off at different times. 
The page status log records every state change event for each page. Find the number of pages that are currently active based on their most recent status change. Return the count of currently active pages.

*/




WITH latest_status_change AS 
(
SELECT 
    page_id,
    status,
    ROW_NUMBER()OVER(PARTITION BY page_id ORDER BY changed_at DESC) AS rnk
FROM 
    page_status_log
)


SELECT 
    COUNT(DISTINCT page_id)
FROM 
    latest_status_change
WHERE 
    status = 'on' AND 
    rnk = 1 
