/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
*/

-- Solution : 
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

/*Query all columns (attributes) for every row in the CITY table.*/
-- Solution :
select * from city;