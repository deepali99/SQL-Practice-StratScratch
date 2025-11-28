
/*
Find how many hosts are verified by the Airbnb staff and how many aren't. Assume that in each row, you have a different host.

*/

SELECT 
    host_identity_verified, 
    COUNT(*) AS n_hosts
FROM airbnb_search_details
GROUP BY 
    host_identity_verified
