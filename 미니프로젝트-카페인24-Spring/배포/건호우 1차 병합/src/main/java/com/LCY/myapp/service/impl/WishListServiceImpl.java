package com.LCY.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.LCY.myapp.model.dao.WishListMapper;
import com.LCY.myapp.model.dto.WishList;
import com.LCY.myapp.service.WishListService;

@Repository
public class WishListServiceImpl implements WishListService {

	@Autowired
	private WishListMapper wishListMapper;

	@Override
	public List<WishList> WishListALl() {
		System.out.println("===========");
		// TODO Auto-generated method stub
		return wishListMapper.WishListAll();
	}

	@Override
	public void delete(int wish_num) {
		System.out.println("-----------");
		wishListMapper.delete(wish_num); //실행값이 없었다. 그래서 안됬었다. 
		// TODO Auto-generated method stub

	}

}
