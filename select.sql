select * from student_tb;
# *의 의미는 전체 컬럼
# (열,테이블,조건)들여쓰기
select 
	student_id,
    name,
    age
from
	student_tb 
where 
	not name = '김준일'
    and name = '김준이'; # 쿼리문 특수기호x and or 조건식(and or not)
    
select
	*
from
	student_tb
where
	name in ('김준일', '김준이'); # or조건과 같이슬 수 있다.alter

select 
	*
from
	student_tb
where
	student_id in
		(
		1,
		2,
		3
		);
select 
	* 
from 
	student_tb;
    
select 
	* 
from 
	student_tb
where 
	age > 19
	and age < 30; # 20대

select 
	* 
from 
	student_tb
where 
	age >= 30
    and age <= 39; # 30대
#where age>=30;

select 
	* 
from 
	student_tb
    # ~서 ~까지 between a and b(숫자, 날짜 며칠)
where 
	age between 20 and 29; # 이상 이하로 잡힘.

# 와일드 카드(%)
# 1.문자열 자르기 (0번째 인덱스만 남김.) substring 할 수 있는데 안함.
# 2. 김으로 시작 name like '김%'
select 
	* 
from 
	student_tb
where 
    #name like '김__'; 
    #글자수 _ _언더바 칸 반영 %시작 글자수제한x
    name like '%도%';
    # %재% 한글자 재가 들어 있으면 됨. 글자형식 사이에 0이 들어가 있는거
    # _ 쉼표 달러 원

# 중간에 도 그리고 끝에 원
select 
	* 
from 
	student_tb
where
	 name like '%원'
	 or name like '%도%';
     
    # name in ('김도훈', '김도균', '이평원', '심재원')
    
    
insert into
	student_tb
		(name, age ,address)
values
	('김도균',27,'부산 금정구'),
	('김도훈',25,'부산 부산진구'),
	('김범수',33,'부산 금정구'),
	('김상현',26,'부산 남구'),
	('이재영',29,'부산 서구'),
	('이정찬',27,'부산 부산진구'),
	('이평원',30,'경상남도 양산시'),
	('전주환',30,'부산 부산진구'),
	('심재원',29,'부산 남구');
    
	

truncate table student_tb;

insert into student_tb(student_id, name, age ,address) values(0,'김도균',27,'부산 금정구');
insert into student_tb(student_id, name, age ,address) values(0,'김도훈',25,'부산 부산진구');
insert into student_tb(student_id, name, age ,address) values(0,'김범수',33,'부산 금정구');
insert into student_tb(student_id, name, age ,address) values(0,'김상현',26,'부산 남구');
insert into student_tb(student_id, name, age ,address) values(0,'이재영',26,'부산 서구');
insert into student_tb(student_id, name, age ,address) values(0,'이정찬',29,'부산 부산진구');
insert into student_tb(student_id, name, age ,address) values(0,'이지언',26,'부산 동래구');
insert into student_tb(student_id, name, age ,address) values(0,'이평원',30,'경상남도 양산시');
insert into student_tb(student_id, name, age ,address) values(0,'전주환',30,'부산 부산진구');
insert into student_tb(student_id, name, age ,address) values(0,'심재원',29,'부산 남구');

-- 	10명의 학생 정보 추가
--     김도균 27 부산 금정구
--     김도훈 25 부산 부산진구
--     김범수 33 부산 금정구	
--     김상현 26 부산 남구
--     이재영 26 부산 서구
--     이정찬 29 부산 부산진구
--     이지언 26 부산 동래구
--     이평원 30 경상남도 양산시
--     전주환 30 부산 부산진구
--     심재원 29 부산 남구


# 집계(그룹화)
# 행이 개수
# 주소가 같은 사람 개수 구하기
# 테이블 그룹바이 셀렉트
select
	name,
	address,
	count(*) as address_count
from
	student_tb
group by
	# name 이름과 어드레스가 같으면
	address
    # having 뺴면 각각 1개 2개이상 아니기 때문에 having이면 안나옴.
having
	address_count >= 2
order by
	address_count desc,
    address asc; # 오름차순(기본)asc desc 
    #프(from)웨(where)그룹이전/그(group)그룹화이후/헤(having)셀(select)오더(order by)