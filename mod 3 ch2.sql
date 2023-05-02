-- select actors who acted in any of these movies(101,110,121)
-- isko krne ke 2 method hain ek to using join or by using subquery
SELECT * FROM actors where actor_id= ANY(SELECT actor_id FROM movies WHERE movie_id IN (101,110,121));

-- join wala method

SELECT * FROM actors a
LEFT JOIN movie_actor ma USING(actor_id)
LEFT JOIN movies m USING(movie_id)
WHERE movie_id IN (101,110,121);


-- select all movies whose rating is greater than *any* of the marvel movies.

SELECT * FROM movies WHERE imdb_rating>ANY(SELECT imdb_rating FROM movies WHERE studio="Marvel Studios");
-- isko ek aur way mei likh skte hain

SELECT * FROM movies WHERE imdb_rating=ANY(SELECT MIN(imdb_rating) FROM movies WHERE studio="Marvel Studios");

-- select all movies whose rating is greater than *all* marvel movies.

SELECT * FROM movies WHERE imdb_rating> ALL(SELECT imdb_rating FROM movies WHERE studio="Marvel Studios");
-- isko ek aur way mei likh skte hain

SELECT * FROM movies WHERE imdb_rating= ALL(SELECT MAX(imdb_rating) FROM movies WHERE studio="Marvel Studios");
