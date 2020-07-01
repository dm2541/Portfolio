package com.LCY.myapp.model.dao;

import java.util.List;

import com.LCY.myapp.model.dto.Order;
import com.LCY.myapp.model.dto.OrderVo;

public interface OrderMapper {
	public List<Order> orderAll();

	public List<OrderVo> orderList(String user_id);
}
