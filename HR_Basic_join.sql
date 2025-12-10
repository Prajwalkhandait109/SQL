/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
--Solution :
select sum(city.population) from  city
inner join country on city.countrycode = country.code
where continent = "Asia";

/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

*/
--Solution :
select city.name from city
inner join country on city.countrycode = country.code
where continent = "Africa";

/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

*/
-- Solution :
SELECT
    country.continent,
    FLOOR(AVG(city.population)) AS avg_population
FROM country
inner JOIN city
    ON country.code = city.countrycode
GROUP BY country.continent;

/*
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.
*/
-- Solution :
SELECT 
    CASE 
        WHEN g.grade >= 8 THEN s.name 
        ELSE 'NULL' 
    END AS Name,
    g.grade AS Grade,
    s.marks AS Mark
FROM students s
JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY 
    g.grade DESC,
    CASE 
        WHEN g.grade >= 8 THEN s.name 
    END ASC,
    s.marks ASC;
