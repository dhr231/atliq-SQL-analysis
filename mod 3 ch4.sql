-- Common Table Expression
WITH actorsAgeTable (actor_name,actors_age) AS -- hum isme column names ko as a parameter bhi daal skte hain. but fir subquery ke bahar inhi naam se use krna hoga
(SELECT name,YEAR(CURDATE())-birth_year AS age FROM actors)

SELECT actor_name,actors_age FROM actorsAgeTable
WHERE actors_age BETWEEN 65 AND 80;

# movies that produced 500 % profit and their rating was less than avg rating for all movies
WITH profitTable AS
(SELECT *,
(((revenue-budget)/budget)*100) as profitPct 
FROM financials),

avgRatingTable AS
(SELECT * FROM movies
WHERE imdb_rating<(SELECT AVG(imdb_rating) FROM movies))

SELECT p.movie_id,title,revenue,profitPct,imdb_rating
FROM profitTable p
JOIN avgRatingTable USING(movie_id)
WHERE profitPct>500;