-- 코드를 입력하세요
-- WHERE 절에서 IN에서 추출할 내용으로는 PRODUCT_NAME을 포함하지 않는다.
-- '카테고리 별' '가격'을 묻고 있기 때문. PRODUCT_NAME이 들어가면 MAX에 해당하는 컬럼 단 한개만 추출됨

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE)
                                         FROM FOOD_PRODUCT
                                         GROUP BY CATEGORY)
      AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY 2 DESC;
