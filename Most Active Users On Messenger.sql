/*
Meta/Facebook Messenger stores the number of messages between users in a table named 'fb_messages'. In this table 'user1' is the sender, 'user2' is the receiver, and 'msg_count' is the number of messages exchanged between them.
Find the top 10 most active users on Meta/Facebook Messenger by counting their total number of messages sent and received. Your solution should output usernames and the count of the total messages they sent or received
https://platform.stratascratch.com/coding/10295-most-active-users-on-messenger?code_type=3
*/


WITH message_sent AS 
(
SELECT 
    user1, 
    SUM(msg_count) AS total_message_sent 
FROM fb_messages
GROUP BY user1
), 

message_received AS 
(
SELECT 
    user2, 
    SUM(msg_count) AS total_message_received
FROM fb_messages
GROUP BY user2
), 
combined_sent_received AS 
(
SELECT * FROM message_sent UNION ALL
SELECT * FROM message_received
) 
SELECT 
    user1 AS user, 
    SUM(total_message_sent) AS total
FROM combined_sent_received
GROUP BY user1
ORDER BY total DESC
LIMIT 10 


