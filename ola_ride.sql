SELECT * FROM ola_ride.ola_ride_data;

#1. Retrive all successful bookings:
CREATE VIEW successful_bookings AS
    SELECT 
        *
    FROM
        ola_ride_data
    WHERE
        Booking_Status = 'Success';
        
#1. Retrive all successful bookings:
SELECT 
    *
FROM
    successful_bookings;

#2. find the average ride distance for each vehicle type:
SELECT 
    Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM
    ola_ride_data
GROUP BY Vehicle_Type;

#3.get the total number of canceled rides by customers:
SELECT 
    COUNT(*) AS canceled_ride_by_customers
FROM
    ola_ride_data
WHERE
    Booking_Status = 'Canceled By Customer';

#4. List the top 5 customers who booked the highest number of rides:
SELECT 
    Customer_ID, COUNT(Booking_ID) AS total_rides
FROM
    ola_ride_data
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

#5. Get the number of rides canceled by drivers dur to personal and car-related issues:
SELECT 
    COUNT(*) AS Canceled_By_Drivers
FROM
    ola_ride_data
WHERE
    Canceled_Rides_by_Driver = 'Personal & Car related issue';
    
# 6. find the maximum and minumum driver ratings for Prime Sedan Bookings:
SELECT 
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    ola_ride_data
WHERE
    Vehicle_Type = 'Prime Sedan';
    
#7. Retrive all rides where payment was made using UPI:
SELECT 
    *
FROM
    ola_ride_data
WHERE
    Payment_Method = 'UPI';
    
#8. Find the average customer rating per vehicle type:
SELECT 
    Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM
    ola_ride_data
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
SELECT 
    SUM(Booking_Value) AS total_successful_ride_value
FROM
    ola_ride_data
WHERE
    Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
SELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    ola_ride_data
WHERE
    Incomplete_Rides = 'Yes';
    
#11. Top 5 Customers with most bookings

SELECT 
    Customer_ID, COUNT(*) AS total_bookings
FROM
    ola_ride_data
GROUP BY Customer_ID
ORDER BY total_bookings DESC
LIMIT 5;

#12. Average distance per vehicle type

SELECT 
    Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM
    ola_ride_data
GROUP BY Vehicle_Type;


#13. percentage of each cancellation type
SELECT 
    Booking_Status,
    COUNT(*) * 100.0 / (SELECT 
            COUNT(*)
        FROM
            ola_ride_data) AS percentage
FROM
    ola_ride_data
GROUP BY Booking_Status;

#14. Success count per vehicle type
SELECT 
    Vehicle_Type, COUNT(*) AS success_count
FROM
    ola_ride_data
WHERE
    Booking_Status = 'Success'
GROUP BY Vehicle_Type
ORDER BY success_count DESC;

#15. Days with max bookings
SELECT 
    Date, COUNT(*) AS total
FROM
    ola_ride_data
GROUP BY Date
ORDER BY total DESC;

#16. Total distance traveled per day
SELECT 
    Date, SUM(Ride_Distance) AS total_disctance
FROM
    ola_ride_data
GROUP BY Date
ORDER BY Date;

#17. all "driver not found' bookings
SELECT 
    *
FROM
    ola_ride_data
WHERE
    Booking_Status = 'Driver Not Found';

#18. customers with atleasr 3 canceled bookings
SELECT 
    Customer_ID, COUNT(*) AS cancellations
FROM
    ola_ride_data
WHERE
    Booking_Status LIKE 'Canceled%'
GROUP BY Customer_ID
HAVING COUNT(*) >= 3;






    
