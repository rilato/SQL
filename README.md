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

Day (데e)

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

Tr (ㅅㄱ)

%T : hh:mm:SS

%r : hh:mm:ss AM,PM

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
