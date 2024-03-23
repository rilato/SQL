-- 코드를 입력하세요
-- DATEDIFF를 사용한다. 이 때, DATEDIFF에 들어가는 형식에 주의한다.
-- 또한, 9월 1일 ~ 9월 1일 => 차이는 0일이지만, 실제로는 1일 빌렸다.
-- 따라서 계산 시, DATE_DIFF 값에 1을 더해준다.

SELECT HISTORY_ID, CAR_ID,
       DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE,
       DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE,
       IF(DATEDIFF(END_DATE, START_DATE) + 1 >= 30, '장기 대여', '단기 대여') AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE YEAR(START_DATE) = 2022
    AND MONTH(START_DATE) = 9
ORDER BY HISTORY_ID DESC;
