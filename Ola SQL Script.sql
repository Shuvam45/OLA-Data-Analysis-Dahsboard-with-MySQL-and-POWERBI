-- --1. Retrieve all successful bookings:
use ola;
create view successful_bookings as
select * from bookings
where Booking_Status="Success";

select * from successful_bookings;

--  2. Find the average ride distance for each vehicle type:

create view Ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_distance
from bookings
group by Vehicle_Type;

select * from Ride_distance_for_each_vehicle;

--  3. Get the total number of cancelled rides by customers:

create view canceled_by_customer as
select count(*) from bookings
where Booking_Status="Canceled By Customer";

select * from canceled_by_customer;

--  4. List the top 5 customers who booked the highest number of rides:

create view top_5_rides as
select Customer_ID, count(BOOKING_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides DESC limit 5;

select * from top_5_rides;


--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view number_of_rides_canceled_by_driver as
select count(Booking_ID), Canceled_Rides_by_Driver as rides_canceled_by_driver
from bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";

select * from number_of_rides_canceled_by_driver;

--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_min_driver_rating as
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating
from bookings
where Vehicle_Type="Prime Sedan";

select * from max_min_driver_rating;

--  7. Retrieve all rides where payment was made using UPI:

create view upi_payment as
select * from bookings
where Payment_Method="UPI";

select * from upi_payment;

--  8. Find the average customer rating per vehicle type:

create view avg_customer_rating as
select Vehicle_Type, avg(Customer_Rating)
from bookings
group by Vehicle_Type;

select * from avg_customer_rating;

--  9. Calculate the total booking value of rides completed successfully

create view successful_value as
select sum(Booking_Value) as total_succesful_value
from bookings 
where Booking_Status="Success"; 

select * from successful_value;

--  10. List all incomplete rides along with the reason

create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides="Yes";

select * from Incomplete_Rides_Reason;


create database ola;
use ola;


