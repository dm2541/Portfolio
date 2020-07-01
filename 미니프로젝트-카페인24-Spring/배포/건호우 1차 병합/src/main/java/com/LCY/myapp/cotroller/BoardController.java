package com.LCY.myapp.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.LCY.myapp.model.dto.Board;
import com.LCY.myapp.service.BoardService;

@Controller

public class BoardController {

	@Autowired
	private BoardService service; // Service 호출을 위한 객체 생성

	@RequestMapping(value = "listAll.do", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", service.listAll());
		return "listAll";
	}

	@RequestMapping(value = "regist.do", method = RequestMethod.POST)
	public String registPOST(Board board, RedirectAttributes rttr) throws Exception {
		service.regist(board);
		return "regist";
	}
	

	@RequestMapping(value = "read", method = RequestMethod.POST)
	public void read(@RequestParam("cnum") int cnum, Model model) throws Exception {
		model.addAttribute(service.read(cnum));
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET) // GET 방식으로 페이지 호출
	public void modifyGET(int cnum, Model model) throws Exception {
		model.addAttribute(service.read(cnum)); // 수정을 위한 글읽기 서비스 호출
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST) // POST방식으로 데이터 전송
	public String modifyPOST(Board board, RedirectAttributes rttr) throws Exception {
		service.modify(board); // 글수정 서비스 호출
		return "redirect:/listAll"; // 수정이 완료된 후, 목록페이지로 리턴
	}

	@RequestMapping(value = "remove", method = RequestMethod.POST) // POST방식으로 데이터 전송
	public String removePOST(@RequestParam("cNum") Integer cnum, RedirectAttributes rttr) throws Exception {
		service.remove(cnum); // 글삭제 서비스 호출
		return "redirect:/listAll"; // 삭제가 완료된 후, 목록페이지로 리턴
	}
}
