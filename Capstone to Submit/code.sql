/* 1 survey table */

SELECT *
FROM survey
LIMIT 10;

/* 2 - QUIZ FUNNEL */

SELECT question, 
	COUNT (DISTINCT user_id) AS User_Count
FROM survey
GROUP BY 1
ORDER BY 1;

/* 4 - Examine first five rows of each table */

SELECT * 
FROM quiz
LIMIT 5;

SELECT * 
FROM home_try_on
LIMIT 5;

SELECT * 
FROM purchase
LIMIT 5;

/* 5 NEW TABLE */
SELECT DISTINCT q.user_id, 
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
	ON h.user_id = q.user_id
LEFT JOIN purchase AS 'p'
	ON p.user_id = h.user_id
LIMIT 10;

/* 6 counts */

WITH funnels AS (SELECT DISTINCT q.user_id, 
h.user_id IS NOT NULL AS 'is_home_try_on',
h.number_of_pairs,
p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
	ON h.user_id = q.user_id
LEFT JOIN purchase AS 'p'
	ON p.user_id = h.user_id)
SELECT number_of_pairs, COUNT(*) AS 'num_quiz',
   SUM(is_home_try_on) AS 'num_try',
   SUM(is_purchase) AS 'num_purchase'
FROM funnels
GROUP BY 1
ORDER BY 1;

/* 6 quiz results */
SELECT style, COUNT (DISTINCT user_id)
FROM QUIZ
GROUP BY 1;

SELECT fit, COUNT (DISTINCT user_id)
FROM QUIZ
GROUP BY 1;

SELECT shape, COUNT (DISTINCT user_id)
FROM QUIZ
GROUP BY 1;

SELECT color, COUNT (DISTINCT user_id)
FROM QUIZ
GROUP BY 1;

/*6 Purchase results */
SELECT product_id, model_name, style, color, COUNT(*)
FROM purchase
GROUP BY 1
ORDER BY 5 DESC;

SELECT price, count(*)
FROM purchase
GROUP BY 1;