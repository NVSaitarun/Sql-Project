--Removing duplicatess
select * from layoffs

select *, ROW_NUMBER() OVER ( partition by company,industry,total_laid_off,percentage_laid_off,date order by date ) as romnum from layoffs

with duplicate as (

select *, ROW_NUMBER() OVER ( partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,funds_raised_millions order by date ) rw_num from layoffs

)

select * from duplicate where rw_num>1

select * from layoffs where company = 'Oda'

select * from layoffs


--Standardising data

select distinct(trim(company)) from layoffs

select trim(company) as new_company from layoffs

select * from layoffs

update layoffs set company = TRIM(company)

select distinct(industry) from layoffs order by industry

select * from layoffs where industry like 'Crypto%'

update layoffs set industry = 'Crypto' where industry like 'Crypto%'


select distinct(country) from layoffs order by 1

update layoffs set country = TRIM(trailing '.' from country) where country like 'United States%'

select distinct(country) , TRIM(trailing '.' from country) from layoffs order by 1

select date from layoffs

select DATE, FORMAT(date,'MM/dd/yyyy') as new_date from layoffs

exec sp_help layoffs
use World_layoffs
go
select * from layoffs

select * from layoffs where percentage_laid_off is null

select * from layoffs where industry is null or industry =''

select * from layoffs t1 join layoffs t2 on t1.company = t2.company and t1.location=t2.location where (t1.industry is null or t1.industry = '') AND t2.industry is not null

UPDATE t1
SET t1.industry = t2.industry
FROM layoffs t1
INNER JOIN layoffs t2 ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '') 
AND t2.industry IS NOT NULL;

select * from layoffs where company like 'Bally%'

	select * from layoffs where industry is null or industry =''

select * from layoffs where total_laid_off ='' and percentage_laid_off is null

update layoffs set total_laid_off = ''
where total_laid_off ='NULL'

delete from layoffs where total_laid_off ='' and percentage_laid_off is null
