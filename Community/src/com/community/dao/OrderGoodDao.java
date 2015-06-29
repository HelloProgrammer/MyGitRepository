package com.community.dao;

import java.util.List;

import com.community.model.Order;
import com.community.model.OrderGood;


public interface OrderGoodDao {

	public void addOrderGood(OrderGood orderGood);
	public List<OrderGood> getGoodByOrderId(Order o);
	public List<OrderGood> getOrderGoodsByGoodId(String goodId);
	public OrderGood getOrderGoodByGoodAndOrder(String orderId,String goodId);
	public boolean updateOrderGood(OrderGood og);
	public OrderGood getOrderGoodByOrderGoodId(int orderGoodId);
	
}
