/* CONSTRAINTS */
-- 제약조건으로 테이블에 데이터가 입력되거나 수정될 때 규칙 정의

-- 1. NOT NULL
CREATE TABLE IF NOT EXISTS user_notnull(
	user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARChAR(255)
) ENGINE = INNODB;

INSERT INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),    
(2, 'user02', 'pass02', '판다', '여', '010-7777-7777', 'panda77@gmail.com');

SELECT * FROM user_notnull;

-- not null 제약조건 에러 발생(null값 적용)
INSERT INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', null, '이순신', '남', '010-2222-2222', 'lee222@gmail.com');    

-- UNIQUE : 중복값을 허용하지 않는 제약조건

CREATE TABLE IF NOT EXISTS user_unique(
	user_no INT NOT NULL UNIQUE,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARChAR(255),
    UNIQUE (phone)
) ENGINE = INNODB;

INSERT INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),    
(2, 'user02', 'pass02', '판다', '여', '010-7777-7777', 'panda77@gmail.com');

SELECT * FROM user_unique;

-- unique 제약조건 에러 발생

INSERT INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', 'pass03', '이순신', '남', '010-7777-7777', 'lee22@gmail.net');

-- 3. PRIMARY KEY
/* 테이블에 대한 식별자 역할을 한다. (한 행씩 구분하는 역할)
   NOT NULL + UNIQUE 제약조건의 의미이다.
   한 테이블당 한 개만 설정할 수 있다.
   한 개 컬럼에 설정할 수도 있고, 여러 개의 컬럼을 묶어 설정할 수 있다. */
   
   CREATE TABLE IF NOT EXISTS user_primarykey(
	-- user_no INT PRIMARY KEY,
    user_no INT,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARChAR(255),
    PRIMARY KEY (user_no)
) ENGINE = INNODB;

INSERT INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES 
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),    
(2, 'user02', 'pass02', '판다', '여', '010-7777-7777', 'panda77@gmail.com');

SELECT * FROM user_primarykey;

-- primary key 제약조건 에러 발생(null값 적용)
INSERT INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(null, 'user03', 'pass03', '이순신', '남', '010-7777-7777', 'lee22@gmail.net');

-- primary key 제약조건 에러 발생(unique 적용)
INSERT INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(2, 'user03', 'pass03', '이순신', '남', '010-7777-7777', 'lee22@gmail.net');

-- FOREIGN KEY
/* 참조(REFERENCES)된 다른 테이블에서 제공하는 값만 사용할 수 있다.
   FOREIGN KEY 제약조건에 의해 테이블 간의 관계가 형성된다. 
   제공되는 값 외에는 NULL을 사용할 수 있다. */ 
   
CREATE TABLE IF NOT EXISTS user_grade (
	grade_code INT NOT NULL UNIQUE,
    grade_name VARCHAR(255) NOT NULL
) ENGINE = INNODB;

INSERT INTO user_grade 
VALUES
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');

SELECT * FROM user_grade;

 CREATE TABLE IF NOT EXISTS user_foreignkey1 (
	-- user_no INT PRIMARY KEY,
    user_no INT,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT,
    PRIMARY KEY (user_no),
    FOREIGN KEY (grade_code) REFERENCES user_grade (grade_code)
) ENGINE = INNODB;

INSERT INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES 
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),    
(2, 'user02', 'pass02', '판다', '여', '010-7777-7777', 'panda77@gmail.com', 20);

SELECT * FROM user_foreignkey1;

INSERT INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(3, 'user03', 'pass03', '이순신', '남', '010-7777-7777', 'lee22@gmail.net', 50);


 CREATE TABLE IF NOT EXISTS user_foreignkey2 (
	-- user_no INT PRIMARY KEY,
    user_no INT,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT,
    PRIMARY KEY (user_no),
    FOREIGN KEY (grade_code) 
    REFERENCES user_grade (grade_code)
		ON UPDATE SET NULL		
        /* user_grade 테이블의 'grade_code'값이 변경될 경우 외래 키를 가진 테이블의 'grade_code' 값을 null로 설정 */
		ON DELETE SET NULL		
) ENGINE = INNODB;

INSERT INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES 
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),    
(2, 'user02', 'pass02', '판다', '여', '010-7777-7777', 'panda77@gmail.com', 20);

DROP TABLE IF EXISTS user_foreignkey1;

UPDATE user_grade 
SET grade_code = null
WHERE grade_code = 10;

SELECT * FROM user_foreignkey2;

DELETE FROM user_grade
WHERE grade_code = 20;

SELECT * FROM user_grade;

-- 5. CHECK : check 제약 조건을 위반할 시 허용하지 않는 제약조건

CREATE TABLE IF NOT EXISTS user_check (
	user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK( gender IN ('남', '여')),
    age INT CHECK(age >= 19)
) ENGINE = INNODB;

INSERT INTO user_check
VALUES
	(null, '홍길동', '남', 25),
    (null, '이순신', '남', 33);

SELECT * FROM user_check;

-- gender 컬럼 check 제약 조건 에러 발생
INSERT INTO user_check
VALUES (null, '안중근', '남성', 27);

-- age 컬럼 check 제약 조건 에러 발생
INSERT INTO user_check
VALUES (null, '유관순', '여', 17);

-- 6. DEFAULT
/* 컬럼에 null 대신 기본 값 적용 
   컬럼에 타입이 DATE일 시 current_date만 가능 
   컬럼 타임이 DATETIME일 시 current_time과 current_timestamp, now() 모두 사용 가능
   */
   
CREATE TABLE IF NOT EXISTS tbl_country (
	country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국',
    population VARCHAR(255) DEFAULT '0명',
    add_day DATE DEFAULT (current_date),
    add_time DATETIME DEFAULT (current_time)
) ENGINE = INNODB;

SELECT * FROM tbl_country;

INSERT INTO tbl_country
VALUES (null, default, default, default, default);