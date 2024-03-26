-- 코드를 입력하세요
-- SUM을 이용한 트릭을 쓴다.
-- 하나라도 10월 16일에 걸리면, 해당 차는 대여중인 것이다.
-- => 값이 1 이상이 된다.

-- 자동차별로 대여 가능한지 출력하므로, GROUP BY CAR_ID를 해준다.

SELECT CAR_ID, IF(SUM(IF('2022-10-16' BETWEEN DATE_FORMAT(START_DATE, "%Y-%m-%d") AND DATE_FORMAT(END_DATE, "%Y-%m-%d"), 1, 0)) = 0, "대여 가능", "대여중") AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY 1 DESC;
