use `db_study`; #데이터 베이스 선택

insert into student_tb(student_id, name, age, address) values(0, '김준일', 31, "부산 동래구"); # auto increment를 해놓았기 떄문에(0지정)
insert into student_tb(address, name, age, student_id) values("부산 동래구", '김준이', 31, 1);
insert into student_tb(address, name, age) values("부산 동래구", '김준이', 31); # (필요한 값만 넣기)
insert into student_tb values (0, '김준삼', null, null);
insert into student_tb values (0, '김준삼', null, null), (0, '김준사', null, null); #괄호가 한묶음 2개씩 생성 가능

insert into 
	student_tb
	(student_id, name, age, adddress)
 values
	 (0, '김준삼', null, null), 
	 (0, '김준사', null, null); # 줄바꿈 가능
# 끝에 세미콜론

select * from student_tb;

