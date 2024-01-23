# p_insert_book()
# 동시에 insert가 일어나는 상황
set @book_name = '자바의 정석';
set @author = '남궁성';
set @publisher = '도우출판';
set @book_name = '혼자 공부하는 sql';
set @author = '우재남';
set @publisher = '한빛미디어';

# 자바 백엔드
set @new_author_id = 0;
set @new_publisher_id = 0;
# 삽입과 동시에
insert into author_tb
values (0, @author);

select
	max(author_id) into @new_author_id
from
	author_tb;
    
#select @new_author_id;

insert into publisher_tb
values (0, @publisher);

select
	max(publisher_id) into @new_publisher_id
from
	publisher_tb;

insert into book_tb
values (0, @book_name, @new_author_id, @new_publisher_id);

select
	*
from
	book_tb
order by
	book_id desc;
    
