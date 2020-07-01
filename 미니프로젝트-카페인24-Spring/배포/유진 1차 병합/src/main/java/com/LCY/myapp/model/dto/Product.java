package com.LCY.myapp.model.dto;
//카테고리 vo 네임 코드 참조 
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.Data;
//book 2 맴퍼 인터페이스 생성하기 (아이템 맵퍼)
@Configuration
@Data
public class Product {
	private String product_code;
	private String cafe_code;
	private String product_price;
	private String product_name;
	private String product_type;
	private String product_img;
	
	@Bean(name="product")
	public Product getUser() {
		return new Product();
	}
}
