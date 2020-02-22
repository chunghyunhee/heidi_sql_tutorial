-- 5. 특정 컬럼 항목만 가져온다
-- 필요한 컬럼은 나열한다. ,가 구분자
SELECT 
	 course_no, st_name
FROM 
	tbl_seoul_bus_up_down
LIMIT 
	20;

-- 별칭 > 컬럼명 as 별칭, 테이블명 as 별칭
SELECT 
	course_no AS '버스번호', st_name AS '정거장명'
FROM
	tbl_seoul_bus_up_down
LIMIT 
	5;



-- 6. 버스번호 100번의 정거장명을 추출(조건문작성)
-- 추출하고자하는 열은 select 이고 해당 조건절의 조건은 where절에 입력
SELECT 
	st_name AS '정거장명' 
FROM 
	tbl_seoul_bus_up_down
WHERE
	course_no='100'; 
-- 위의 결과물에서 1월 데이터만 확인한다.(2019년 1월-조건이 하나더 추가)
-- 조건 : 2019년 1월 +  버스번호 100번인 데이터만 추출
-- 조건이 동시성을 가지므로 AND를 쓴다. (논리연산자로 연결한다. OR, NOT...)
SELECT 
	st_name AS '정거장명' , use_yyyymm
FROM 
	tbl_seoul_bus_up_down
WHERE
	course_no='100' AND use_yyyymm=201901;

-- tbl_seoul_bus_up_down. 의 형태로 보면 변수명을 나열해서 볼 수가 있다. 






