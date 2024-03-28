-- 틀린 풀이
-- SHIPMENT_ID가 없다면 JOIN하지 않기 때문에, JOIN된 테이블에서 FLAVOR별로 JULY의 총합을 구할 수 없어, 잘못된 풀이이다.

SELECT F.FLAVOR
FROM FIRST_HALF F
    JOIN JULY J
    ON F.SHIPMENT_ID = J.SHIPMENT_ID
GROUP BY J.FLAVOR
ORDER BY F.TOTAL_ORDER + SUM(J.TOTAL_ORDER) DESC
LIMIT 3;

-- 맞은 풀이

SELECT F.FLAVOR
FROM FIRST_HALF F
    JOIN JULY J
    ON F.FLAVOR = J.FLAVOR
GROUP BY J.FLAVOR
ORDER BY F.TOTAL_ORDER + SUM(J.TOTAL_ORDER) DESC
LIMIT 3;
