-- Setting up a database and data

create database data_cleaning; 

use data_cleaning;

create table layoffs1
like layoffs;

insert into layoffs1
select *
from layoffs;

select *
from layoffs1;

-- Removing Duplicates

select *,
row_number() over (partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs1;

With finding_duplicates as 
(
select *,
row_number() over (partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs1)
select *
from finding_duplicates
where row_num > 1;

CREATE TABLE `layoffs2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs2
select *,
row_number() over (partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs1;

select *
from layoffs2;

DELETE
from layoffs2
where row_num > 1;

select *
from layoffs2
where row_num > 1;

-- Standarize Data

select *
from layoffs2;

UPDATE layoffs2
SET company = TRIM(LEADING ' ' FROM company);

select distinct company
from layoffs2;

update layoffs2
set industry = 'Crypto'
where industry like 'Crypto%';

select *
from layoffs2
where industry like 'Crypto%';


update layoffs2
set country = 'United States'
where country like 'united states%';

select country
from layoffs2
where country = 'united states.';

select date,
STR_TO_DATE(date, '%m/%d/%Y') as formatted_date
from layoffs2;

update layoffs2
set date = STR_TO_DATE(date, '%m/%d/%Y');

select date
from layoffs2;

alter table layoffs2
modify date DATE;

-- Removing Null and Blank values

select *
from layoffs2
where industry is null 
or
industry = '';

update layoffs2
set industry = NULL
where industry = '';

select industry
from layoffs2
where industry is null;

select *
from layoffs2 t1
Join layoffs2 t2
on t1.company = t2.company
AND t1.location = t2.location
where t1.industry is null
and t2.industry is not null;

update layoffs2 t1
Join layoffs2 t2
on t1.company = t2.company
AND t1.location = t2.location
set t1.industry = t2.industry 
where t1.industry is null
and t2.industry is not null;

select *
from layoffs2
where company = 'Airbnb';

-- Deleting rows and dropping column
delete 
from layoffs2
where total_laid_off is null
AND percentage_laid_off is null;

alter table layoffs2
drop column row_num;

select *
from layoffs;

select *
from layoffs2;




