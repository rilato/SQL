-- 코드를 입력하세요
-- 공백("")과 NULL은 다르다!
-- NULL도 그대로 출력하면 빈 칸으로 나온다.
-- 따라서 IFNULL(DATE_FORMAT(OUT_DATE, "%Y-%m-%d"), "")이 아닌, IFNULL(DATE_FORMAT(OUT_DATE, "%Y-%m-%d"), NULL)를 써준다.

-- 참고로 IFNULL 처리를 안해주어도, NULL이면 디폴트로 NULL을 반환함

SELECT ORDER_ID, PRODUCT_ID, IFNULL(DATE_FORMAT(OUT_DATE, "%Y-%m-%d"), NULL) AS OUT_DATE, IF(DATE_FORMAT(OUT_DATE, "%Y-%m-%d") <= '2022-05-01', '출고완료', IF(DATE_FORMAT(OUT_DATE, "%Y-%m-%d") IS NULL, '출고미정', '출고대기')) AS '출고여부'
FROM FOOD_ORDER
ORDER BY 1 ASC;

-- 다른 풀이
SELECT ORDER_ID, PRODUCT_ID, DATE_FORMAT(OUT_DATE, "%Y-%m-%d") AS OUT_DATE, IF(DATE_FORMAT(OUT_DATE, "%m-%d") <= '05-01', '출고완료', IF(DATE_FORMAT(OUT_DATE, "%m-%d") > '05-01', '출고대기', '출고미정')) AS '출고여부'
FROM FOOD_ORDER
ORDER BY 1 ASC;
