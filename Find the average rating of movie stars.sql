/*
https://platform.stratascratch.com/coding/9605-find-the-average-rating-of-movie-stars?code_type=3
Find the average rating of each movie star along with their names and birthdays. Sort the result in the ascending order based on the birthday. Use the names as keys when joining the tables.
*/

SELECT 
    ni.name,
    ni.birthday,
    AVG(nf.rating) AS avg_rating
FROM nominee_information ni
JOIN nominee_filmography nf
    ON ni.name = nf.name
GROUP BY 
    ni.name,
    ni.birthday
ORDER BY 
    ni.birthday ASC;
