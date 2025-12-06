/*

Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

*/

--Solution :
select concat(name,'(',left(Occupation,1),')')
from Occupations
order by name;

SELECT concat('There are a total of',' ', count(Occupation),' ',lower(Occupation),'s.' )
from Occupations 
group by Occupation
order by count(Occupation), lower(Occupation);



/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.

Note: Print NULL when there are no more names corresponding to an occupation.
*/

--Solution :
SELECT
MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
SELECT
Name,
Occupation,
ROW_NUMBER() OVER (
PARTITION BY Occupation
ORDER BY Name
) AS rn
FROM OCCUPATIONS
) AS t
GROUP BY rn
ORDER BY rn;