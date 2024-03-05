/* BUILD_IN_FUNCTIONS */

-- 1. 문자열 관련 함수
-- ASCII : 아스키 코드 값 추출
-- CHAR : 아스키 코드로 문자 추출

SELECT ASCII('A'), CHAR(65);

-- BIT_LENGTH : 할당된 비트 크기 반환		-- 1BYTE = 8BIT
-- CHAR_LENGTH : 문자열의 길이 반환
-- LENGTH : 할당된 BYTE의 크기를 반환

SELECT BIT_LENGTH('pie'), CHAR_LENGTH('pie'), LENGTH('pie');
SELECT 
	menu_name,
    BIT_LENGTH(menu_name),
    CHAR_LENGTH(menu_name),
    LENGTH(menu_name)
FROM
	tbl_menu;
    
-- CONCAT : 문자열을 이어붙임
-- CONCAT_WS : 구분자와 함께 문자열을 이어붙임
-- CONCAT_WS(구분자, 문자열1, 문자열2)

SELECT
	CONCAT('호랑이','기린','판다');
SELECT CONCAT_WS('-', '2024', '2', '23');

-- ELT : 해당 위치의 문자열 반환
-- ELT(위치, 문자열1, 문자열2)

-- FIELD : 찾을 문자열 위치 반환
-- FIELD(찾을 문자열, 문자열1, 문자열2, ...)

-- FIND_IN_SET : 찾을 문자열의 위치 반환