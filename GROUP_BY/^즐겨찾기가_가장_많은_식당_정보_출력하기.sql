-- GROUP BY는 MAX를 커버하지 못한다.
-- SUM/MAX/MIN의 물고기 종류 별 대어 찾기 문제와 동일한 형식의 문제

-- 코드를 입력하세요

SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (SELECT FOOD_TYPE, MAX(FAVORITES) 
                                FROM REST_INFO
                                GROUP BY FOOD_TYPE)
ORDER BY FOOD_TYPE DESC;
