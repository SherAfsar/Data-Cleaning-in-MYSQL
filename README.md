# Data-Cleaning-in-MYSQL
This GitHub repository contains a comprehensive Data Cleaning and Exploratory Data Analysis (EDA) project using MySQL. The project aims to prepare raw data for analysis through a series of systematic steps. Initially, the database is set up, and raw data is imported. Duplicate records are identified and removed using row numbers and Common Table Expressions (CTEs).The data is then standardized: leading blank spaces in the company column are removed, values in the industry and country columns are corrected, and the date column is converted from text to a proper date format. Null and blank values are addressed by replacing blanks with nulls and filling missing industry values based on matching company and location information.Finally, rows with null values in critical columns are deleted, and unnecessary columns, such as the temporary row number column used for duplicate removal, are dropped. This project ensures the data is clean, consistent, and ready for further analysis or application. After the data was cleaned, Exploratory Data Analysis (EDA) was performed by answering different queries. 

## Dataset
The original dataset contains 2362 rows and includes columns such as 'Company', 'Location', 'Industry', 'Total Laid Off', 'Percentage Laid Off', 'Date', 'Stage', 'Country', and 'Funds Raised (Millions)'. After cleaning the dataset, the updated dataset cut down to 1995 rows and the number of columns remained consistent. The dataset is uploaded and can be found here:

https://github.com/SherAfsar/Data-Cleaning-in-MYSQL/blob/main/layoffs.csv

## MYSQL File
The MYSQL files are uploaded as well. It can be found here: 

https://github.com/SherAfsar/Data-Cleaning-in-MYSQL/blob/main/Data%20Cleaning.sql

https://github.com/SherAfsar/MYSQL-Data-Cleaning-and-EDA/blob/main/EDA.sql


## Data Cleaning Steps
The following steps have been followed to clean the the dataset in MYSQL.

- Setting up a Database and Tables: First, I created a database and imported the raw data into it, confirming that the import was successful. Next, I made a copy of the current table and inserted all values from the original table into this new copy. This sequence of steps marks the beginning of the MySQL data cleaning project.

- Removed Duplicates: First, I uniquely assigned a row number to each record partitioned by all columns. Then, I used a CTE to identify if there were duplicates. Since data cannot be deleted through a CTE, I created an exact copy of the table with an extra column of integer datatype to represent the row number data. Afterward, I inserted all values from the original table along with the row number using a window function. With this new table, I deleted the duplicates by filtering through the newly added column and confirmed the removal. This process effectively removed duplicates from the dataset.

- Standardized the Data: First, I removed the leading blank spaces from the company column and updated the table. Next, I updated the industry column, changing Crypto% to Crypto and confirmed the change. Following that, I updated the country column, changing united states. to united states and confirmed it. Finally, I converted the date column from text datatype to a proper date format, updated the table, and then changed the column's datatype to date datatype. This completed the necessary data cleaning for these specific columns.

- Removing null and Blank values: First, I checked the industry column for all blanks and null values. Then, I replaced all blanks with null values. Next, I identified rows where the company and location columns had similar values but the industry was missing in one row and present in another. To fill the missing industry values with the existing ones, I first checked for these scenarios using a join. After confirming the scenarios, I used an update statement to fill in the missing industry values and verified the changes specifically for the company "Airbnb". This ensured that missing industry data was accurately filled based on existing values.

- Dropping unnecessary columns: First, I deleted all rows where total_laid_off and percentage_laid_off were null. Then, I dropped the row_num column that was created earlier. This cleaned up the dataset by removing incomplete records and unnecessary columns.

## Exploratory Data Analysis (EDA)
Following questions have been answered in EDA:

- Find the maximum total_laid_off and min of percentage_laid_off.

- calculate sum of total_laid_off for each company where sum is not null ordered in ascending order.

- Determine the funds raised by each company for each month

- What is the average number of layoffs per year for each company, and how does it vary by year, ordered alphabetically by company name?

- How can we find the total number of layoffs for each company by month, considering only records where the month is not null?

- Besides the questions mentioned here, the cleaned data was thoroughly investigated to identify various aspects. However, those details were not included as they were trivial and held no significance.

## Learning from this Project

- It is good practice to keep a copy of the original dataset for various reasons.

- You cannot update a CTE in MySQL because it is a temporary table or query and does not affect the original data.

- We use the row number with partitioning because the partition represents a group of rows that have the same values in the specified columns.

- Avoid using reserved keywords as column names.

- When copying data from one table and inserting it into another, ensure the column order and their data types match.

- Replacing blanks with null values is a good practice because null values are handled more efficiently than blanks.


## 🚀 About Me
Highly skilled Data Analyst with 2 years of experience in leveraging data-driven insights to inform strategic decision-making. Proficient in SQL, Python, and advanced Excel, with a strong background in data visualization tools such as Tableau. Demonstrated expertise in data cleaning, analysis, and interpretation to support business objectives and drive efficiency. Adept at translating complex datasets into actionable insights and effective business solutions. Passionate about continuous learning and staying updated with industry trends to deliver innovative analytical solutions. 

Feel free to connect on LinkedIn

LinkedIn Profile: https://www.linkedin.com/in/sherafsardataanalyst/
