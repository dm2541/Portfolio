package com.LCY.myapp.cotroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.LCY.myapp.model.dao.CafeMapper;
import com.LCY.myapp.model.dao.UserMapper;
import com.LCY.myapp.model.dto.User;

@Controller
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private CafeMapper cafeMapper;

	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("goLogin")
	public String goLogin() {
		return "login";
	}
	
	@RequestMapping("goJoin")
	public String goJoin() {
		return "join";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request, User user) {
		User user1 = userMapper.searchUser(user);
		if(user1 != null) {
			if(user.getUser_id().equals("lee")) {
				System.out.println(cafeMapper.listCafe());
				request.getSession().setAttribute("list", cafeMapper.listCafe());
				return "admin/listCafe";
			}
			request.getSession().setAttribute("user", user1);
			return "index";
		} 
		else return "login";	
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(User user) {
		userMapper.insertUser(user);
		return "index";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Boolean> idCheck(String user_id) {
		System.out.println(user_id);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		int check_num = userMapper.userIdCheck(user_id);
		if (check_num > 0) {
			map.put("check", false);
		} else {
			map.put("check", true);
		}
		System.out.println(map.toString());
		return map;
	}

	@RequestMapping(value = "/nickNameCheck", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Boolean> nickNameCheck(String user_nickName) {
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		int check_num = userMapper.userNickNameCheck(user_nickName);
		if (check_num > 0) {
			map.put("check", false);
		} else {
			map.put("check", true);
		}

		return map;
	}
	

}
