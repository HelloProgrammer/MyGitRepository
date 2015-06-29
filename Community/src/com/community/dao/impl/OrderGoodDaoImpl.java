package com.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.OrderGoodDao;
import com.community.model.Order;
import com.community.model.OrderGood;
import com.community.util.HibernateSessionFactory;
@Repository("ordergoodDao")
public class OrderGoodDaoImpl implements OrderGoodDao {

	@Override
	public List<OrderGood> getGoodByOrderId(Order o) {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<OrderGood> ordergoodlist = new ArrayList<OrderGood>();
		Query query = session.createQuery("from OrderGood og where og.order.orderId =?")
				.setParameter(0, o.getOrderId());
		//System.out.println("鍛靛懙鏌ヨ璇彞");
		for(Object ob:query.list())
		{
			OrderGood og = (OrderGood)ob;
			ordergoodlist.add(og);
		}
		session.getTransaction().commit();
		session.close();
		return ordergoodlist;
	}
	@Override
	public void addOrderGood(OrderGood orderGood) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			orderGood.setCommentState("未评论");
			session.save(orderGood);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}
	@Override
	public List<OrderGood> getOrderGoodsByGoodId(String goodId) {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<OrderGood> ordergoodlist = new ArrayList<OrderGood>();
		Query query = session.createQuery("from OrderGood og where og.good.goodId =?")
				.setParameter(0,goodId);
		//System.out.println("鍛靛懙鏌ヨ璇彞");
		for(Object ob:query.list())
		{
			OrderGood og = (OrderGood)ob;
			ordergoodlist.add(og);
		}
		session.getTransaction().commit();
		session.close();
		return ordergoodlist;
		
	}

	@Override
	public OrderGood getOrderGoodByOrderGoodId(int orderGoodId) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from OrderGood orderGood where orderGood.id =?")
				.setParameter(0, orderGoodId);
		OrderGood orderGood = (OrderGood)query.uniqueResult();
		session.getTransaction().commit();
		session.close();		
		return orderGood;
	}
	@Override
	public OrderGood getOrderGoodByGoodAndOrder(String orderId, String goodId) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<OrderGood> ordergoodlist = new ArrayList<OrderGood>();
		Query query = session.createQuery("from OrderGood og where og.order.orderId = ? and og.good.goodId =?")
				.setParameter(0, orderId).setParameter(1,goodId);
		
		for(Object ob:query.list())
		{
			OrderGood og = (OrderGood)ob;
			ordergoodlist.add(og);
		}
		session.getTransaction().commit();
		session.close();
		return ordergoodlist.get(0);
	}

	@Override
	public boolean updateOrderGood(OrderGood og) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		try
		{
			session.update(og);
			session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
		finally
		{
			
			session.close();
			
		}
		return true;
		
	}

}
