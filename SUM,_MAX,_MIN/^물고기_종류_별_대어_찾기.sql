-- 코드를 작성해주세요
-- WHERE절에서 IN에 영향을 받는 값들을 여러 개로 묶으려면, ()를 사용한다.
-- MAX값을 찾을 때에는 SUBQUERY를 이용한다.

SELECT I.ID, N.FISH_NAME, I.LENGTH
FROM FISH_INFO I
    JOIN FISH_NAME_INFO N
    ON I.FISH_TYPE = N.FISH_TYPE
WHERE (I.FISH_TYPE, I.LENGTH) IN (SELECT FISH_TYPE, MAX(LENGTH)
                                  FROM FISH_INFO
                                  GROUP BY FISH_TYPE)
ORDER BY ID ASC;
