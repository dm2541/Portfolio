package com.LCY.myapp.service;

import java.util.List;

import com.LCY.myapp.model.dto.Cafe;

public interface CafeService {
	public List<Cafe> listCafe();
	public void modifyCafe(Cafe cafe);
	
	public Cafe cafeSearchById(String cafe_code);
}
