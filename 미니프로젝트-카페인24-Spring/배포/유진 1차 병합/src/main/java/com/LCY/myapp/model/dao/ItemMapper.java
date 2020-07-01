package com.LCY.myapp.model.dao;

import org.apache.ibatis.annotations.Insert;

public interface ItemMapper {

	@Insert("insert into product (product_type ,product_name, product_price) values (#{product_type},#{product_name},#product_price{}")
	public boolean create();

}
