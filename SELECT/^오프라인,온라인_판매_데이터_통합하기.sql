-- 코드를 입력하세요
-- NULL값을 넣어줄 컬럼을 추가하려면, SELECT NULL 컬럼명
-- UNION : 중복 제거 / UNION ALL : 중복 제거 X (ALL이므로, 제거 안하고 모두 보여줌)

(SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, "%Y-%m") = '2022-03')
UNION ALL
(SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, NULL USER_ID, SALES_AMOUNT
FROM OFFLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, "%Y-%m") = '2022-03')
ORDER BY 1 ASC, 2 ASC, 3 ASC
