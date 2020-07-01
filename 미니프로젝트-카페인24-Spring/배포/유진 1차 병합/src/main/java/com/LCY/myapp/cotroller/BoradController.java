package com.LCY.myapp.cotroller;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.LCY.myapp.service.BoardService;

@Controller
public class BoradController {

	private BoardService boardService;

	@RequestMapping(value = "/board/boardList")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {

		ModelAndView mav = new ModelAndView("/board/boardList");

		List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
		mav.addObject("list", list);

		return mav;

	}

}
