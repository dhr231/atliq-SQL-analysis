USE moviesdb;
SELECT m.movie_id,title,budget,revenue,currency,unit,
CASE
	WHEN unit="thousands" THEN ROUND(((revenue-budget)/1000),1)
    WHEN unit="billions" THEN ROUND(((revenue-budget)*1000),1)
    ELSE ROUND((revenue-budget),1)
END as profit_mln
FROM movies m
JOIN financials f ON m.movie_id=f.movie_id
WHERE industry="Bollywood"
ORDER BY revenue DESC LIMIT 1;