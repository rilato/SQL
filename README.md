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

두 날짜 간의 차이를 계산. 단, 두 날짜의 형식은 ('1997-06-26', '1997-12-25')와 같은 형식이어야 함.

즉, 시간과 관련한 것이 껴있으면 안됨

String, Date 디렉토리의 "자동차 대여 기록에서 장기/단기 대여 구분하기" 문제처럼, 기간 계산에 주의하기!! DATEDIFF(ENDDATE - STARTDATE) + 1해야 하는 경우가 많음

DATEDIFF(ENDDATE, STARTDATE)

## ROUND, CEIL, FLOOR

ROUND(값, 위치까지 반올림);

ROUND(3.141592, 0) -- 3

ROUND(3.141592, 1) -- 3.1

CEIL과 FLOOR는 ROUND 함수와는 다르게, 매개 값을 받아 올림 / 버림할 자릿수를 정할 수는 없다.

CEIL(값);

CEIL(3.141592) -- 4

FLOOR(값);

FLOOR(3.141592) -- 3

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

## CONCAT

문자열 합치기

CONCAT으로 합쳐진 것은 "문자열"로 됨. 정렬 시 주의!!

CONCAT(값, 값);

## SUBSTRING

문자열 자르기

SUBSTRING(문자열, 시작 위치, 길이)

cf) 문자열의 시작 위치는 1부터 시작한다! (0부터 아님!!)

## 집계 함수

아래와 같은 함수가 있으며, 이를 사용하기 위해서는 GROUP BY를 해주어야 한다.

AVG(), MIN(), MAX(), COUNT(), COUNT(DISTINCT) : 중복되는 것 한 개만 인정, STDEV() : 표준편차, VAR_SAMP() : 분산

## RANK

RANK 함수는 중복 값들에 대해서 동일 순위로 표시하고, 중복 순위 다음 값에 대해서는 중복 개수만큼 떨어진 순위로 출력하도록 하는 함수

EX) 1, 1, 1, 4, 5, 6 ...

SELECT RANK() OVER (ORDER BY 등수매길컬럼 정렬기준ASC/DESC) AS 별칭 FROM 테이블;

DENSE_RANK 함수는 중복 값들에 대해서 동일 순위로 표시하고, 중복 순위 다음 값에 대해서는 중복 값 개수와 상관없이 순차적인 순위 값을 출력하도록 하는 함수

EX) 1, 1, 1, 2, 3, 4 ...

SELECT DENSE_RANK() OVER (ORDER BY 등수매길컬럼 정렬기준ASC/DESC) AS 별칭 FROM 테이블;

ROW_NUMBER 함수는 중복 값들에 대해서도 순차적인 순위를 표시하도록 출력하는 함수

EX) 1, 1, 1, 2, 3, 4 ... => ROW_NUMBER 적용 시, 같은 1끼리도 순차 적용 => 1, 2, 3, 4, 5, 6 ...

SELECT ROW_NUMBER() OVER (ORDER BY 등수매길컬럼 정렬기준ASC/DESC) AS 별칭 FROM 테이블;
