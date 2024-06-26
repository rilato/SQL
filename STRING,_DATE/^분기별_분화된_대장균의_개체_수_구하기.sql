-- 코드를 작성해주세요
-- 분기를 구하기 위해, MONTH를 3으로 나누고, CEIL을 활용한다.

SELECT CONCAT(CEIL(MONTH(DIFFERENTIATION_DATE) / 3), "Q") AS QUARTER, COUNT(*) AS ECOLI_COUNT
FROM ECOLI_DATA
GROUP BY QUARTER
ORDER BY 1 ASC;
