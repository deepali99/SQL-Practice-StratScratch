/*
https://platform.stratascratch.com/coding/9614-find-the-average-difference-between-booking-and-check-in-dates?code_type=3
Find the average number of days between the booking and check-in dates for AirBnB hosts. Order the results based on the average number of days in descending order.
*/


SELECT 
    id_host,
    AVG(DATEDIFF(ds_checkin, ts_booking_at)) AS avg_days_between_booking_and_checkin
FROM airbnb_contacts
GROUP BY 
    id_host
HAVING 
    avg(DATEDIFF(ds_checkin, ts_booking_at)) >= 0
ORDER BY 
    avg_days_between_booking_and_checkin DESC
