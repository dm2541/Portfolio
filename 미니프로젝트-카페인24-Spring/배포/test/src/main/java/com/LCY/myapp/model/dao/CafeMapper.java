package com.LCY.myapp.model.dao;

import java.util.List;

import com.LCY.myapp.model.dto.Cafe;

public interface CafeMapper {
	public List<Cafe> getCafeAll(); 
	public List<Cafe> cafeSearch(String cafe_name);
	public Cafe cafeSearchById(String cafe_code);
	public void insertCafe(Cafe cafe);
	public void deleteCafe(String cafe_code);
	public void updateCafe(Cafe cafe);
	
}
