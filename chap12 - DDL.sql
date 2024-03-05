/* DDL(Data Definition Language)
데이터베이스의 스키마를 정의하거나 수정하는데 사용되는 SQL의 한 부분이다.  */

-- 1. CREATE : 테이블 생성을 위한 구문
 /* 컬럼 설정 방법 
	column_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] column_constraint */ 
 CREATE TABLE IF NOT EXISTS tb1 (
	pk INT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE = INNODB; 

DESCRIBE tb1;

INSERT INTO tb1 VALUES(1, 10, 'Y');
SELECT * FROM tb1;

-- 2. AUTO_INCREMENT
-- INSERT시 PRIMARY 키에 해당하는 컬럼에 자동으로 번호를 발생시켜 저장할 수 있다. 
CREATE TABLE IF NOT EXISTS tb2 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN('Y', 'N'))
) ENGINE = INNODB;

INSERT INTO tb2 VALUES (null, 10, 'Y');
INSERT INTO tb2 VALUES (null, 20, 'Y');

-- 3. ALTER
-- 테이블에 추가/변경/수정/삭제하는 모든 것은 ALTER 명령어를 사용해 적용한다.

-- 열추가
-- ALTER TABLE 테이블명 ADD 컬럼명 컬럼정의
-- col2 컬럼 추가 (INT형, NOT NULL 제약조건 존재)
ALTER TABLE tb2 
ADD col2 INT NOT NULL;

DESCRIBE tb2;

-- 열삭제
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명
ALTER TABLE tb2
DROP COLUMN col2;

DESCRIBE tb2;

-- 열 이름 및 데이터 형식 변경
-- ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 바꿀컬럼명 컬럼정의
-- fk 컬럼을 change fk 컬럼으로(NOT NULL 제약조건 존재)
ALTER TABLE tb2 CHANGE COLUMN fk change_fk INT NOT NULL;
 
-- 열 제약 조건 추가 및 삭제(이후 챕터에서 다룰 내용)
-- ALTER TABLE 테이블명 DROP 제약조건
-- tb2 테이블의 PRIMARY KEY 제약조건 제거
-- ALTER TABLE tb2 drop PRIMARY KEY; 		--에러 발생
 /* AUTO_INCREMENT가 걸려있는 컬럼은 PRIMARY KEY 제거가 안되므로 
 AUTO_INCREMENT를 MODIFY(컬럼의 정의를 바꿈) 명령어로 제거한다. */
 
 ALTER TABLE tb2
 MODIFY pk INT;
 
 DESCRIBE tb2;
 
 ALTER TABLE tb2
 DROP PRIMARY KEY;
 
 -- 다시 PRIMARY KEY 제약조건 추가
 ALTER TABLE tb2
 ADD PRIMARY KEY(pk);
 
 -- 컬럼 여러개 추가하기
 ALTER TABLE tb2
 ADD col3 DATE NOT NULL,
 ADD col4 TINYINT NOT NULL;			-- 1292 에러 발생
 
 SELECT @@GLOBAL.sql_mode;			-- MySQL 데이터베이스 서버의 전역 SQL모드 설정을 조회 (NO_ZERO_DATE)
									-- root 계정에서 모드 설정 비워준 후 workbench 껐다가 킨 후 다시 date형 컬럼 추가 
                                    
 DESC tb2;
 
--  4. DROP : 테이블을 삭제하기 위한 구문
CREATE TABLE IF NOT EXISTS tb3 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE = INNODB;

-- tb3 테이블 삭제
DROP TABLE IF EXISTS tb3; 

-- 5. TRUNCATE :  
/* 전체 테이블의 모든 행을 삭제하고 테이블을 새로 생성한다. 
   삭제할 행에 대한 로그를 남기지 않아서, 되돌릴 수 없다. */
   
CREATE TABLE IF NOT EXISTS tb4 (
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN('Y', 'N'))
) ENGINE = INNODB;

INSERT INTO tb4 VALUES(null, 10, 'Y');
INSERT INTO tb4 VALUES(null, 20, 'Y');
INSERT INTO tb4 VALUES(null, 30, 'Y');
INSERT INTO tb4 VALUES(null, 40, 'Y');

SELECT * FROM tb4;

-- 테이블 초기화 하기

TRUNCATE TABLE tb4;
-- TRUNCATE tb4;			-- TABLE 키워드 생략 가능 

