-- 12시에 탑승자, 하차 인원이 가장 많았던 정거장명의 출력
-- 특정 버스번호기준 6635번
-- 201901월
-- 쿼리 짤 때 구간을 잡고 나머지 부분을 채워가면서 짜는 것이 편하다. 
SELECT 
	MAX(pa_down_12), MAX(pa_up_12), st_name
FROM 
	tbl_seoul_bus_up_down
WHERE
	course_no='6635' AND use_yyyymm='201901';


-- union, union all
-- 월별로 12시 승차, 하차 인원 평균을 보고 싶다. 
-- 버스번호는 6635번
-- group by 하지 않고 처리한다
-- 3개의 selector를 하나로 묶는 형태로 작성한다. 
SELECT AVG(pa_down_12), use_yyyymm
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201902' AND course_no='6635'
union
SELECT AVG(pa_down_12), use_yyyymm
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201901' AND course_no='6635'
union
SELECT AVG(pa_down_12), use_yyyymm
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201903' AND course_no='6635';


SELECT AVG(pa_down_12), use_yyyymm
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201902' AND course_no='6635'
UNION all
SELECT AVG(pa_down_12), use_yyyymm
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201901' AND course_no='6635'
UNION all
SELECT AVG(pa_down_12), use_yyyymm
FROM tbl_seoul_bus_up_down
WHERE use_yyyymm='201903' AND course_no='6635';
-- union은 중복제거의 기능을 가진다. union all은 무조건 다 합친다. (전체 병합)
-- 단, 여기서 컬럼목록이 동일해야 한다. (집합이 같아야 merge가능, 이름이 다르면 별칭으로 이름을 통일해주면 된다 )
-- 최소한 컬럼의 수는 같아야 한다. 


--join
--unique값을 가지는 테이블과 log데이터(같은데이터 반복) 테이블을 연결할 때 사용하는 방법 : inner join의 형태로 병합한다
-- 공통열을 기준으로 join하되,공통 열이 없을 경우 만들 수도 있다. 
/*SELECT *
FROM tbl_seoul_bus_up_down
INNER JOIN tbl_seoul_bus_addr
ON tbl_seoul_bus_up_down.bus_st_ARS_no= tbl_seoul_bus_addr.ARSID;*/

-- 별칭지정하여 다시 확인하고 1월데이터만 출력하는 쿼리 작성 
SELECT *
FROM tbl_seoul_bus_up_down AS s
INNER JOIN tbl_seoul_bus_addr AS t
ON s.bus_st_ARS_no= t.ARSID
WHERE s.use_yyyymm='201901' AND s.course_no='6635';

SELECT s.st_name, t.`X좌표`, t.`Y좌표`, t.addr
FROM tbl_seoul_bus_up_down AS s
INNER JOIN tbl_seoul_bus_addr AS t
ON s.bus_st_ARS_no= t.ARSID
WHERE s.use_yyyymm='201901' AND s.course_no='6635';


-- 서브쿼리(하위쿼리)
-- 12시 20191월 승차인원이 4000 건이 엄는 정류장의 주소 및 좌표는?
-- where은 특정값을 지정하는 조건문에 사용, havingn은 범위를 지정하는 조건문으로 사용한다. 
-- exitst는 하나라도 해당되는 데이터가 있으면 가져오게 하는 쿼리이다 
SELECT *
FROM tbl_seoul_bus_addr
WHERE EXISTS (
					SELECT st_name, SUM(pa_uo_12) AS 'pan12'
					FROM tbl_seoul_bus_up_down
					WHERE use_yyyymm='201901'
					GROUP BY st_name
					HAVING pan12>4000
					ORDER BY pan12 desc
				);


