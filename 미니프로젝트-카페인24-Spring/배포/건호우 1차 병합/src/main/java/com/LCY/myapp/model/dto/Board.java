package com.LCY.myapp.model.dto;


import lombok.Data;

@Data
public class Board {
	private int cnum;
	private String cafe_code;
	private String content;
	private String user_id;
	private String comment_date;

}
