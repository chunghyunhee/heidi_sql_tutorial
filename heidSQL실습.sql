/* 실습.
데이터들은 각 테이블안에 들어가 있다,
1개의 테이블에서 전체 데이터를 보자.
윈도우에서는 주석으로 코드 막으면서 확인하기 */


-- 1. 데이터 확인.
-- * : 모든 컬럼
SELECT * 
FROM tbl_seoul_bus_addr;

 SELECT * 
FROM tbl_seoul_bus_up_down;

-- 2. 데이터 전체 크기 확인.
-- 컬럼은 count하여 그 데이터가 몇개인지를 확인한다. 
SELECT COUNT(*) 
FROM tbl_seoul_bus_addr;

SELECT COUNT(id) 
FROM tbl_seoul_bus_addr;

SELECT COUNT(id)
FROM tbl_seoul_bus_up_down;

-- 3. 결과물의 컬럼명의 지정(별칭부여)
SELECT COUNT(id) AS cnt
FROM tbl_seoul_bus_addr;

-- 4. 상위 데이터 확인
-- 최상위 1개만
-- 정렬한 적이 없으므로 첫번째 데이터만 실행된다. 
SELECT *
FROM tbl_seoul_bus_up_down
LIMIT 1;
--가장 마지막 데이터 한개만 추출(+ 내림차순 정렬)
-- 데이터 만들어진 형태 확인하고 정렬한다. 
--id값 기준 오름차순 정렬하여 확인후 추출
SELECT *
FROM tbl_seoul_bus_up_down
ORDER BY id desc
LIMIT 1;
-- 마지막 데이터 5개만 확인하는 경우 (paging)
SELECT *
FROM tbl_seoul_bus_up_down
ORDER BY id DESC
LIMIT 5;
-- 처음 데이터에서 5번째~10번째 데이터 확인하는 경우 
SELECT *
FROM tbl_seoul_bus_up_down
LIMIT 4, 6;
-- 처음 데이터에서 0번째 부터 5개씩 출력한다. 
-- 한번에 보여지는 데이터의 수 *(페이지 번호 -1)
-- 0,5,10,15,20...의 형태로 paging지정되는 형태 
SELECT *
FROM tbl_seoul_bus_up_down
LIMIT 0, 5;
SELECT *
FROM tbl_seoul_bus_up_down
LIMIT 5, 5;
SELECT *
FROM tbl_seoul_bus_up_down
LIMIT 10, 5;












