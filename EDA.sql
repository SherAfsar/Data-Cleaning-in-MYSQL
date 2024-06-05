use data_cleaning;
select *
from layoffs2;


-- Find the maximum total_laid_off and min of percentage_laid_off
Select max(total_laid_off), min(percentage_laid_off)
from layoffs2; 


-- calculate sum of total_laid_off for each company where sum is not null ordered in ascending order
select sum(total_laid_off) as result
from layoffs2
group by company
Having result is not null
order by result;


-- Determine the funds raised by each company for each month
select company, substring(date, 6, 2) as month, sum(funds_raised_millions) as funds_raised
from layoffs2
group by company, month;


-- What is the average number of layoffs per year for each company, and how does it vary by year, ordered alphabetically by company name?
select company, year(date) as date, avg(total_laid_off) as avg
from layoffs2
group by company, date
order by company;


-- How can we find the total number of layoffs for each company by month, considering only records where the month is not null?
select company, substring(date, 1, 7) as month, sum(total_laid_off) as sum_laid_off
from layoffs2
group by company, month
having month is not null ;