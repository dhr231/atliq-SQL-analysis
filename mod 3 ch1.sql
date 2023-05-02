SELECT * FROM movies
WHERE imdb_rating=(SELECT max(imdb_rating) FROM movies); -- subquery for highest imdb

SELECT * FROM movies
WHERE imdb_rating IN ((SELECT max(imdb_rating) FROM movies),(SELECT min(imdb_rating) FROM movies)); -- multiple subqueries for highest and lowest imdb.

-- if we want to find out the actors whose age is between 60 and 80.
SELECT * FROM ((SELECT name,
YEAR(CURDATE())-birth_year AS age FROM actors) as actor_age_table) 
-- WHERE age BETWEEN 60 AND 80; this will throw error because age is a derived column which executes after WHERE clause. one way to execute this is by using HAVING clause or by creating a SUBQUERY.
WHERE age BETWEEN 60 AND 80;