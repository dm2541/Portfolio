package com.LCY.myapp.cotroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.LCY.myapp.model.dao.CafeMapper;
import com.LCY.myapp.model.dao.CommentMapper;
import com.LCY.myapp.model.dao.ProductMapper;
import com.LCY.myapp.model.dto.Cafe;
import com.LCY.myapp.model.dto.CriteriaVO;
import com.LCY.myapp.model.dto.PageMakerVO;

@Controller
public class CafeController {
	
	@Autowired
	private CafeMapper cafeMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@RequestMapping("/admin/registCafe.do")
	public String registCafe() {	
		return "/admin/registCafe";
	}
	
	@RequestMapping(value = "/admin/insert.do", method = RequestMethod.POST)
    public String insertCafe(Cafe cafe){
		cafeMapper.insertCafe(cafe);
        return "redirect:/admin/listCafe.do";
    }
	

	@RequestMapping("/admin/{cafe_code}")
	public String viewCafe(Model model, @PathVariable String cafe_code, CriteriaVO cri) {
		model.addAttribute("cafe", cafeMapper.cafeSearchById(cafe_code));
		model.addAttribute("commentList", commentMapper.searchCommentByCafe(cri, cafe_code));
		return "/admin/viewCafe";
	}
	
	// 상품 삭제
	@RequestMapping("/admin/delete/{cafe_code}")
	public String delteCafe(HttpSession session, Model model, @PathVariable String cafe_code){
		cafeMapper.deleteCafe(cafe_code);
		session.setAttribute("list", cafeMapper.getCafeAll());
		return "/admin/listCafe";
	}
	
	@RequestMapping("/admin/modifyCafe.do")
	public String modifyCafe(Cafe cafe, Model model){
		System.out.println(cafe);
		cafeMapper.updateCafe(cafe);
		model.addAttribute("list", cafeMapper.getCafeAll());
		return "/admin/listCafe";
	}
	
	@RequestMapping(value = "/admin/listCafe.do")
	public String listCafe(Model model) {
		model.addAttribute("list", cafeMapper.getCafeAll());
		return "/admin/listCafe";
	}
	
	/////////////////////////////// 관리자 끝
	
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
	public String cafeDetail(Model model, CriteriaVO cri, @PathVariable String cafe_code) {
		model.addAttribute("productList", productMapper.productSearchByCafeCode(cafe_code));
		
		PageMakerVO pageMaker = new PageMakerVO();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(commentMapper.getCommentCount(cafe_code));
		model.addAttribute("commentList", commentMapper.searchCommentByCafe(cri, cafe_code));
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("cafe", cafeMapper.cafeSearchById(cafe_code));
		model.addAttribute("maxComment", commentMapper.getCommentCount(cafe_code));
		return "cafeDetail";
	}	

}
