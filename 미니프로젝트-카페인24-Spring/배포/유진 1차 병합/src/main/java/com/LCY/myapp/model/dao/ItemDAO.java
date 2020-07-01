package com.LCY.myapp.model.dao;

//어드민 dao
import java.util.List;

import com.LCY.myapp.model.dto.Product;
import com.mysql.cj.x.protobuf.MysqlxCrud.Update;

public interface ItemDAO{

	// 자료 출력
	List<Product> getALLProducts();

	Product getpProduct(int product_name);

	// 수정
	public void updateItem(Product product);

	// 등록
	public void register(Product product) ;

	// 삭제
	public void deleteItem(int product_name);
	
	// 카패코드로 상품 찾기
	public List<Product> getProductSearchByCafe(String cafe_code);

}
