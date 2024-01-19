delete 
from
	product_register_tb #prt
    # left outer join product_color_tb pct(pct.product_color_id = prt.product_color_id)
# delete는 조인이 안됨.
where
	product_color_id = (select
	product_color_id
from
	product_color_tb
where 
	product_color_name = "Black");
    #=1

/* 서브쿼리
select select 테이블을 새로 넣어서 사용 가능.
 (select
	product_color_id
    # 컬럼 1개
from
	product_color_tb
where 
	product_color_name = "Black") */
# select 결과 2개 이상 나오면 안됨 in()    
    
select
	*
from
	product_register_view;
	# xxxx product_color id product_color_name="Black";