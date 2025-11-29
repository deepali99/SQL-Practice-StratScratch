/*

https://platform.stratascratch.com/coding/9599-old-and-young-athletes?code_type=3

Find the old-to-young player ratio for each Olympic games. '
Old' is defined as ages 50 and older and 'young' is defined as athletes 25 or younger. 
Output the Olympic games, number of old athletes, number of young athletes, and the old-to-young ratio.

*/

SELECT 
    games, 
    COUNT(DISTINCT CASE WHEN age >= 50 THEN name END) AS count_old, 
    COUNT(DISTINCT CASE WHEN age <= 25 THEN name END) AS count_young, 
    COUNT(DISTINCT CASE WHEN age >= 50 THEN name END)/COUNT(DISTINCT CASE WHEN age <= 25 THEN name END) AS old_to_young_ratio
    
FROM olympics_athletes_events
GROUP BY games
