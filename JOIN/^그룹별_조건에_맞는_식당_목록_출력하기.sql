-- RANK() OVER (ORDER BY 컬럼명 DESC) AS 별칭을 사용하여 글 개수가 가장 많은 사람 순서대로 정렬한다.
-- 이후 WHERE 절에서 별칭의 순위에 맞는 MEMBER_ID를 추출한다 (따라서 RANK()함수에서 AS 빠지면 안됨!)
-- SUBQUERY 안에 있는 INLINE은 FROM 내부의 SUBQUERY의 결과에 대한 별칭이다.

SELECT M.MEMBER_NAME, R.REVIEW_TEXT, DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE M
    JOIN REST_REVIEW R
    ON M.MEMBER_ID = R.MEMBER_ID
WHERE R.MEMBER_ID IN (SELECT MEMBER_ID
                      -- SELECT *을 하는 이유는, FROM절에 사용될 애를 추출하는 것이므로, 전체 컬럼을 뽑아야 한다.
                    FROM (SELECT *, RANK() OVER (ORDER BY COUNT(*) DESC) AS REVIEW_RANK
                          FROM REST_REVIEW 
                          -- INLINE은 FROM절 내부의 SUBQUERY에 대한 별칭
                          GROUP BY MEMBER_ID) AS INLINE
                    WHERE REVIEW_RANK = 1
                   )
ORDER BY 3 ASC, 2 ASC;

-- 다른 풀이
SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
FROM MEMBER_PROFILE
    JOIN REST_REVIEW
    USING (MEMBER_ID)
WHERE MEMBER_ID IN (SELECT MEMBER_ID
                    FROM (SELECT *, RANK() OVER(ORDER BY COUNT(MEMBER_ID) DESC) AS RANKING
                          -- 리뷰를 가장 많이 작성한 회원을 찾으므로, REST_REVIEW 테이블에서 뽑아야 한다!
                          FROM REST_REVIEW
                          GROUP BY MEMBER_ID) AS INLINE
                    WHERE RANKING = 1)
ORDER BY 3 ASC, 2 ASC;
