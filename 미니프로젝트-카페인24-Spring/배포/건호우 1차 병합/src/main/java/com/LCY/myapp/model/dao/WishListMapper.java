package com.LCY.myapp.model.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.LCY.myapp.model.dto.Wish;
import com.LCY.myapp.model.dto.WishList;

@Service
public interface WishListMapper {

	public void delete(int wish_num);

	public List<WishList> WishListAll();
	
	public List<Wish> searchWishListByUser(String user_id);
}
