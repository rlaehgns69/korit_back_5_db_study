insert into product_color_tb
values
	(0, 'Black'),
	(0, 'White'),
    (0, "Navy");
    
insert into product_size_tb
values
	(0, "SS"),
	(0, "S"),
	(0, "M"),
	(0, "L"),
	(0, "XL"),
	(0, "XXL");
    
insert into product_tb
values
	(0, "모헤어 브이넥 앙고라 니트", 37400),
	(0, "콘테 코듀로이 와이드 밴딩 팬츠", 38000),
	(0, "버티칼 투웨이 골지 양털 집업", 49000),
	(0, "반집업 꽈배기 카라니트", 48000),
	(0, "후드 MA-1 패딩 점퍼", 62000);
    

insert into product_register_tb
values
	(0,1,2,1),
	(0,1,3,1),
	(0,1,4,1),
	(0,1,5,1),
	(0,2,2,2),
	(0,2,3,2),
	(0,2,4,2),
	(0,2,5,2),
	(0,2,6,2),
	(0,3,3,3),
	(0,3,4,3),
	(0,3,5,3),
	(0,3,6,3),
	(0,4,1,2),
	(0,4,2,2),
	(0,4,3,2),
	(0,4,4,2),
	(0,4,5,2),
	(0,5,2,1),
	(0,5,3,1),
	(0,5,4,1),
	(0,5,5,1);
    
# 가상테이블
create view product_register_view as
select
	prt.product_register_id as pri,
    prt.product_id as pi,
    pt.product_name,
    pt.product_price,
    prt.product_size_id,
    # pst.product_size_id 마스터 기준 left outer join
    pst.product_size_name,
    prt.product_color_id,
    pct.product_color_name
from
	# 마스터 기준
    # (슬레이브(칼라)(칼라 = 마스터(레지스터)) = 레지스터(마스터))
	product_register_tb prt # 마스터
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id);

select 
	product_size_id,
    product_size_name as psn,
    count(product_size_id) as product_size_count
from
	product_register_view
where
    product_size_name like "L"
    or product_size_name like "_L"
    or product_size_name like "__L"
group by
	product_size_id,
    product_size_name;




select
	prt.product_register_id as pri,
    prt.product_id as pi,
    pt.product_name,
    pt.product_price,
    prt.product_size_id,
    # pst.product_size_id 마스터 기준 left outer join
    pst.product_size_name,
    prt.product_color_id,
    pct.product_color_name
    # count(pct.product_color_name) as product_color_name_count
from
	# 마스터 기준
    # (슬레이브(칼라)(칼라 = 마스터(레지스터)) = 레지스터(마스터))
	product_register_tb prt # 마스터
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)
group by
	 product_color_name;
	
select
	prt.product_size_id as 사이즈번호,
    pst.product_size_name as 사이즈명,
    count(prt.product_siproduct_register_tbze_id) as 사이즈수
from
	product_register_tb prt
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id) # 하나의 테이블
# join에 그룹바이 오더바이
group by 
	prt.product_size_id,
	pst.product_size_name
# product size seq순번 (order by 순서가 중요한 테이블)
order by
	prt.product_size_id;

insert into student_tb
	(student_id, name, age, address)
values
	(0, "김도균", 27, "부산 금정구"),
	(0, "김도훈", 25, "부산 부산진구"),
	(0, "김범수", 33, "부산 금정구"),
	(0, "김상현", 26, "부산 남구"),
	(0, "이재영", 26, "부산 서구"),
	(0, "이정찬", 29, "부산 부산진구"),
	(0, "이지언", 26, "부산 동래구"),
	(0, "이평원", 30, "경상남도 양산시"),
	(0, "전주환", 30, "부산 부산진구"),
	(0, "심재원", 29, "부산 남구");

select
	*
from
	student_tb;
		
select
	student_id,
    name,
    age,
    student_address1_sido,
    student_address2_sigungu
from
	student_tb st; # 다시해보자
    # left outer join student_address1_tb sa1t on (=st.student_id)
    # left outer join student_adddress2_tb sa2t on (=st.student_id)
	

	
    
    
    # on (슬레이브(칼라)(칼라 = 마스터(레지스터)) = 레지스터(마스터))
    # on 조건 -프로젝트 칼라 테이블의 칼라 아이디와 프로젝트 등록 테이블의 칼라 아이디가 같을 때
    # 컬럼명 무조건 as(알리아스 기호 쓴다.) from 테이블은 as생략함.(생략이 고정)
    # 재사용

	