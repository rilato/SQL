-- 코드를 입력하세요

SELECT *
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE)
               FROM FOOD_PRODUCT);




-- 참고

SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, MAX(PRICE) AS PRICE
FROM FOOD_PRODUCT

-- 해당 쿼리는 가격이 가장 비싼 row 를 가져올 것 같지만
-- 테이블의 첫번째 행 데이터에 가격만 MAX값으로 합쳐서 나오는 것입니다.

-- 먼저 MAX(PRICE) 값을 SELECT 하시고
-- WHERE 절에서 PRICE가 최대값인지 찾으시면 되겠습니다.
