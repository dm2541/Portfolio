package com.LCY.myapp.model.dao;

import java.util.List;

import com.LCY.myapp.model.dto.Product;

public interface ProductMapper {
	List<Product> productSearchByCafeCode(String cafe_code);
}
