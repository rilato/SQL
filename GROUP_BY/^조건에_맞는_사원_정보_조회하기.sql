-- 코드를 작성해주세요
-- FROM 내부의 SELECT 절에서 *을 사용할 경우, 같은 EMP_NO에 대해 여러 레코드가 있을 수 있다.
-- 이 경우 어떤 레코드가 선택될지 확신할 수 없어서, 오류가 발생한다.

SELECT SUM(SCORE) AS SCORE, EMP_NO, EMP_NAME, POSITION, EMAIL
FROM HR_EMPLOYEES
    JOIN HR_DEPARTMENT
    USING (DEPT_ID)
    JOIN HR_GRADE
    USING (EMP_NO)
WHERE (EMP_NO) IN (SELECT EMP_NO
                   -- 같은 EMP_NO에 대해 여러 레코드가 있을 수 있다. 이 경우 어떤 레코드가 선택될지 확신할 수 없어서, 오류가 발생한다.
                    FROM (SELECT EMP_NO, RANK() OVER(ORDER BY SUM(SCORE) DESC) AS RANKING
                          FROM HR_GRADE
                          WHERE YEAR = 2022
                          GROUP BY EMP_NO) AS HR_GRADE_2
                    WHERE RANKING = 1)
GROUP BY EMP_NO
