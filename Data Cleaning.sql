-- data cleaning

use world_layoffs;
select * from layoffs;

-- 1 REMOVE DUPLICATES
-- 2 STANDARDIZE THE DATA
-- 3 NULL VALUES OR BLANK VALUES
-- 4 REMOVE ROWS AND COLUMNS WHICH ARE NOT NECESSARY


-- 1 REMOVE DUPLICATES

create table layoffs_staging
like layoffs;

insert into layoffs_staging
select  * from layoffs;

select * from layoffs_staging;



select distinct *
from layoffs_staging;


create table layoffs_staging2
select distinct *
from layoffs_staging;

select * from layoffs_staging2;

-- standardising data

select trim(company) from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select distinct(industry)
from layoffs_staging2
order by industry;

select * from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';

select * from layoffs_staging2;

select distinct country from layoffs_staging2
order by 1;

select distinct(country) , trim(trailing '.' from country)
from layoffs_staging2
order by country;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'united%';

select distinct(country) from layoffs_staging2
order by country;

select * from layoffs_staging2;

select date , str_to_date(`date`,'%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

-- null/blank values

select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select * from layoffs_staging2
where industry is null 
or industry = '';

select * from layoffs_staging2
where company = 'Airbnb';

update layoffs_staging2
set industry = 'Travel'
where company = 'Airbnb';

select t1.industry , t2.industry from layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company
where t1.industry is null 
and t2.industry is not null;

update layoffs_staging2
set industry = null
where industry='';

update layoffs_staging2 t1
join layoffs_staging2 t2 
on t1.company=t2.company
set t1.industry =t2.industry 
where t1.industry is null 
and t2.industry is not null;


-- remove unneccesary data

select * from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;





