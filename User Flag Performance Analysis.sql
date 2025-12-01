/*
https://platform.stratascratch.com/coding/10558-user-flag-performance-analysis?code_type=3
You are analyzing user flagging performance on a video platform. For each user who has had at least one of their flags reviewed by YouTube, calculate their flagging performance metrics as described below.
Find each user's first name, last name, total number of distinct videos they flagged, total number of distinct videos they flagged that were ultimately removed, and the latest date when any of their flags were reviewed.
*/




SELECT 
    user_firstname,
    user_lastname, 
    COUNT(DISTINCT video_id) AS videos_flagged, 
    COUNT(DISTINCT CASE WHEN reviewed_outcome = 'REMOVED' THEN video_id END) AS videos_removed, 
    MAX(reviewed_date) AS latest_review_date
FROM user_flags JOIN flag_review
ON user_flags.flag_id = flag_review.flag_id
WHERE 
    user_firstname IS NOT NULL AND 
    user_lastname IS NOT NULL AND 
    reviewed_by_yt = 1 
GROUP BY user_firstname,user_lastname
