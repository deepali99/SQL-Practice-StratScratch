/*

Find the top 10 ranked songs in 2010. Output the rank, group name, and song name, but do not show the same song twice. Sort the result based on the rank in ascending order.
https://platform.stratascratch.com/coding/9650-find-the-top-10-ranked-songs-in-2010?code_type=3
*/



SELECT 
    DISTINCT song_name,
    group_name, 
    year_rank
FROM billboard_top_100_year_end
WHERE 
    year = 2010 AND
    year_rank<=10
