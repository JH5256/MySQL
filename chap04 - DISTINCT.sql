-- distinct

-- 중복된 값을 제거하는데 사용된다.
-- 컬럼에 있는 컬럼값들의 종류를 쉽게 파악할 수 있다.

select
	category_code
from
	tbl_menu
order by
	category_code;
    
select
	distinct category_code -- 중복 제거
from
	tbl_menu
order by
	category_code;
    
-- null값을 포함한 열의 distinct 사용
select
	ref_category_code
from
	tbl_category;
    
select
	distinct ref_category_code
from
	tbl_category;

-- 다중열 distinct 사용
select
	category_code,
    orderable_status
from
	tbl_menu;
    
select distinct
	category_code,
    orderable_status
from
	tbl_menu;
    
