-- JOIN
-- 두 개 이상의 테이블을 관련있는 컬럼을 통해 결합하는데 사용된다.

-- 컬럼 또는 테이블에 별칭을 달아줄 수 있다. 이러한 별칭을 ALIAS라고 한다.
select
	menu_code as 'code',
    menu_name as name,
    menu_price 'price'
from
	tbl_menu
order by
	menu_price;
    
select
	a.category_code,
    a.menu_name
from
-- 	tbl_menu as a
	tbl_menu a
order by
	category_code,
    menu_name;
    
-- INNER JOIN
-- 두 테이블의 교집합을 반환하는 SQL JOIN 유형

-- ON을 활용한 JOIN
-- 컬럼명이 같거나 다를 경우 ON으로 서로 연관있는 컬럼에 대한 조건을 작성하여 JOIN
SELECT
	a.menu_name,
    b.category_name -- 표시는 a의 메뉴와 b의 카테고리 이름
from
	tbl_menu a
-- INNER JOIN tbl_category b ON a.category_code = b.category_code; -- a테이블의 카테고리 코드와 b테이블의 카테고리가 같은걸 조건으로 조인
JOIN tbl_category b ON a.category_code = b.category_code;

-- USING을 활용한 JOIN
-- 컬럼명이 같을 경우 USING으로 서로 연관있는 컬럼에 대한 조건을 작성하여 JOIN

SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
INNER JOIN tbl_category b USING (category_code);

-- 2. LEFT JOIN
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형

SELECT
	a.category_name,
    b.menu_name
FROM
	tbl_category a LEFT JOIN tbl_menu b ON a.category_code = b.category_code;
    
-- 3. RIGHT JOIN
-- 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형

SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a 
RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- 4. CROSS JOIN
-- 두 테이블의 모든 가능한 조합을 반환하는 SQL JOIN 유형

SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
CROSS JOIN tbl_category b;

-- 5. SELF JOIN
-- 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 SQL
-- 카테고리별 대분류 확인을 위한 SELF JOIN 조회 .. 자기 자신과 결합 !!

SELECT
	a.category_name,
    b.category_name
FROM
	tbl_category a
JOIN tbl_category b ON a.ref_category_code = b.category_code
WHERE a.ref_category_code IS NOT NULL; -- resf.category 는 대분류라고 보면 됨 1-> 식사, 2-> 음료, 3->디저트

-- JOIN 알고리즘
-- 1. NESTED LOOP JOIN
-- 큰 테이블의 각 행에 대해 작은 테이블을 반복적으로 검색하며, 조인 조건에 맞는 행을 찾는다.
-- 인덱스가 잘 구성되어 있는 작은 테이블에 유리하며, 전체 행을 스캔할 필요가 없을 때 효율적이다. 
-- 결론, 두 테이블 중 하나가 상대적으로 작을 때 효과적이다. 

SELECT /* + NO_HASH_JOIN(a) */
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code;

-- 2. HASH JOIN
-- 이 방식은 두 테이블이 모두 크고, 테이블 간 등가 조인(equal join)이 일어날 때 효과적이다.
-- 먼저 한 테이블의 데이터를 읽어 해시 테이블을 생성하고, 다른 테이블을 읽으며 해시 테이블과
-- 매칭되는 데이터를 찾는다.

SELECT /* + HASH_JOIN(a) */ -- 주석처럼 보이지만 실제로 sql 힌트절로 작동한다. 'a'라는 별칭을 가진 테이블
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code;


	
	

