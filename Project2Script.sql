-- Project2Script.sql

USE skills;

DROP TABLE IF EXISTS GoogleData;
DROP TABLE IF EXISTS IndeedData;
DROP TABLE IF EXISTS KaggelData;

CREATE TABLE GoogleData (
  SkillType varchar(50),
  SkillName varchar(50),
  Rating varchar(5),
  Company varchar(5)
  );
    
LOAD DATA INFILE 'c:/data/GoogleData.csv' 
INTO TABLE GoogleData 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE xx SET xx = SUBSTRING(xx, 1, CHAR_LENGTH(xx)-1);

SELECT DISTINCT SkillType, SkillName, Rating, Company 
	FROM GoogleData; 

-- MySQL does not support the SELEC\T ... INTO ... syntax
-- We need to use the INSERT INTO ... SELECT .. syntax to accomplish it
-- Read more here.. http://dev.mysql.com/doc/refman/5.0/en/insert-select.html
-- Create table and insert IndeedData 
CREATE TABLE IndeedData (
  SkillType varchar(50),
  SkillName varchar(50),
  Rating varchar(5),
  Company varchar(5)
  );

LOAD DATA INFILE 'c:/data/IndeedData.csv' 
INTO TABLE IndeedData 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT DISTINCT SkillType, SkillName, Rating, Company 
	FROM IndeedData; 

-- Create table and insert KaggleData 
CREATE TABLE KaggleData (
  SkillType varchar(50),
  SkillName varchar(50),
  Rating varchar(5),
  Company varchar(5)
  );
    
LOAD DATA INFILE 'c:/data/KaggleData.csv' 
INTO TABLE KaggleData 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT DISTINCT SkillType, SkillName, Rating, Company 
	FROM KaggleData; 

-- SELECT ALL DATA FROM 3 DATAT SET
SELECT * FROM GoogleData 
UNION
SELECT * FROM IndeedData
UNION
SELECT * FROM KaggleData;

SELECT SkillType, SkillName, Rating,
		CASE
			WHEN Company = 1 THEN 'Google'
			ELSE 'NA'
		END AS Company
FROM GoogleData
UNION
SELECT SkillType, SkillName, Rating,
		CASE
			WHEN Company = 2 THEN 'Indeed'
			ELSE 'NA'
		END AS Company
FROM IndeedData
UNION
SELECT SkillType, SkillName, Rating,
		CASE
			WHEN Company = 3 THEN 'Kaggle'
			ELSE 'NA'
		END AS Company
FROM KaggleData;


