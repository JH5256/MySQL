/* VIEW */
-- SELECT 쿼리문을 저장한 객체로 가상테이블이라고 불린다.
-- 데이터를 쉽게 읽고 이해할 수 있도록 돕는 동시에,
-- 원본 데이터의 보안을 유지하는데 도움이 된다.

CREATE VIEW hansik AS
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 4;
    
SELECT * FROM hansik;

INSERT INTO tbl_menu VALUES (null, '식혜맛국밥', 5500, 4, 'Y');

INSERT INTO hansik VALUES (null, '식혜맛국밥', 5500, 4, 'Y');
-- 베이스 테이블의 auto_increment가 적용되어 null값을 넣어도 자동으로 increment 되어 삽입된다.

INSERT INTO hansik VALUES (99, '버터맛국밥', 5700, 4, 'Y');

/* VIEW로 DML명령어 조작이 불가능한 경우
	1. 뷰 정의에 포함되지 않은 컬럼을 조작하는 경우
    2. 뷰에 포함되지 않은 컬럼 중에 베이스가 되는 테이블 컬럼이 NOT NULL제약조건이 지정된 경우
    3. 산술 표현식이 정의된 경우
    4. JOIN을 이용해 여러 테이블을 연결한 경우
    5. DISTINCT를 포함한 경우 
    6. 그룹함수나 GROUP BY절을 포함한 경우
    */
    
    DROP VIEW hansik;
    
	-- OR REPLACE 옵션
    -- 테이블을 드롭하지 않고 기존의 VIEW를 새로운 VIEW로 쉽게 다룰 수 있다.
    
    CREATE OR REPLACE VIEW hansik AS 
    SELECT
		menu_code AS '메뉴코드', 
        menu_name AS '메뉴명',
        category_name AS '카테고리명'
	FROM 
		tbl_menu a
	JOIN tbl_category b ON a.category_code = b.category_code
    WHERE 
		b.category_name = '한식';
        
	SELECT * FROM hansik;
    
    
    
    