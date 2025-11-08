USE hotel_reservation
--required1
SELECT COUNT(*) As number_of_reservations
FROM hotel_data
--required2
SELECT count(Booking_ID) AS count_of_each_type, type_of_meal_plan
FROM hotel_data
GROUP BY type_of_meal_plan
--required3
SELECT no_of_children,avg_price_per_room
FROM hotel_data
WHERE no_of_children > 0
--required4.1
SELECT COUNT(Booking_ID) as number_of_reservations_2018
FROM hotel_data
WHERE YEAR(standardized_date) = 2018
--required4.2
SELECT COUNT(Booking_ID) as number_of_reservations_2018
FROM hotel_data
WHERE YEAR(standardized_date) = 2017
--required5
SELECT count(Booking_ID), room_type_reserved
FROM hotel_data
GROUP BY room_type_reserved
--required6
SELECT COUNT(Booking_ID)
FROM hotel_data
WHERE no_of_weekend_nights > 0
--required7
SELECT MAX(lead_time) AS max_lead_time, MIN(lead_time) AS min_lead_time
FROM hotel_data
--required8
SELECT COUNT(Booking_ID), market_segment_type
FROM hotel_data
GROUP BY market_segment_type
--required9
SELECT COUNT(booking_status)
FROM hotel_data
WHERE booking_status = 'Not_Canceled'
--required10
SELECT SUM(no_of_adults) AS total_number_of_adults, SUM(no_of_children) AS total_number_of_children 
FROM hotel_data
--required11
SELECT Avg(no_of_weekend_nights) AS average_nights_in_weekend_including_children
FROM hotel_data
WHERE no_of_children != 0
--required12
select MONTH(standardized_date) As month_number,COUNT(Booking_ID) As Number_of_reservations
from hotel_data 
group by MONTH(standardized_date)
--required13
SELECT ROUND(AVG(no_of_weekend_nights),2) AS average_weekend_nights, ROUND(AVG(no_of_week_nights),2) AS average_week_nights, room_type_reserved
FROM hotel_data
GROUP BY room_type_reserved
--required14
SELECT top 1 COUNT(Booking_ID) AS NO_of_reservations_including_children, room_type_reserved ,AVG(avg_price_per_room) As Average_room_price
FROM hotel_data
WHERE no_of_children >0
GROUP BY room_type_reserved
order by  COUNT(Booking_ID) DESC 

--required15
SELECT market_segment_type, SUM(avg_price_per_room)
FROM hotel_data
GROUP BY market_segment_type