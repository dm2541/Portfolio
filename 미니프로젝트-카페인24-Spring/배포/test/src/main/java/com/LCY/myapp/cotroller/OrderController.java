package com.LCY.myapp.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {

	@RequestMapping(value = "insertOrderList.do", method = RequestMethod.POST)
	public String InsertOrderList() {
		
		return "myPage";
	}
}
