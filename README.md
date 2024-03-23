# SQL
study SQL using MySQL

## DATE_FORMAT

DATE_FORMAT(컬럼명, 'TYPE') AS 원하는 컬럼명

Type

====== 연 ======

Year

%Y : 4자리 년도

%y : 2자리 년도

====== 월 ======

Mbc

%M : 영문 월 (긴)

%b : 영문 월 (짧)

%c : 숫자 월 (한 자리 ~ 두 자리)

%m : 숫자 월 (두 자리 고정)

====== 일 ======

day (데e)

%d : 일자 (두 자리 고정)

%e : 일자 (한 자리 ~ 두 자리)

====== 요일 ======

a Week (a, W)

%W : 영문 요일 (긴)

%a : 영문 요일 (짧)

====== 시간 ======

l : '1'2시간 / H : Hour

%l : 시간 (12시간)

%H : 시간 (24시간)

====== 분 ======

minute (m은 '달'이므로, 그다음 문자인 i)

%i : 분

====== 초 ======

Second

%S : 초

====== 시, 분, 초 ======

Tr (ㅅㄱ, Time)

%T : hh:mm:SS

%r : hh:mm:ss AM,PM

## DATEDIFF

일차이 : DATEDIFF(DAY, '2021-06-12', '2021-07-13')

월차이 : DATEDIFF(MONTH, '2021-06-12', '2021-07-13')

연차이 : DATEDIFF(YEAR, '2021-06-12', '2021-07-13')

## CAST

CAST(데이터 형식 또는 값 AS 'TYPE')

Type

BINARY : 이진수로 변환

CHAR : 문자열로 변환 (varChar은 char로 사용 -> CAST(1000 as varchar(10))가 아닌 CAST(1000 as char(10)))

NCHAR : nchar로 변환(char랑 비슷하지만, 국가별 문자 세트로 문자열 생성)

DATE : yyyy-mm-dd의 date로 변환

DATETIME : yyy-mm-dd hh:mm:ss 의 datetime으로 변환

TIME : hh:mm:ss 의 datetime으로 변환

DECIMAL : 최대자릿수인(M), 소수점 이하 자릿수(D)로 지정하여 decimal로 변환

SIGNED : 부호 있는 정수로 변환

UNSIGNED : 부호 없는 정수로 변환

## IF

IF(조건문, 참일 때의 값, 거짓일 때의 값)

SELECT IF(2 > 1, 'TRUE', 'FALSE') AS result

## IFNULL

IFNULL(column_name, value)

SELECT IFNULL(column_name, '대체할 값') FROM [table_name]; 

## ISNULL

SELECT ISNULL(is_discount, 대체할 값) AS result

## ROUND, CEIL, FLOOR

ROUND(값, 위치까지 반올림);

ROUND(3.141592, 0) -- 3

ROUND(3.141592, 1) -- 3.1

CEIL(값, 위치까지 올림);

CEIL(3.141592, 0) -- 3

CEIL(3.141592, 1) -- 3.2

FLOOR(값, 위치까지 내림);

FLOOR(3.141592, 0) -- 3

FLOOR(3.141592, 1) -- 3.1

## CONCAT

CONCAT으로 합쳐진 것은 "문자열"로 됨. 정렬 시 주의!!

CONCAT(값, 값);

## 집계 함수

아래와 같은 함수가 있으며, 이를 사용하기 위해서는 GROUP BY를 해주어야 한다.

AVG(), MIN(), MAX(), COUNT(), COUNT(DISTINCT) : 중복되는 것 한 개만 인정, STDEV() : 표준편차, VAR_SAMP() : 분산
