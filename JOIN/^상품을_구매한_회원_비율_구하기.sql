-- 년, 월 별로 출력 : GROUP BY YEAR, MONTH
-- 상품을 구매한 회원 수는 DISTINCT를 사용하여 구할 수 있다. (JOIN할 때에 ONLINE_SALE 테이블 때문에, 동일한 USER_ID가 여러 개 생기므로, DISTINCT를 반드시 해주어야 한다!!)
-- ROUND에서 SUBQUERY를 사용하는 이유는, JOIN된 애들만 걸러진 테이블이므로, 2021년에 가입했지만, 상품을 구매하지 않은 사람의 수를 확인할 수 없다.

SELECT YEAR(O.SALES_DATE) AS YEAR
     , MONTH(O.SALES_DATE) AS MONTH
     , COUNT(DISTINCT O.USER_ID) AS PURCHASED_USERS
     , ROUND(COUNT(DISTINCT O.USER_ID)
             / (SELECT COUNT(DISTINCT USER_ID) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) AS PURCHASED_RATIO
FROM USER_INFO U
    INNER JOIN ONLINE_SALE O ON U.USER_ID = O.USER_ID
WHERE YEAR(U.JOINED) = 2021
GROUP BY YEAR, MONTH
ORDER BY YEAR ASC, MONTH ASC;


-- 다른 풀이

SELECT YEAR(SALES_DATE) AS YEAR, 
       MONTH(SALES_DATE) AS MONTH, 
       COUNT(DISTINCT USER_ID) AS PURCHASED_USERS, 
       ROUND(
           -- 여기(분자)의 COUNT는 메인 쿼리의 FROM절 이하의 영향을 받는다.
           -- 분자의 COUNT는 따로 괄호로 묶지 않아도 된다.
           -- 특정한 사람이 여러 상품을 구매했을 수 있으므로, USER_ID를 DISTINCT해준다.
            COUNT(DISTINCT USER_ID)
            /
           -- 분모의 SELECT문은 따로 괄호로 묶어준다.
           -- 특정한 사람이 여러 상품을 구매했을 수 있으므로, USER_ID를 DISTINCT해준다.
            (SELECT COUNT(DISTINCT USER_ID)
            FROM USER_INFO
            WHERE YEAR(JOINED) = 2021), 1) AS PURCHASED_RATIO
FROM USER_INFO
    JOIN ONLINE_SALE
    USING (USER_ID)
WHERE YEAR(JOINED) = 2021
GROUP BY YEAR, MONTH
ORDER BY 1 ASC, 2 ASC;
