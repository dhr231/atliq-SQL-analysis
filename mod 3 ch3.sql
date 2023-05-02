-- Select the actor id,actor name and the total number of movies they acted in.
-- join method
SELECT actor_id,name,COUNT(movie_id) as movies_count FROM actors
JOIN movie_actor ma USING(actor_id)
JOIN movies m USING(movie_id)
GROUP BY actor_id
ORDER BY actor_id;

-- subquery method
SELECT actor_id,name,
(SELECT COUNT(movie_id) FROM movie_actor WHERE actor_id=actors.actor_id) as movies_count FROM actors
ORDER BY movies_count DESC;