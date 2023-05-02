SELECT title, revenue, currency, unit,
CASE 
	WHEN unit="Billions" THEN ROUND((revenue*1000),1)
    WHEN unit="Thousands" THEN ROUND((revenue/1000),1)
    ELSE revenue
END as revenue_mln FROM movies m
JOIN languages l USING (language_id)
JOIN financials f USING(movie_id)
WHERE l.name="Hindi"
ORDER BY revenue_mln DESC