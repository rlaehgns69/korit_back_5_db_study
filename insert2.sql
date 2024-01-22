insert into author_tb
SELECT 
	-- book_name,
-- 	count(book_name) over(partition by book_name)
	0,
	author
from
	temp_book_tb
group by
	author
order by
	author;
  
# insert into tb select
    
select * from author_tb;


# publisher_tb, 0
insert into publisher_tb(publisher_name)
select
    publisher
from 
	temp_book_tb
group by 
	publisher
order by
	publisher;
    
select * from publisher_tb;

-- insert into book_tb
-- select
-- 	0,
-- 	book_name,
--     author_id,
--     author_name,
--     publisher_id,
--     publisher_name
--     
-- from
-- 	temp_book_tb
--     left outer join author_tb on (author_tb.author_name=temp_book_tb.author)
--     left outer join publisher_tb on(publisher_tb.publisher_name=temp_book_tb.publisher)
-- group by
-- 	book_name,
--     author_id,
--     publisher_id;

	# select 0, 'aaaa', 1, 1 book_id, book_name, author_id, publisher_id
insert into book_tb
select
	0,
    tbt.book_name,
    at.author_id,
    pt.publisher_id
from
	temp_book_tb tbt
	left outer join author_tb at on (at.author_name = tbt.author)
	left outer join publisher_tb pt on (pt.publisher_name = tbt.publisher)
group by
	tbt.book_name,
    at.author_id,
    pt.publisher_id
order by
	book_name,
    author_id,
    publisher_id;

select * from book_tb;

-- select
-- 	0,
--     tbt.book_code,
--     tbt.book_id,
--     tbt.loanscount
--     
-- from
-- 	temp_book_tb tbt
--     left_outer join publisher_tb
--     left outer join author

insert into book_register_tb
select
	0,
	tbt.book_code,
    bt2.book_id, # book_id
    tbt.loans_count
from
	temp_book_tb tbt
	left outer join (select
						bt.book_id,
						bt.book_name,
                        #at.author_id,
                        at.author_name,
                        #pt.publisher_id,
                        pt.publisher_name
					from 
						book_tb bt 
                        left outer join author_tb at on (at.author_id = bt.author_id)
                        left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)) bt2
                        # id book_name author_name 같으면 insert
                        on(bt2.book_name = tbt.book_name and bt2.author_name = tbt.author and bt2.publisher_name = tbt.publisher);
    # left outer join할 때 서브쿼리 or 결과를 조인 select자체도 table select결과를 조인하겠다.
    
    select * from book_register_tb;
select
	*
from
(select
# 출판사 별로 partition by select를 할 때 그룹을 묶는다. 
	rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num,
    # 매치 시킬 때 
	row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num,
	brt.book_register_id,
    brt.book_code,
    # 뺴고
    brt.book_id,
    bt.book_name,
    bt.author_id,
    at.author_name,
    bt.publisher_id,
    pt.publisher_name,
    sum(brt.loans_count) as total_loans_count
from 
	book_register_tb brt
    left outer join book_tb bt on (bt.book_id = brt.book_id)
    left outer join author_tb at on (at.author_id = bt.author_id)
    left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)
group by
	brt.book_id,
	bt.author_id,
    bt.publisher_id) temp_took_register_tb
where 
	temp_took_register_tb.row_num = 1;
    #row_num 1에 해당하는 거