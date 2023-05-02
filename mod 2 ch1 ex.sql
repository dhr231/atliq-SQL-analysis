SELECT movie_id,title,name FROM movies m
INNER JOIN languages l
USING (language_id);

SELECT title FROM movies m
INNER JOIN languages l
USING (language_id)
WHERE name="Telugu";

SELECT name,COUNT(*) FROM movies m
INNER JOIN languages l
USING (language_id)
GROUP BY name;



