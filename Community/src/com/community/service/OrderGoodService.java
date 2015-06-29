package com.community.service;

import java.util.List;

import com.community.model.Order;
import com.community.model.OrderGood;

public interface OrderGoodService {

	public void addOrderGood(OrderGood orderGood);
	
	public List<OrderGood> getOrderGoodsByGoodId(String goodId);
	
	public OrderGood getOrderGoodByOrderGoodId(int orderGoodId);
	
	public void updateOrderGood(OrderGood orderGood);
}
