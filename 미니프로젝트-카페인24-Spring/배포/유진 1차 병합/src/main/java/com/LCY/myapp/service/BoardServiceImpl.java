package com.LCY.myapp.service;

import java.util.List;
import java.util.Map;


import javax.activation.CommandMap;

import com.LCY.myapp.model.dao.BoardDAO;

public class BoardServiceImpl implements BoardService {
	/*
	 * Logger log= Logger.getLogger(this.getClass());
	 */
	
	@Override
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
		// TODO Auto-generated method stub
		return BoardDAO.selectBoardList(commandMap);
		
		
	}


	
}
