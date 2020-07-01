package com.LCY.myapp.service;



import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.LCY.myapp.model.dao.ItemDAO;
import com.LCY.myapp.model.dto.Product;

@Service
public interface ItemProductService  {
//리스트
	public List<ItemDAO> category() throws Exception;
	//등록
	public void register(Product vo) throws Exception;
	//삭제 
	public void deleteItem(int product_name) throws Exception;
	//수정
	public void update(ItemDAO vo) throws Exception;
	

	
	
}
