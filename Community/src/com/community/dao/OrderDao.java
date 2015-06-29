package com.community.dao;

import java.util.List;

import com.community.model.Order;

public interface OrderDao {
	public List<Order> getAllOrder();
	public Order getOneOrder(String orderId);
	public boolean updateOrder(Order order);
	public boolean distriOrder();
	public List<Order> getOrderByState(String state);	
	public List<Order> getOrderByUsrId(String Id);
	public List<Order> getOrderByStateAndUserId(String state,String Id);
	public List<Order> getAllOrderByTime(String startTime, String endTime, String state);
}
