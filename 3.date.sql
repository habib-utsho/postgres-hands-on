-- SHOW timezone;
-- SELECT NOW();
-- SELECT NOW() :: date; --current date
-- SELECT NOW() :: time; --current time
-- SELECT CURRENT_TIME; --current time

-- SELECT to_char(NOW(), 'dd-mm-yyyy'); -- days with format
-- SELECT to_char(NOW(), 'DDD'); -- th days in this year

-- SELECT age(CURRENT_DATE, '2000-05-05'); -- Total age

SELECT extract(year from '2026-05-05' :: date); -- extract month, date or year


-- create table timeZ (
--     timestamp_without_timezone TIMESTAMP WITHOUT TIME ZONE, timestamp_with_timezone TIMESTAMP WITH TIME ZONE
-- )

-- INSERT INTO timeZ (timestamp_without_timezone, timestamp_with_timezone)
--     VALUES('2026-04-15 17:41:53', '2026-04-15 17:41:53')

-- SELECT * FROM timeZ;