package com.LCY.myapp.model.dto;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Configuration
@Data
public class Cafe {
	private String cafe_code;
	private String cafe_name;
	private String cafe_addr;
	private String cafe_tel;
	private String cafe_img;
	private MultipartFile cafeImgFile;
	

}
