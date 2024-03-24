-- 코드를 입력하세요
-- '서울'에 위치한 식당을 찾아야 한다.

SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, ROUND(AVG(R.REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO I
    JOIN REST_REVIEW R
    ON I.REST_ID = R.REST_ID
WHERE I.ADDRESS LIKE '서울%'
GROUP BY R.REST_ID
ORDER BY 6 DESC, 4 DESC;
