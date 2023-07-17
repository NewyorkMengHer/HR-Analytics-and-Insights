DROP DATABASE IF EXISTS projects;
CREATE DATABASE projects;
SHOW DATABASES;
USE projects;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;

SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL 
END;

ALTER TABLE hr 
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL 
END;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

SET SQL_MODE = ' ';

ALTER TABLE hr 
MODIFY COLUMN termdate DATE;

ALTER TABLE hr
ADD COLUMN AGE INT;

ALTER TABLE hr
CHANGE AGE age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	MIN(age) AS youngest,
    MAX(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;   

DELETE FROM hr WHERE age < 18; 

SELECT * FROM hr;