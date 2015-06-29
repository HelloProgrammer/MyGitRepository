package com.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.OrderDao;
import com.community.model.Order;
import com.community.util.HibernateSessionFactory;
@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {

	@Override
	public List<Order> getAllOrder() {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Order> orderlist = new ArrayList<Order>();
		Query query = session.createQuery("from Order");
		//System.out.println("呵呵查询语句");
		for(Object o:query.list())
		{
			Order order = (Order)o;
			orderlist.add(order);
		}
		session.getTransaction().commit();
		session.close();
		
		return orderlist;

	}	
	
	@Override
	public List<Order> getOrderByState(String state) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Order> orderlist = new ArrayList<Order>();
		Query query = session.createQuery("from Order o where o.orderState.orderStateId = ?")
		.setParameter(0, state);
		for(Object o:query.list())
		{
			Order order = (Order)o;
			orderlist.add(order);
		}
		session.getTransaction().commit();
		session.close();
		
		return orderlist;
		
		
	}

	@Override
	public Order getOneOrder(String orderId) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Order order where order.orderId =?")
				.setParameter(0, orderId);
		Order order = (Order)query.uniqueResult();
		session.getTransaction().commit();
		session.close();		
		return order;
	}
	
	@Override
	public boolean updateOrder(Order order) {
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();		
		session.update(order);	
		session.getTransaction().commit();
		session.close();
		
	  
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean distriOrder() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Order> getOrderByUsrId(String Id) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Order order where order.customer.userId =?")
				.setParameter(0, Id);
		List<Order> orderlist = new ArrayList<Order>();
		
		for(Object o:query.list())
		{
			Order order = (Order)o;
			orderlist.add(order);
		}
		session.getTransaction().commit();
		session.close();
		return orderlist;
		
	}

	@Override
	public List<Order> getOrderByStateAndUserId(String state, String Id) {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Order order where order.customer.userId =? and order.orderState.orderStateId = ? ")
				.setParameter(0, Id).setParameter(1, state);
		List<Order> orderlist = new ArrayList<Order>();
		
		for(Object o:query.list())
		{
			Order order = (Order)o;
			orderlist.add(order);
		}
		session.getTransaction().commit();
		session.close();
		return orderlist;
		
	}

	@Override
	public List<Order> getAllOrderByTime(String startTime, String endTime, String state) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Order> orderlist = new ArrayList<Order>();
		Query query = session.createQuery("from Order order where (convert(varchar,order.date,120) between ? and ?) and order.orderState.orderStateId = ?")
				      .setParameter(0, "'"+startTime+" 00:00:00.000'")
				      .setParameter(1, "'"+endTime+" 23:59:59.000'")
		              .setParameter(2, state);
		//System.out.println("呵呵查询语句");
		for(Object o:query.list())
		{
			Order order = (Order)o;
			orderlist.add(order);
		}
		session.getTransaction().commit();
		session.close();
		
		return orderlist;
	}
	
	
}
