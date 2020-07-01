package com.LCY.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.LCY.myapp.model.dao.BoardMapper;
import com.LCY.myapp.model.dto.Board;
import com.LCY.myapp.service.BoardService;

@Repository
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public void regist(Board board) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Board read(Integer cnum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(Board board) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(Integer cnum) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Board> listAll() {
		// TODO Auto-generated method stub
		return boardMapper.listAll();
	}

}
