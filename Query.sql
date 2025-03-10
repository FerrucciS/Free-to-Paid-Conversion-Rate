USE db_course_conversions;

WITH base_table AS(
	SELECT
		si.student_id,
		si.date_registered,
		MIN(se.date_watched) AS first_date_watched,
		MIN(sp.date_purchased) AS first_date_purchased,
		DATEDIFF(MIN(se.date_watched), si.date_registered) AS date_diff_reg_watch,
		DATEDIFF(MIN(sp.date_purchased), MIN(se.date_watched)) AS date_diff_watch_purch
	FROM student_engagement se
	JOIN student_info si ON se.student_id = si.student_id
	LEFT JOIN student_purchases sp ON se.student_id = sp.student_id
	GROUP BY se.student_id
	HAVING first_date_watched <= first_date_purchased OR first_date_purchased IS NULL
)

SELECT
	-- *,
	ROUND((COUNT(date_diff_watch_purch)/COUNT(first_date_watched)) * 100, 
		2) AS conversion_rate,
	ROUND((SUM(date_diff_reg_watch)/COUNT(first_date_watched)),
		2) AS av_reg_watch,
	ROUND((SUM(date_diff_watch_purch)/COUNT(first_date_purchased)),
		2) AS av_watch_purch
FROM base_table;
-- WHERE student_id = 268727




-- New query to find analytics based on each quarter.

WITH base_table AS(
	SELECT
		si.student_id,
		si.date_registered,
		MIN(se.date_watched) AS first_date_watched,
		MIN(sp.date_purchased) AS first_date_purchased,
		DATEDIFF(MIN(se.date_watched), si.date_registered) AS date_diff_reg_watch,
		DATEDIFF(MIN(sp.date_purchased), MIN(se.date_watched)) AS date_diff_watch_purch
	FROM student_engagement se
	JOIN student_info si ON se.student_id = si.student_id
	LEFT JOIN student_purchases sp ON se.student_id = sp.student_id
	GROUP BY se.student_id
	HAVING first_date_watched <= first_date_purchased OR first_date_purchased IS NULL
)

SELECT
	QUARTER(date_registered) as quart_registered,
	COUNT(QUARTER(date_registered)) OVER (PARTITION BY QUARTER(date_registered)) as count_quart_reg,
    QUARTER(first_date_watched) as quart_watched,
    COUNT(QUARTER(first_date_watched)) OVER (PARTITION BY QUARTER(first_date_watched)) as count_quart_watch,
    QUARTER(first_date_purchased) as quart_purch,
    COUNT(QUARTER(first_date_purchased)) OVER (PARTITION BY QUARTER(first_date_purchased)) as count_quart_purch
FROM base_table
