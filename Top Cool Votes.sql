/*
Find the review_text that received the highest number of  cool votes.
Output the business name along with the review text with the highest number of cool votes.
https://platform.stratascratch.com/coding/10060-top-cool-votes?code_type=3
*/


WITH ranked_cool AS
(
SELECT 
    business_name,
    review_text, 
    cool, 
    RANK() OVER(ORDER BY cool DESC) AS rnk
FROM yelp_reviews
ORDER BY cool DESC
) 

SELECT 
    business_name,
    review_text
FROM ranked_cool
WHERE rnk = 1



    
