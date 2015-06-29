package com.community.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.OrderDao;
import com.community.dao.OrderGoodDao;
import com.community.dao.OrderStateDao;
import com.community.model.Order;
import com.community.model.OrderGood;
import com.community.model.OrderState;
import com.community.service.OrderService;
@Service("orderService")
public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;
	private OrderStateDao orderstateDao;
	private OrderGoodDao ordergoodDao;
	
	@Resource(name="orderDao")
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	public OrderStateDao getOrderstateDao() {
		return orderstateDao;
	}
	@Resource(name="orderstateDao")
	public void setOrderstateDao(OrderStateDao orderstateDao) {
		this.orderstateDao = orderstateDao;
	}

	public OrderGoodDao getOrdergoodDao() {
		return ordergoodDao;
	}
	@Resource(name="ordergoodDao")
	public void setOrdergoodDao(OrderGoodDao ordergoodDao) {
		this.ordergoodDao = ordergoodDao;
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	@Override
	public List<Order> getAllOrder() {
		// TODO Auto-generated method stub
		//System.out.println("Service查询前");
		List<Order> orderlist = orderDao.getAllOrder();
		//System.out.println("Service查询后");
		return orderlist;
	}
	@Override
	public Order getOneOrder(String orderId) {
		Order order = orderDao.getOneOrder(orderId);
		// TODO Auto-generated method stub
		return order;
	}
	@Override
	public boolean updateOrder(Order order) {
		if(orderDao.updateOrder(order))
		{
			return true;
		}
		// TODO Auto-generated method stub
		else
		{
			return false;
		}
	}

	@Override
	public OrderState getOneOrderState(OrderState o) {
		// TODO Auto-generated method stub
		OrderState orderstate = orderstateDao.getOneOrderState(o);
		return orderstate;
	}

	@Override
	public List<OrderGood> getGoodByOrderId(Order o) {
		// TODO Auto-generated method stub
		//System.out.println(o.getOrderId());
		List<OrderGood> ordergoodList = ordergoodDao.getGoodByOrderId(o);
		return ordergoodList;
	}
	@Override
	public List<Order> getOrderByState(String state) {
		// TODO Auto-generated method stub
		System.out.println(state);
		List<Order> orderList = orderDao.getOrderByState(state);
		return orderList;
	}

	@Override
	public List<Order> getOrderByUserId(String Id) {
		// TODO Auto-generated method stub
		List<Order> orderlist = orderDao.getOrderByUsrId(Id);
		
		return orderlist;
	}

	@Override
	public List<Order> getOrderByStateAndUserId(String state, String Id) {
		// TODO Auto-generated method stub
		List<Order> orderlist = orderDao.getOrderByStateAndUserId(state, Id);
		return orderlist;
	}


	@Override
	public List<Order> getAllOrderByTime(String startTime, String endTime, String state) {
		List<Order> orderlist = orderDao.getAllOrderByTime(startTime, endTime, state);
		return orderlist;
	}


	@Override
	public OrderGood getOrderGoodByGoodAndOrder(String orderId, String goodId) {
		// TODO Auto-generated method stub
		OrderGood og  = ordergoodDao.getOrderGoodByGoodAndOrder(orderId, goodId);
		return og;
	}

	@Override
	public boolean updateOrderGood(OrderGood og) {
		// TODO Auto-generated method stub
		ordergoodDao.updateOrderGood(og);
		return true;
	}

	

}
