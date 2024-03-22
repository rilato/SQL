-- 코드를 작성해주세요
-- total_distance 가 concat 함수를 써서 문자열로 되었기 때문에, 제대로 정렬이 안되는 거에요. order by route가 아니라, round(sum(d_between_dist), 1) desc로 하면, 숫자를 기준으로 정렬을 하니까 정상적으로 통과할거에요.

-- 틀린 풀이

SELECT ROUTE,
    CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') AS TOTAL_DISTANCE,
    CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY TOTAL_DISTANCE DESC;

-- 맞은 풀이

SELECT ROUTE,
    CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), 'km') AS TOTAL_DISTANCE,
    CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), 'km') AS AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY ROUND(SUM(D_BETWEEN_DIST), 1) DESC;
