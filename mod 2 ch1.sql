SELECT m.movie_id,title,revenue,unit,currency 
FROM moviesdb.movies m    -- movies table left mein ho jaegi
INNER JOIN financials f   -- financials table right mein ho jaegi
ON m.movie_id=f.movie_id;

SELECT m.movie_id,title,revenue,unit,currency -- 406,410 movie_id print nhi hogi kyunki m.movie_id print hogi replace it with f.movie_id
FROM financials f
LEFT OUTER JOIN movies m
USING (movie_id)

UNION -- Full join krne ke liye and LEFT JOIN ke block ke baad ";" nhi aayega.

SELECT m.movie_id,title,revenue,unit,currency -- jis side ki table ka join ho rha hai usi side ki movie_id lgani chaiye.
FROM financials f
RIGHT OUTER JOIN movies m
USING (movie_id);

