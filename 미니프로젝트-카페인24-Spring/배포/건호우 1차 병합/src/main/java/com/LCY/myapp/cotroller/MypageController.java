package com.LCY.myapp.cotroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.LCY.myapp.model.dao.OrderMapper;
import com.LCY.myapp.model.dao.WishListMapper;
import com.LCY.myapp.model.dto.User;
import com.LCY.myapp.service.WishListService;

@Controller

public class MypageController {

	@Autowired
	private WishListService wishListService;

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private HttpSession session;

	@Autowired
	private WishListMapper wishListMapper;

	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String MyPageAllList(Model model, HttpServletRequest request) {
		/* List<OrderVo> user = (List<OrderVo>)request.getParameter("user"); */
		/* model.addAttribute("user", user); */
		User user = (User) session.getAttribute("user");// 로그인 컨트롤러에서 setattribute해서, 아이디를 가지고 와야할 필요가있음
		System.out.println("여기까진 넘어오니?매우매우 궁금하구나 ");
		model.addAttribute("orderList", orderMapper.orderList(user.getUser_id()));
		model.addAttribute("wishList", wishListMapper.searchWishListByUser(user.getUser_id()));
		System.out.println("뿌린뒤 ");
		return "MyPage"; // jsp 파일 이름
	}

	@RequestMapping(value = "delete/{wish_num}")
	public String getDelete(Model model, @PathVariable int wish_num) {
		System.out.println("여기까지 넘어오는지 확인" + wish_num);

		// model.addAttribute("delete", wish_num);
		wishListService.delete(wish_num);
		System.out.println("실행되자너");
		// System.out.println(wish_num);
		return "redirect:/myPage";
	}

}
