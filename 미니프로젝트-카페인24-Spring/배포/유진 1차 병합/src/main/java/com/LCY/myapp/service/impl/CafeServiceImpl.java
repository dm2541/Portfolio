package com.LCY.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.LCY.myapp.model.dao.CafeMapper;
import com.LCY.myapp.model.dto.Cafe;
import com.LCY.myapp.service.CafeService;

@Service
public class CafeServiceImpl implements CafeService {

	@Autowired
	private CafeMapper cafeMapper;
	
	@Override
	public List<Cafe> listCafe() {
		// TODO Auto-generated method stub
		return cafeMapper.listCafe();
	}

	@Override
	public void modifyCafe(Cafe cafe) {
		// TODO Auto-generated method stub
		cafeMapper.modifyCafe(cafe);
	}


	@Override
	public Cafe cafeSearchById(String cafe_code) {
		// TODO Auto-generated method stub
		return cafeMapper.cafeSearchById(cafe_code);
	}

	
}

