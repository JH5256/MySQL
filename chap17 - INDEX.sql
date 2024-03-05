/* INDEX */

CREATE TABLE phone (
   phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);

INSERT INTO phone (phone_code, phone_name, phone_price)
VALUES (1, 'galaxyS24', 1200000),
       (2, 'iPhone15', 1400000),
       (3, 'galaxyZfold5', 2300000);
       
SELECT * FROM phone;

-- EXPLAIN : 쿼리 실행 계획 확인 명령문
EXPLAIN SELECT * FROM phone
WHERE phone_name = 'galaxyS24';

CREATE INDEX idx_name
ON phone (phone_name);

SHOW INDEX FROM phone;

-- 복합 인덱스 생성
CREATE INDEX idx_name_price
ON phone(phone_name, phone_price);

SELECT * FROM phone
WHERE phone_name = 'iPhone15';

EXPLAIN SELECT * FROM phone
WHERE phone_name = 'iphone15';

-- 인덱스 최적화 (재구성)
-- 인덱스가 파편화되었거나, 데이터의 대부분의 변경된 경우 유용하다.
-- 인덱스의 성능을 개선하고, 디스크 공간을 더 효율적으로 사용하게 한다.
-- 단, 재구성 하는동안 테이블은 잠겨있을 수 있다. 주의해서 수행하기!
-- ALTER TABLE 명령어 사용해서 재구성한다.    

ALTER TABLE phone DROP INDEX idx_name;
ALTER TABLE phone ADD INDEX idx_name(phone_name); 

OPTIMIZE TABLE phone;

DROP INDEX idx_name ON phone;
SHOW INDEX FROM phone;
