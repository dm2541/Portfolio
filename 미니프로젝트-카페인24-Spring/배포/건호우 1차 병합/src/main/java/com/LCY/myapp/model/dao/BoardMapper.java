package com.LCY.myapp.model.dao;

import java.util.List;

import com.LCY.myapp.model.dto.Board;

public interface BoardMapper {
	public void create(Board vo) throws Exception;

	public Board read(Integer cnum) throws Exception;

	public void update(Board vo) throws Exception;

	public void delete(Integer cnum) throws Exception;

	public List<Board> listAll();

}
