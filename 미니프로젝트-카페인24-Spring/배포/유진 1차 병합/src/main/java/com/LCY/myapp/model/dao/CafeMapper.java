package com.LCY.myapp.model.dao;

import java.util.List;

import com.LCY.myapp.model.dto.Cafe;


public interface CafeMapper {

	public void registCafe(Cafe cafe);
	public List<Cafe> listCafe();
	public void modifyCafe(Cafe cafe);
	public void deleteCafe(String cafe_code);
	public Cafe cafeSearchById(String cafe_code);

}
