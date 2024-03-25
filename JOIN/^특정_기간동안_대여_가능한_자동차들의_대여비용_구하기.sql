-- 3중 LEFT JOIN을 하여, 세 개의 테이블을 하나로 묶은 후, 조건에 맞게 차근 차근 해결해나간다.

SELECT C.CAR_ID, C.CAR_TYPE
     , ROUND((30 * C.DAILY_FEE * (1-P.DISCOUNT_RATE/100))) AS FEE
    FROM CAR_RENTAL_COMPANY_CAR C
    LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H
        ON C.CAR_ID = H.CAR_ID
    LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
        ON C.CAR_TYPE = P.CAR_TYPE
    WHERE C.CAR_ID NOT IN 
    (
        SELECT CAR_ID
           FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
           WHERE ('2022-11-01 00:00:00' BETWEEN START_DATE AND END_DATE)
              OR ('2022-11-30 23:59:59' BETWEEN START_DATE AND END_DATE)
    )
        AND C.CAR_TYPE IN ('세단', 'SUV')
        AND P.DURATION_TYPE = '30일 이상'
    GROUP BY C.CAR_ID, C.CAR_TYPE
    HAVING FEE BETWEEN 500000 AND 2000000
    ORDER BY FEE DESC, C.CAR_TYPE, C.CAR_ID DESC;
