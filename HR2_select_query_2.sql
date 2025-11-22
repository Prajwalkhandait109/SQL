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

--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
-- Solution :
SELECT COUNT (CITY) -(SELECT COUNT (DISTINCT CITY) FROM STATION) FROM STATION;

--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
-- Solution:
/*
Enter your query here.
*/
(SELECT CITY, LENGTH(CITY)
 FROM STATION
 ORDER BY LENGTH(CITY), CITY
 LIMIT 1)
UNION ALL
(SELECT CITY, LENGTH(CITY)
 FROM STATION
 ORDER BY LENGTH(CITY) DESC, CITY
 LIMIT 1);
