/*
You are given a table named airbnb_host_searches that contains listings shown to users during Airbnb property searches. Each record represents a property listing (not the user's search query). Determine the minimum, average, and maximum rental prices for each host popularity rating based on the property's number_of_reviews.


The host’s popularity rating is defined as below:
•   0 reviews: "New"
•   1 to 5 reviews: "Rising"
•   6 to 15 reviews: "Trending Up"
•   16 to 40 reviews: "Popular"
•   More than 40 reviews: "Hot"


Tip: The id column in the table refers to the listing ID.


Output host popularity rating and their minimum, average and maximum rental prices. Order the solution by the minimum price.


*/





WITH pop_score AS 
(
SELECT 
    number_of_reviews,
    price, 
    CASE 
        WHEN number_of_reviews = 0 THEN 'New'
        WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
        WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
        WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
        WHEN number_of_reviews> 40 THEN 'Hot'
    END AS host_popularity
FROM airbnb_host_searches
) 

SELECT 
    host_popularity, 
    MIN(price), 
    AVG(price), 
    MAX(price)
FROM pop_score
GROUP BY host_popularity
    
