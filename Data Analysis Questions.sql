-- QUESTIONS

-- 1. What is the gender breakdown of employees in the company?
SELECT 
    COUNT(CASE WHEN gender = 'Male' THEN 1 END) AS Male,
    COUNT(CASE WHEN gender = 'Female' THEN 1 END) AS Female,
    COUNT(CASE WHEN gender = 'Non-Conforming' THEN 1 END) AS Neutral,
    CONCAT(ROUND((COUNT(CASE WHEN gender = 'Male' THEN 1 END) / COUNT(*) * 100), 1), '%') AS Male_Percentage,
    CONCAT(ROUND((COUNT(CASE WHEN gender = 'Female' THEN 1 END) / COUNT(*) * 100),1), '%') AS Female_Percentage,
    CONCAT(ROUND((COUNT(CASE WHEN gender = 'Non-Conforming' THEN 1 END) / COUNT(*) * 100),1), '%') AS Neutral_Percentage
FROM hr
WHERE termdate = '000-00-00';

SELECT 
	gender, 
    COUNT(*) AS total_employees FROM hr
WHERE termdate = '0000-00-00' 
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT 
	race, 
	COUNT(*) AS count 
FROM hr
WHERE termdate = '0000-00-00' 
GROUP BY race
ORDER BY count DESC;

-- 3. What is the age distribution of employees in the company?
SELECT 
	MIN(age) as youngest,
    MAX(age) as oldest
FROM hr;

SELECT 
	(CASE 
		WHEN age >= 18 AND age <= 24 THEN '18-24'
		WHEN age >= 25 AND age <= 34 THEN '25-34'
		WHEN age >= 35 AND age <= 44 THEN '35-44'
		WHEN age >= 45 AND age <= 54 THEN '45-54'
        WHEN age >= 55 AND age <= 64 THEN '55-64'
		ELSE '65+' 
	END) AS age_group,
    COUNT(*) AS count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;

SELECT 
	(CASE 
		WHEN age >= 18 AND age <= 24 THEN '18-24'
		WHEN age >= 25 AND age <= 34 THEN '25-34'
		WHEN age >= 35 AND age <= 44 THEN '35-44'
		WHEN age >= 45 AND age <= 54 THEN '45-54'
        WHEN age >= 55 AND age <= 64 THEN '55-64'
		ELSE '65+' 
	END) AS age_group,
    gender,
    COUNT(*) AS count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY age_group, gender
ORDER BY age_group, gender;
-- 4. How many employees work at headquarters versus remote locations?
SELECT 
	location, 
    COUNT(*) AS count 
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY location
ORDER BY count DESC; 

-- 5. What is the average length of employment for employees who have been terminated?
SELECT 
	ROUND(AVG(datediff(termdate, hire_date))/365,0) AS avg_length_employment
FROM hr
WHERE termdate <= curdate() AND termdate <> '0000-00-00';

-- 6. How does the gender distribution vary across departments and job titles?
SELECT 
	department,
    jobtitle,
    gender,
    COUNT(*) AS total_employee
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY gender, jobtitle, department
ORDER BY department, jobtitle, gender;

-- 7. What is the distribution of job titles across the company?
SELECT 
	jobtitle, 
    COUNT(*) as total_employee
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle;

-- 8. Which department has the highest turnover rate?
WITH cte AS ( 
	SELECT 
		department, 
        COUNT(*) AS total_count,
        SUM(CASE WHEN termdate != '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS total_terminated
	FROM hr
    GROUP BY department
)
SELECT 
	department, 
    total_count,
    total_terminated,
    ROUND((total_terminated/total_count) * 100, 1) AS termination_rate
FROM cte
GROUP BY department
ORDER BY termination_rate DESC;

-- 9. What is the distribution of employees across locations by city and state?
SELECT 
	location_state,
	location_city, 
    COUNT(*) AS count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY location_city, location_state
ORDER BY location_state, location_city;

SELECT 
	location_state,
    COUNT(*) AS count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY location_state
ORDER BY count DESC;

-- 10. How has the company's employee count changed over time based on hire and term dates?
WITH cte AS (
	SELECT 
		YEAR(hire_date) AS year,
        COUNT(*) AS hires,
        SUM(CASE WHEN termdate != '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS total_terminated
	FROM hr
    GROUP BY YEAR(hire_date)
)

SELECT 
	year,
    hires,
	total_terminated,
    hires - total_terminated AS net_change,
    ROUND((hires - total_terminated)/hires * 100, 2) AS net_change_percent
FROM cte
ORDER BY year;

-- 11. What is the tenure distribution for each department?
SELECT
	department, 
    ROUND(AVG(datediff(termdate, hire_date)/365),0) AS avg_tenure
FROM hr
WHERE termdate <= CURDATE() AND termdate != '0000-00-00'
GROUP BY department;