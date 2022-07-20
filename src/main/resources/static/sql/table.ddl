
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

