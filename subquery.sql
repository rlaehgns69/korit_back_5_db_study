select
	at.num,
    at.author_name
from
	(select
		row_number() over(order by author_id desc) as num,
        author_id,
        author_name
	from 
		author_tb
	where
		author_name like '글%') at # from 서브쿼리 as(alias) 무조건
where
	at.num > 10;
# 셀렉트안에 셀렉트 from from 셀렉트의 결과를 가지고 다시 셀렉트

select
	pt.num,
    pt.publisher_name,
    pt.publisher_id
from
	(select
		row_number() over(order by publisher_id desc) as num,
        publisher_name,
        publisher_id
	from
		publisher_tb) pt;
        
# 2가지 원리
# 첫번째 방법
select
	*,
    # 67
    (select
		count(*)
	from
		publisher_tb) as total_count
        # 만들 때마다 select
from 
	publisher_tb;

# 2번째 방법

select
	*
from
	publisher_tb pt
    left outer join(select count(*) as total_count from publisher_tb) pt2 on (1=1); # join은 곱하기 참이면 다 붙는다.
# table하나와 select하나
# 서브쿼리는 column에는 최대한 안써야된다.
# 데이터 양에 따라서 결정

# 조건식(Where on)
# where 조건은 캐싱처리
select
	*
from
	book_tb
where 
	publisher_id in (select publisher_id from publisher_tb where publisher_name like '아%');
	# select 결정 값 비교 100개 - 10 개 비교 (걸러서)

select
	*
from
	book_tb bt
    left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)
    # 따지고 보면 select 100개 100개 조건식 10000번 비교 (합쳐서)
where 
	pt.publisher_name like '아%';

# 성능비교
select @@profiling;
show profiles;
set profiling = 1;
# dml 완료