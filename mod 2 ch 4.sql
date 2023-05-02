SELECT 
            m.title,GROUP_CONCAT(a.name SEPARATOR " || ") as actors
	FROM movies m
	JOIN movie_actor ma ON m.movie_id=ma.movie_id
	JOIN actors a ON a.actor_id=ma.actor_id
	GROUP BY m.movie_id;
    
SELECT a.name, GROUP_CONCAT(m.title SEPARATOR " | "), COUNT(title) as TOTAL_MOVIES FROM actors a
JOIN movie_actor ma ON a.actor_id=ma.actor_id
JOIN movies m ON ma.movie_id=m.movie_id
GROUP BY a.actor_id
ORDER BY TOTAL_MOVIES DESC;
