-- Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit.

-- profit table subquery function 
WITH profitTable(movie_id,profit) AS
(SELECT movie_id,(revenue-budget) FROM financials),

-- movies table subquery function
after2k AS
(SELECT * FROM movies
WHERE release_year>2000 AND industry="Hollywood")


-- main function
SELECT title,release_year,industry,profit 
FROM after2k
JOIN profitTable USING(movie_id)
WHERE profit>500;	