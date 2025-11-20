/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
*/

-- Solution : 
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

/*Query all columns (attributes) for every row in the CITY table.*/
-- Solution :
select * from city;

-- Query all columns for a city in CITY with the ID 1661.
-- Solution :
select * from city
where ID = 1661;

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
-- Solution :
select * from CITY
where COUNTRYCODE = 'JPN';

-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
-- Solution :
select NAME from city
where COUNTRYCODE = 'JPN';

-- Query a list of CITY and STATE from the STATION table.
--Solution :
SELECT CITY, STATE FROM STATION;

--Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
-- Solution :
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;

--