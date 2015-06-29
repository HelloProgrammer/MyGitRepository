package com.community.service;
import java.util.*;

import com.community.model.Order;
import com.community.model.OrderGood;
import com.community.model.OrderState;
public interface OrderService {
	public List<Order> getAllOrder();
	public Order getOneOrder(String orderId);
	public boolean updateOrder(Order order);	
	public boolean updateOrderGood(OrderGood og);
	public OrderState getOneOrderState(OrderState o);	
	public List<OrderGood> getGoodByOrderId(Order o);	
	public List<Order> getOrderByState(String state);
	public List<Order> getOrderByUserId(String Id);
	public List<Order> getOrderByStateAndUserId(String state,String Id);

	public List<Order> getAllOrderByTime(String startTime, String endTime, String state);


	public OrderGood getOrderGoodByGoodAndOrder(String orderId,String goodId);

}
