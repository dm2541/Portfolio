package com.LCY.myapp.service;

import java.util.List;

import com.LCY.myapp.model.dto.Board;

public interface BoardService {
	public void regist(Board board) throws Exception;

	public Board read(Integer cNum) throws Exception;

	public void modify(Board board) throws Exception;

	public void remove(Integer cNum) throws Exception;

	public List<Board> listAll();

}
