-- GROUP BY는 MAX를 커버하지 못한다.
-- SUM/MAX/MIN의 물고기 종류 별 대어 찾기 문제와 동일한 형식의 문제

-- 틀린 풀이
-- '음식 종류 별'이므로, REST_ID를 기준으로 묶으면 안된다.
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (REST_ID, FAVORITES) IN (SELECT REST_ID, MAX(FAVORITES)
                               FROM REST_INFO
                               GROUP BY FOOD_TYPE)
ORDER BY 1 DESC;

-- 맞은 풀이
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (SELECT FOOD_TYPE, MAX(FAVORITES) 
                                FROM REST_INFO
                                GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC;
