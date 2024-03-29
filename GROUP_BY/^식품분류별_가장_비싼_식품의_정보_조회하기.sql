-- 물고기 종류 별 대어 찾기 문제와 유사한 형식.
-- 그룹화된 MAX값을 찾을 때에는, 인질을 하나 갖고 가서 IN절을 활용한다.
-- WHERE 절에서 IN에서 추출할 내용으로는 PRODUCT_NAME을 포함하지 않는다.
-- '카테고리 별' '가격'을 묻고 있기 때문. PRODUCT_NAME이 들어가면 MAX에 해당하는 컬럼 단 한개만 추출됨

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE)
                                         FROM FOOD_PRODUCT
                                         GROUP BY CATEGORY)
      AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY 2 DESC;


-- 다른 풀이

SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) IN (SELECT CATEGORY, MAX(PRICE)
                            FROM FOOD_PRODUCT
                            GROUP BY CATEGORY
                            HAVING CATEGORY IN ('과자', '국', '김치', '식용유'))
ORDER BY 2 DESC;
