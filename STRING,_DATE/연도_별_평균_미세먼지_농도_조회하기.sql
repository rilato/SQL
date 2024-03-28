-- 코드를 작성해주세요
-- YEAR 함수는 정수로 반환
-- DATE_FORMAT 함수는 문자열로 반환
-- 아마, 문제에서 정수 타입을 원했거나, 문자열을 정렬할 때 문제가 발생한 것으로 보인다.
-- WHERE을 먼저 써주고, 그 다음 GROUP BY를 쓴다.

-- 틀린 풀이

SELECT DATE_FORMAT(YM, '%Y') AS 'YEAR',
    ROUND(AVG(PM_VAL1), 2) AS 'PM10',
    ROUND(AVG(PM_VAL2), 2) AS 'PM2.5'
FROM AIR_POLLUTION
WHERE LOCATION2 = '수원'
GROUP BY YEAR
ORDER BY YEAR;


-- 맞은 풀이

SELECT YEAR(YM) AS 'YEAR',
    ROUND(AVG(PM_VAL1), 2) AS 'PM10',
    ROUND(AVG(PM_VAL2), 2) AS 'PM2.5'
FROM AIR_POLLUTION
WHERE LOCATION2 = '수원'
GROUP BY YEAR
ORDER BY YEAR;
