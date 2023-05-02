SELECT * FROM movies
WHERE release_year IN ((SELECT MAX(release_year) FROM movies),(SELECT MIN(release_year) FROM movies))
ORDER BY release_year;

SELECT * FROM movies
WHERE imdb_rating>(SELECT AVG(imdb_rating) FROM movies);