package com.LCY.myapp.model.dto;

import lombok.Data;

@Data
public class Order {
	private int order_code;
	private String user_id;
	private String product_code;
	private String cafe_name;
	private String product_name;
}
