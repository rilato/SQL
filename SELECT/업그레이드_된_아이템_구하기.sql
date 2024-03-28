-- IN : 여러 개의 OR 역할과 동일. 즉 해당하는 모든 컬럼을 선택함 (8번째 줄에서 T.PARENT_ITEM_ID = ITEM_ID인 모든 애들 선택)
-- 조건을 만족하는 ID가 여러 개 나오므로, IN을 써준다.

SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO
WHERE ITEM_ID IN (SELECT ITEM_ID
                  FROM ITEM_TREE
                  WHERE PARENT_ITEM_ID IN (SELECT ITEM_ID
                                           FROM ITEM_INFO
                                           WHERE RARITY = 'RARE'))
ORDER BY ITEM_ID DESC;


-- 다른 풀이

SELECT I.ITEM_ID, I.ITEM_NAME, I.RARITY
FROM ITEM_INFO I
    JOIN ITEM_TREE T
    ON I.ITEM_ID = T.ITEM_ID
WHERE T.PARENT_ITEM_ID IN (SELECT ITEM_ID FROM ITEM_INFO WHERE RARITY='RARE')
ORDER BY ITEM_ID DESC;



-- 다른 풀이
SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO
WHERE ITEM_ID IN (SELECT T.ITEM_ID
                  FROM ITEM_INFO I
                      JOIN ITEM_TREE T
                      ON I.ITEM_ID = T.PARENT_ITEM_ID
                  WHERE I.RARITY = 'RARE')
ORDER BY 1 DESC;
