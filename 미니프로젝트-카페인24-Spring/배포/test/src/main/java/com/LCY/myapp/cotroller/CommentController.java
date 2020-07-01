package com.LCY.myapp.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.LCY.myapp.model.dao.CommentMapper;
import com.LCY.myapp.model.dto.Comment;

@Controller
public class CommentController {

	@Autowired
	private CommentMapper commentMapper;
	
	@RequestMapping(value = "commentInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertComment(Comment comment){
		commentMapper.commentInsert(comment);
		return "success";
	}
	
	@RequestMapping("/admin/commentDelete.do/{cnum}")
	public String deleteComment(@PathVariable int cnum) {
		commentMapper.commentDelete(cnum);
		return "admin/listCafe";
	}
}
