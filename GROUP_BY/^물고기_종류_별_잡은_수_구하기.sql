-- 코드를 작성해주세요
-- GROUP BY를 사용하지 않으면 집계 함수(이 경우 COUNT())와 함께 집계되지 않은 열을 선택할 때 비집계 열을 그룹화하는 방법을 지정해야 하기 때문에 쿼리에서 실제로 오류가 발생합니다

SELECT COUNT(F.FISH_TYPE) AS FISH_COUNT, N.FISH_NAME AS FISH_NAME
FROM FISH_NAME_INFO N
JOIN FISH_INFO F
ON N.FISH_TYPE = F.FISH_TYPE
GROUP BY N.FISH_NAME
ORDER BY FISH_COUNT DESC;
