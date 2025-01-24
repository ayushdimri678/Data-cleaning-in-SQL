**OVERVIEW**

This project involves cleaning and standardizing a database named world_layoffs, which contains details about different companies and the layoffs they have done. The main table in the database is named layoffs. The project is divided into four key steps:

1.REMOVING DUPLICATES

2.	STANDARDIZING DATA
   
4.	POPULATING NULL AND BLANK VALUES
   
6.	REMOVING UNNECESSARY ROWS AND COLUMNS

**REMOVING DUPLICATES**

•	Backup Creation: A copy of the raw data is created to preserve the original dataset. This allows us to roll back in case of errors. The backup table is named layoff_staging.

•	Removing Duplicates: Duplicate rows are identified and removed using the DISTINCT function. A new table, layoffs_staging2, is created, which excludes duplicate rows to ensure data integrity.



**STANDARDIZING DATA**

Standardizing data involves resolving inconsistencies and formatting issues to improve data quality. The following actions were performed:

1.	Removing Unnecessary Spaces:
o	The TRIM function is used to eliminate extra spaces in the company field.

3.	Resolving Inconsistencies:
o	Entries like crypto and cryptocurrency in the industry field are standardized to crypto.
o	A combination of UPDATE and LIKE statements is used to perform this transformation.

5.	Fixing Field Format:
o	Inconsistent entries in the country field (e.g., United States. with a trailing period) are corrected.
o	The TRIM and TRAILING functions are used to remove unwanted characters, and the data is updated accordingly.

7.	Converting Date Field Data Type:
o	The date field, stored as a string, is converted to a proper DATE data type.
o	The STR_TO_DATE function is used for conversion, followed by altering the table to update the field’s data type.




**POPULATING NULL AND BLANK VALUES**

Filling missing values is crucial for maintaining data quality.
•	The industry field contained some null values. These were populated using information already present in the dataset, identified through analysis. The UPDATE statement was used to resolve this issue effectively.

**REMOVING UNNECESSARY ROWS AND COLUMNS**
The layoffs_staging2 table was further improved by removing irrelevant data:
•	Columns total_laid_off and percentage_laid_off are essential for analysis.
•	Rows where both these columns contained null values were deleted, as they did not add value to the dataset. This was achieved using a combination of DELETE and WHERE statements.

