package com.LCY.myapp.service;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(CommandMap commandMap);

	
	
}
