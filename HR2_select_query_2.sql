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

--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
--Solution :
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE '%a'
   OR CITY LIKE '%e'
   OR CITY LIKE '%i'
   OR CITY LIKE '%o'
   OR CITY LIKE '%u';
   
--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
--Solution :
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%' 
       OR CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%')
  AND (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U'
       OR CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');

--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
--Solution :
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%'
  AND CITY NOT LIKE 'E%'
  AND CITY NOT LIKE 'I%'
  AND CITY NOT LIKE 'O%'
  AND CITY NOT LIKE 'U%'
  AND CITY NOT LIKE 'a%'
  AND CITY NOT LIKE 'e%'
  AND CITY NOT LIKE 'i%'
  AND CITY NOT LIKE 'o%'
  AND CITY NOT LIKE 'u%';

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
--Solution :
select distinct city from station 
where city like 'A%'
or city like 'E%'
or city like 'I%'
or city like 'O%'
or city like 'U%'
or city like 'a%'
or city like 'e%'
or city like 'i%'
or city like 'o%'
or city like 'u%';

-- Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
-- Solution :
select distinct city from station 
where city not like '%a'
and city not like '%e'
and city not like '%i'
and city not like '%o'
and city not like '%u';

--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
-- Solution:
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND CITY NOT LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%'
       AND CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%')
   OR (CITY NOT LIKE '%A' AND CITY NOT LIKE '%E' AND CITY NOT LIKE '%I' AND CITY NOT LIKE '%O' AND CITY NOT LIKE '%U'
       AND CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u');

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
-- Solution :
SELECT distinct city from station 
where 
city not like 'a%'
and city not like 'e%'
and city not like 'i%'
and city not like 'o%'
and city not like 'u%'
and city not like '%a'
and city not like '%e'
and city not like '%i'
and city not like '%o'
and city not like '%u';

-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
-- Solution :
SELECT Name from STUDENTS
where Marks > 75
ORDER BY RIGHT (Name,3), ID ;

-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
-- Solution :
select name from Employee 
order by name asc;

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
-- Solution :
select name from Employee
where salary > 2000 and months < 10
order by employee_id asc;

/*Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.*/
-- Solution :
SELECT
    CASE
        WHEN A + B <= C OR B + C <= A OR A + C <= B THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A = C THEN 'Isosceles'
        ELSE 'Scalene'
    END AS TriangleType
FROM TRIANGLES;
