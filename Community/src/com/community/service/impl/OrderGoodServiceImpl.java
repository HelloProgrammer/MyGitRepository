package com.community.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.OrderGoodDao;
import com.community.model.Order;
import com.community.model.OrderGood;
import com.community.service.OrderGoodService;

@Service("orderGoodService")
public class OrderGoodServiceImpl implements OrderGoodService {

	private OrderGoodDao orderGoodDao;
	
	public OrderGoodDao getOrderGoodDao() {
		return orderGoodDao;
	}
    @Resource(name="ordergoodDao")
	public void setOrderGoodDao(OrderGoodDao orderGoodDao) {
		this.orderGoodDao = orderGoodDao;
	}

	@Override
	public void addOrderGood(OrderGood orderGood) {
		orderGoodDao.addOrderGood(orderGood);
	}
	@Override
	public List<OrderGood> getOrderGoodsByGoodId(String goodId) {
		// TODO Auto-generated method stub
		
		List<OrderGood> orderGoodList = new ArrayList<OrderGood>();
		orderGoodList = orderGoodDao.getOrderGoodsByGoodId(goodId);
		return orderGoodList;
		
	}
	@Override
	public OrderGood getOrderGoodByOrderGoodId(int orderGoodId) {
		// TODO Auto-generated method stub
		OrderGood orderGood = new OrderGood();
		orderGood = orderGoodDao.getOrderGoodByOrderGoodId(orderGoodId);
		
		return orderGood;
	}
	@Override
	public void updateOrderGood(OrderGood orderGood) {
		// TODO Auto-generated method stub
		orderGoodDao.updateOrderGood(orderGood);
		
	}
	
	

}
