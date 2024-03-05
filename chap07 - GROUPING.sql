-- GROUPING
-- GROUP BY 절은 특정 열의 값에 따라 그룹화하는데 사용된다.
-- HAVING은 GROUP BY 절과 함께 사용해야 하며 그룹에 대한 조건을 적용하는데 사용된다.

SELECT
	category_code
FROM
	tbl_menu
GROUP BY category_code;

SELECT
	category_code,
    COUNT(*)
FROM
	tbl_menu
group by category_code;

SELECT
	category_code,
    SUM(menu_price)
FROM
	tbl_menu
GROUP BY category_code;

SELECT
	category_code,
    AVG(menu_price)
FROM
	tbl_menu
GROUP BY category_code;

SELECT
	menu_price,
    category_code
FROM
	tbl_menu
GROUP BY 
	menu_price,
	category_code;
    
SELECT
	menu_price,
    category_code
FROM
	tbl_menu
GROUP BY
	menu_price,
	category_code;

SELECT
	category_code
FROM
	menu_price,
    category_code
HAVING			-- WHERE절은 그룹화 전의 개별 행에 대한 조건 지정
				-- HAVING절은 그룹화 후의 집계 결과에 대한 조건 지정
	category_code >= 5 AND category_code <= 8;
    
SELECT
	category_code,
    SUM(menu_price)
FROM
	tbl_menu
GROUP BY
	category_code
WITH ROLLUP;

SELECT
	menu_price,
    category_code,
    SUM(menu_price)
FROM
	tbl_menu
GROUP BY
	menu_price,
    category_code
WITH ROLLUP;
    
    

