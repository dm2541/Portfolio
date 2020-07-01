package com.LCY.myapp.model.dto;

import lombok.Data;

@Data
public class WishList {
	private int wish_num;
	private String user_id;
	private String cafe_code;
	private String cafe_name;
	private String cafe_addr;

}
