package com.LCY.myapp.model.dao;

import com.LCY.myapp.model.dto.Wish;

public interface WishMapper {
	public int wishListInsert(Wish wish);
	public void wishListDelete(Wish wish);
}
