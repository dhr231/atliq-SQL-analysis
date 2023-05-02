#ROW_NUMBER,RANK,DENSE_RANK
SELECT *,ROW_NUMBER() OVER(PARTITION BY category ORDER BY amount DESC) AS rown FROM expenses; #yeh strictly row position display karta hai..koi bhi order by ka effect nhi hota

SELECT *,RANK() OVER(PARTITION BY category ORDER BY amount DESC) AS rnk FROM expenses; #yeh amount ke according rank display krta hai but same amount ke liye rank repeat hoti hai isme aur next rank ko skip bhi kr deta hai yh.

SELECT *,DENSE_RANK() OVER(PARTITION BY category ORDER BY amount DESC) AS dense_rnk FROM expenses; #yeh like RANK() rank display krta hai aur repeat bhi krta hai but unlike RANK() yeh skip nhi krta.