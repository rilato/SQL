-- 코드를 입력하세요
-- 동일한 회원이 동일한 상품을 "재구매" 하므로, COUNT > 1이어야 한다.
-- having은 결과 값이 나오고 난 이후의 필터링을 한다고 생각하면 편한데 조건절이 다 처리되어 그루핑된 값을 구한다.
-- 따라서 GROUP BY 에서 USER_ID, PRODUCT_ID 둘이 같이 그루핑 되어 둘중 아무 기준으로 count 처리 해도된다.

SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(PRODUCT_ID) > 1
ORDER BY 1 ASC, 2 DESC;
