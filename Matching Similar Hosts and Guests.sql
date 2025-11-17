/*
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.
https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=3
*/


SELECT 
    DISTINCT host_id, 
    guest_id
FROM airbnb_hosts hosts JOIN airbnb_guests guests
ON 
hosts.gender = guests.gender
AND
hosts.nationality = guests.nationality
    
