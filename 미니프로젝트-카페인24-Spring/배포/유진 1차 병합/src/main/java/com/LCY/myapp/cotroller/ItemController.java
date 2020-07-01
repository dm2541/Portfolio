package com.LCY.myapp.cotroller;

import java.io.File;
import java.util.List;

import javax.activation.CommandMap;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.LCY.myapp.model.dao.ItemDAO;
import com.LCY.myapp.model.dto.Product;
import com.LCY.myapp.service.BoardService;

@Controller
public class ItemController {
	/*
	 * 현재 클래스를 컨트롤러 빈에 등록 시킨다 컨트롤러 객체를 스프링에서 생성해서 주입시킨다.
	 */

	
	@Autowired
//따로 new안써도 안에 있는 쿼리 실행 가능 
	private ItemDAO itemDAO;
//북 컨트롤러 
	
//자료출력 
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
//시스템 아웃 찍어줄려고 사용하는것  어느 클래스에서 어떤 정보를 찍어주는지 알려줌 

	/*
	 * @RequestMapping 어노테이션에서 method 속성은 요청 방식(GET or POST)을 분석할 때 사용
	 * 
	 * @Inject xml에 빈설정을 해야한다. ItemController ItemController;
	 */

	
	// 상품 목록페이지
	@RequestMapping("list.do")
	public String ItemList(Model model) {
		// 컨트롤러= 서비스= 다오 요청

		List<Product> list = ItemController.ItemController();
		model.addAllAttributes(list);
		return "ItemList";
	}

	private static List<Product> ItemController() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 상품 등록 페이지
	@RequestMapping(value = "/ItemRegister/{cafe_code}", method = RequestMethod.GET)
	public String creat(Model model, @PathVariable("cafe_code") String cafe_code) {
		model.addAttribute("productList", itemDAO.getProductSearchByCafe(cafe_code));
		model.addAttribute("cafe_code", cafe_code);
		return "admin/ItemRegister";
	}
	
	/*
	 * @RequestMapping(value = "/login.do/new", method = RequestMethod.POST) public
	 * String newItem() { return "redirect:/login.do"; }
	 */
	
	  @RequestMapping(value = "/login.do/new", method = RequestMethod.POST)
	  public String create( Model model, Product product ) {
		model.addAttribute(product);
	   return "redirect:/ItemRegister"; }
	
	/*
	 * public void getItemList(Model Model) throws Exception {
	 * logger.info("ItemRegister"); }
	 */
	
	  
	  @RequestMapping(value = "/productInsert.do", method = {RequestMethod.POST, RequestMethod.GET})
	  public String insertProduct(Product product) {
		  itemDAO.register(product);
		  return "admin/listCafe";
		  
	  }
	  
	  
	@RequestMapping(value = "/deleteItem",method = RequestMethod.GET)
	public String delete(@PathVariable int id, ItemController ProductMapper) {
		ProductMapper.delete(id, ProductMapper);
		return "admin/adminHome";

		/*
		 * //레코드 삭제 ItemProductService.deleteProduct(product_name); return
		 * "redirect:/list.do";
		 */
	}
}
