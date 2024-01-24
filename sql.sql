select
		auto_increment 
from
		information_schema
where
		table_schema = 'db_study' 
        and table_name = 'author_tb';
        
SELECT 
book_tb.book_id,
book_tb.book_name,
author_tb.author_id, 
author_tb.author_name,
publisher_tb.publisher_id,
publisher_tb.publisher_name
                    FROM book_tb 
                    JOIN author_tb ON book_tb.author_id = author_tb.author_id 
                    JOIN publisher_tb ON book_tb.publisher_id = publisher_tb.publisher_id
                    WHERE book_tb.name = ?;
                    
                    
select 
	bt.book_id,
    bt.book_name,
    bt.author_id,
    at.author_name,
    bt.publisher_id,
    pt.publisher_name
from
	book_tb bt
    left outer join author_tb at on(at.author_id = bt.author_id)
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	bt.book_name like '%?%';
