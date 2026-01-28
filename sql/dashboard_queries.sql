/* =========================
   KPI METRICS
========================= */

-- KPI: Average Booking Value
SELECT AVG(total_amount) AS avg_booking_value
FROM GOLD_BOOKING_CLEAN;

-- KPI: Total Guests
SELECT SUM(num_guests) AS total_guests
FROM GOLD_BOOKING_CLEAN;

-- KPI: Total Bookings
SELECT COUNT(*) AS total_bookings
FROM GOLD_BOOKING_CLEAN;

-- KPI: Total Revenue
SELECT SUM(total_amount) AS total_revenue
FROM GOLD_BOOKING_CLEAN;


/* =========================
   TIME SERIES ANALYSIS
========================= */

-- Monthly Revenue Trend
SELECT date, total_revenue
FROM GOLD_AGG_DAILY_BOOKING
ORDER BY date;

-- Monthly Booking Trend
SELECT date, total_booking
FROM GOLD_AGG_DAILY_BOOKING
ORDER BY date;


/* =========================
   CATEGORY ANALYSIS
========================= */

-- Top Cities by Revenue
SELECT hotel_city, total_revenue
FROM GOLD_AGG_HOTEL_CITY_SALES
WHERE total_revenue IS NOT NULL
ORDER BY total_revenue DESC
LIMIT 5;

-- Bookings by Status
SELECT booking_status, COUNT(*) AS total
FROM GOLD_BOOKING_CLEAN
GROUP BY booking_status;

-- Bookings by Room Type
SELECT room_type, COUNT(*) AS total_bookings
FROM GOLD_BOOKING_CLEAN
GROUP BY room_type
ORDER BY total_bookings DESC;
