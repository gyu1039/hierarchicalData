
/* h2 db auto_increment 초기화
ALTER TABLE <table_name> ALTER COLUMN <column_name> RESTART WITH 1
*/

/* 중첩 세트 모델(The Nested Set Model)의 테이블 구조 */

/* 테이블 생성 */
CREATE TABLE post(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    lt INT,
    rt INT
);

/* CEO 추가 (최상위 root 노드 추가)
기존 노드가 없으므로  left = 1, right = 2이다. */
INSERT INTO post VALUES (1,'CEO',1,2);


/* 기존에 자식이 없는 노드의 자식으로 노드를 추가할 경우
기존 자식이 없는 노드의 자식으로 노드를 추가하려면 부모가 될 노드의 왼쪽 값을 가지고 온다
부모가 될 노드의 왼쪽 값 다음에 삽입될 노드가 위치한다( 예) 기존 노드가 lft=1, rgt=2 일때, 1 (2 , 3) 4)
추가하려는 노드의 left 값은 부모 노드의 left + 1 , right 값은 부모노드의 left+2
CEO 하위로 하나씩 추가해보도록 한다. */
SELECT @myLeft := lt FROM post
WHERE name = 'CEO';
UPDATE post SET rt = rt + 2 WHERE rt > @myLeft;
UPDATE post SET lt = lt + 2 WHERE lt > @myLeft;
INSERT INTO post(name, lt, rt) VALUES('개발부서', @myLeft + 1, @myLeft + 2);



/* 기존에 자식이 있는 부모노드에 자식노드로 추가할 경우
삽입 될 위치에서 왼쪽에 위치하는 노드의 오른쪽 값을 가지고 온다.
삽입 될 위치에서 오른쪽에 위치하는 노드는 왼쪽 값 + 2, 오른쪽 값 +2 가 된다.
추가하려는 노드의 left 값은 가지고 온 노드의 오른쪽 값 + 1, right 값은 가지고 온 노드의 오른쪽 값 + 2
*/
SELECT @myRight := rt FROM post WHERE name = '개발부서';
UPDATE post SET rt = rt + 2 WHERE rt > @myRight;
UPDATE post SET lt = lt + 2 WHERE lt > @myRight;
INSERT INTO post(name, lt, rt) VALUES('경영부서', @myRight + 1, @myRight + 2);