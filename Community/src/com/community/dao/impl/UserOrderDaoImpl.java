package com.community.dao.impl;

import java.sql.Timestamp;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.UserOrderDao;
import com.community.model.Customer;
import com.community.model.Order;
import com.community.model.OrderState;
import com.community.util.GetNewId;
import com.community.util.HibernateSessionFactory;
import com.community.util.Util;

@Repository("userOrderDao")
public class UserOrderDaoImpl implements UserOrderDao {

	@Override
	public void addOrder(Order order) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			//order.setCustomer(new Customer("1"));
			order.setDate(Timestamp.valueOf(Util.getNowTime()));
			order.setOrderState(new OrderState("1"));
			session.save(order);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}

}
