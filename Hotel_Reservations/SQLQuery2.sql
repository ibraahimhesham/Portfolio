ALTER TABLE hotel_data ADD standardized_date DATE;
UPDATE hotel_data
SET standardized_date = CASE
    WHEN ISDATE(arrival_date) = 1 THEN CAST(arrival_date AS DATE)
    WHEN arrival_date LIKE '%/%/%' THEN 
        CASE 
            WHEN TRY_CONVERT(DATE, arrival_date, 101) IS NOT NULL THEN TRY_CONVERT(DATE, arrival_date, 101)  -- MM/DD/YYYY
            WHEN TRY_CONVERT(DATE,arrival_date, 103) IS NOT NULL THEN TRY_CONVERT(DATE, arrival_date, 103)  -- DD/MM/YYYY
        END
    WHEN arrival_date LIKE '%-%-%' THEN 
        CASE 
            WHEN TRY_CONVERT(DATE, arrival_date, 120) IS NOT NULL THEN TRY_CONVERT(DATE, arrival_date, 120)  -- YYYY-MM-DD
            WHEN TRY_CONVERT(DATE, arrival_date, 105) IS NOT NULL THEN TRY_CONVERT(DATE, arrival_date, 105)  -- DD-MM-YYYY
        END
    ELSE NULL
END;
SELECT * FROM hotel_data;