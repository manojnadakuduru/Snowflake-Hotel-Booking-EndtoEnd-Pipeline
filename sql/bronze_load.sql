CREATE OR REPLACE TABLE BRONZE_HOTEL_BOOKING (
    booking_id STRING,
    hotel_id STRING,
    hotel_city STRING,
    customer_id STRING,
    customer_name STRING,
    customer_email STRING,
    check_in_date STRING,
    check_out_date STRING,
    room_type STRING,
    num_guests STRING,
    total_amount STRING,
    currency STRING,
    booking_status STRING
);

COPY INTO BRONZE_HOTEL_BOOKING
FROM @hotel_booking_stage
FILE_FORMAT = (FORMAT_NAME = csv_file_format)
ON_ERROR = 'CONTINUE';
