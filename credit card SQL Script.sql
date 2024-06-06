CREATE DATABASE credit_card_database; 

USE credit_card_database;

-- Import the table 1 using Table Data Import Wizard

-- Checking data types of  column
DESCRIBE credit_card;

-- Change table name 
RENAME TABLE credit_card TO credit_card_detail;

-- change Columns name
ALTER TABLE credit_card_detail CHANGE `Use Chip` `Use_Chip` VARCHAR(10);
ALTER TABLE credit_card_detail CHANGE `Exp Type` `Exp_Type` VARCHAR(50);


-- Drop temp_date column 
ALTER TABLE credit_card_detail
DROP COLUMN temp_date;

-- Add the temp_date column
ALTER TABLE credit_card_detail ADD temp_date DATE;

-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Perform the update
UPDATE credit_card_detail 
SET temp_date = STR_TO_DATE(Week_Start_Date, '%d-%m-%Y');

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;


-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Perform the update
UPDATE credit_card_detail 
SET Week_Start_Date = temp_date;

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;


-- Drop the temp_date column
ALTER TABLE credit_card_detail DROP COLUMN temp_date;


-- Chnage data Type of Columns
ALTER TABLE credit_card_detail MODIFY Card_Category VARCHAR(20);
ALTER TABLE credit_card_detail MODIFY Week_Start_Date  DATE;
ALTER TABLE credit_card_detail MODIFY Week_Num  VARCHAR(20);
ALTER TABLE credit_card_detail MODIFY Qtr  VARCHAR(10);
ALTER TABLE credit_card_detail MODIFY Credit_Limit  DECIMAL(10,2);
ALTER TABLE credit_card_detail MODIFY Avg_Utilization_Ratio  DECIMAL(10,3);
ALTER TABLE credit_card_detail MODIFY Use_Chip  VARCHAR(10);
ALTER TABLE credit_card_detail MODIFY Exp_Type  VARCHAR(50);

-- Import the table 2 using Table Data Import Wizard

-- Now connect our database with Power BI





