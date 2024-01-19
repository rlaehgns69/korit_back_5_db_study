update product_color_tb
# select update delete
set product_color_name = "Green"
where 
	product_color_name='Navy';
    # 워크벤치 키값으로만 update (*auto increment)

update product_color_tb
set
	product_color_name_kor = case 
		when product_color_name="Black" then "블랙" 
		when product_color_name="White" then "화이트" 
		when product_color_name="Grren" then "그린" 
	end;
