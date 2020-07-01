package com.LCY.myapp.cotroller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.LCY.myapp.model.dao.CafeMapper;
import com.LCY.myapp.model.dao.ProductMapper;
import com.LCY.myapp.model.dto.Cafe;

@Controller
public class CafeController {
	
	@Autowired
	private CafeMapper cafeMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@RequestMapping(value = "cafeStart", method = RequestMethod.GET)
	public String cafeList(HttpServletRequest request, Cafe cafe) {
		request.getSession().setAttribute("cafeList", cafeMapper.getCafeAll());
		return "cafeStart";
	}
	
	@RequestMapping(value = "searchCafe", method = RequestMethod.POST)
	public String searchCafe(Model model, String cafe_name) {
		model.addAttribute("cafeList", cafeMapper.cafeSearch(cafe_name));			
		return "cafeStart";			
	}
	
	@RequestMapping("cafeDetail/{cafe_code}")
	public String cafeDetail(Model model, @PathVariable String cafe_code) {
		model.addAttribute("productList", productMapper.productSearchByCafeCode(cafe_code));
		model.addAttribute("cafe", cafeMapper.cafeSearchById(cafe_code));
		return "cafeDetail";
	}	

}
