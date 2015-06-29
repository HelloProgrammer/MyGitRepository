package com.community.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.UserOrderDao;
import com.community.model.Order;
import com.community.service.UserOrderService;

@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService {

	private UserOrderDao userOrderDao;
	
	public UserOrderDao getUserOrderDao() {
		return userOrderDao;
	}
    @Resource(name="userOrderDao")
	public void setUserOrderDao(UserOrderDao userOrderDao) {
		this.userOrderDao = userOrderDao;
	}

	@Override
	public void addOrder(Order order) {
		userOrderDao.addOrder(order);
	}

}
