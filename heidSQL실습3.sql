-- 년월을 그룹으로 잡고 (1~12월까지를 기준으로 잡는 경우이다)
-- group by쿼리를 사용한다. 
SELECT COUNT(*)
FROM tbl_seoul_bus_up_down
WHERE tbl_seoul_bus_up_down.course_no=100
GROUP	BY tbl_seoul_bus_up_down.use_yyyymm;
-- 버스 100번은 정거장의 변화가 없다
-- 별칭 지정 및 해당 년원일까지 함께 출력한다.
SELECT COUNT(*) AS '역 수', use_yyyymm AS '달'
FROM tbl_seoul_bus_up_down
WHERE tbl_seoul_bus_up_down.course_no=100
GROUP	BY tbl_seoul_bus_up_down.use_yyyymm;

-- 12시에 승하차 총원의 월별 집계결과 확인
SELECT 
	COUNT(*) AS '역 수', use_yyyymm AS '달', pa_down_12 AS '12시에 하차 총원', pa_up_12 AS '12시에 승차 총원'
FROM tbl_seoul_bus_up_down
WHERE tbl_seoul_bus_up_down.course_no=100
GROUP	BY tbl_seoul_bus_up_down.use_yyyymm;
-- 12시에 하차 인원이 1명? group by를 했더니 수치가 이상한 결과가 나온다. 
-- 데이터가 각 월마다 하나가 아니기 때문이다 
-- 우리는 총원을 원하므로 sum함수로 총원을 구한다. 
SELECT 
	COUNT(*) AS '역 수', use_yyyymm AS '달', sum(pa_down_12) AS '12시에 하차 총원', sum(pa_up_12) AS '12시에 승차 총원'
FROM tbl_seoul_bus_up_down
WHERE tbl_seoul_bus_up_down.course_no=100
GROUP	BY tbl_seoul_bus_up_down.use_yyyymm;
-- 이외에도 다른 aggregation함수가 가능하다
SELECT 
	COUNT(*) AS '역 수', use_yyyymm AS '달', 
	avg(pa_down_12) AS '12시에 하차 평균', 
	avg(pa_up_12) AS '12시에 승차 평균'
FROM tbl_seoul_bus_up_down
WHERE tbl_seoul_bus_up_down.course_no=100
GROUP	BY tbl_seoul_bus_up_down.use_yyyymm;
-- 그룹으로 묶는 경우는 group by이후에 세부사항 조정하는 형태를 사용한다. 

-- 버스번호 100번, 101번, 102 중에 가져온다, 
-- 2월데이터만 추출한다
-- ~중에 : in , all, any의 연산자 사용가능 
SELECT course_no 
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201902' AND course_no IN ('100', '101', '102');

-- 와일드 카드 => %:검색할때 특정단어가 포함된 것을 찾는 방법(%단어, 단어%, %단어% : 해당 단어의 위치에 따라 다른 쿼리 사용)
-- _: 단어 하나를 의미한다. ex. _원경찰서
-- 경류장 이름이 '한성xxxx'인 단어를 추출하는 형태 
SELECT *
FROM tbl_seoul_bus_up_down
WHERE st_name
LIKE '한성%';

SELECT *
FROM tbl_seoul_bus_up_down
WHERE st_name
LIKE '%대학%';

-- _는 문자갯수를 의미한다
SELECT *
FROM tbl_seoul_bus_up_down
WHERE st_name
LIKE '__경찰서'
LIMIT 5;

-- 중복제거
-- 해당 컬럼에 대한 데이터가 하나씩만 결과로 출력한다 
-- 1월달의 중복제거한 버스번호를 의미한다. 
SELECT DISTINCT course_no
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201901';





