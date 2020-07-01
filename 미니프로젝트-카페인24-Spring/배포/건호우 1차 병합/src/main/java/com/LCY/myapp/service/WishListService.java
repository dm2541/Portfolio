package com.LCY.myapp.service;

import java.util.List;

import com.LCY.myapp.model.dto.WishList;

public interface WishListService {
	
	

	void delete(int wish_num);

	List<WishList> WishListALl();

}
