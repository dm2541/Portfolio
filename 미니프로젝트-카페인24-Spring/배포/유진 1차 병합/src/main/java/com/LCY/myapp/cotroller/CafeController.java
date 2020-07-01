package com.LCY.myapp.cotroller;



import java.io.File;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.LCY.myapp.model.dao.CafeMapper;
import com.LCY.myapp.model.dao.ProductMapper;
import com.LCY.myapp.model.dto.Cafe;
import com.LCY.myapp.service.CafeService;

@Controller
public class CafeController {	
	@Autowired
	private CafeService cafeservice;
	
	@Autowired
	private CafeMapper cafeMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/admin/registCafe.do")
	public String registCafe() {
		
		return "/admin/registCafe";
	}
	
	@RequestMapping(value = "/admin/listCafe.do")
	public String listCafe(Model model) {
		
		model.addAttribute("list", cafeMapper.listCafe());
		return "/admin/listCafe";
	}
	
	@RequestMapping("/admin/modifyCafe.do")
	public String modifyCafe(@ModelAttribute Cafe cafe, Model model){

		cafeservice.modifyCafe(cafe);
		model.addAttribute("list", cafeMapper.listCafe());
		return "/admin/listCafe";
	}
	
	@RequestMapping("/admin/{cafe_code}")
	public String viewCafe(Model model, @PathVariable String cafe_code) {
		
		model.addAttribute("cafe", cafeMapper.cafeSearchById(cafe_code));
		return "/admin/viewCafe";
	}
	
	@RequestMapping("/admin/delete/{cafe_code}")
	public String delteCafe(Model model, @PathVariable String cafe_code){
		cafeMapper.deleteCafe(cafe_code);
		model.addAttribute("list", cafeMapper.listCafe());
		return "/admin/listCafe";
	}
	
	@RequestMapping(value = "/admin/insert.do", method = RequestMethod.POST)
	    public String insertCafe(Cafe cafe){
	
		 cafeMapper.registCafe(cafe);
	        
	        return "redirect:/admin/listCafe.do";
	    }
	
	
	
}
