package com.community.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.OrderStateDao;
import com.community.model.OrderState;
import com.community.util.HibernateSessionFactory;
@Repository("orderstateDao")
public class OrderStateDaoImpl implements OrderStateDao {

	@Override
	public OrderState getOneOrderState(OrderState o) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from OrderState o where o.orderStateId =?")
				.setParameter(0, o.getOrderStateId());
		OrderState orderState= (OrderState)query.uniqueResult();
		session.getTransaction().commit();
		session.close();	
		// TODO Auto-generated method stub
		return orderState;
	}

}
