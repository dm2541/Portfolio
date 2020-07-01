package com.LCY.myapp.model.dao;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;

import org.springframework.stereotype.Repository;

//어드민 dao

@Repository("boardDAO")
public class BoardDAO {

	public static List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("board.selectBoardList",commandMap);
	}

	private static List<Map<String, Object>> selectList(String string, CommandMap commandMap) {
		// TODO Auto-generated method stub
		return null;
	}




}

