package com.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.CartDao;
import com.community.model.Cart;
import com.community.util.HibernateSessionFactory;

@Repository("cartDao")
public class CartDaoImpl implements CartDao {

	@Override
	public void addCart(Cart cart) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(cart);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}
	
	@Override
	public void updateCartGoodNum(Cart cart) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update Cart cart set cart.num=cart.num+"+cart.getNum()+
					                          " where cart.customer.userId=? and cart.good.goodId=?")
					                          .setParameter(0, cart.getCustomer().getUserId())
					                          .setParameter(1, cart.getGood().getGoodId());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Cart> findAllCartByUserandGood(Cart cart) {
		List<Cart> carts = new ArrayList<Cart>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Cart cart where cart.customer.userId=? and " +
					                          "cart.good.goodId=?")
					                          .setParameter(0, cart.getCustomer().getUserId())
					                          .setParameter(1, cart.getGood().getGoodId());
			for(Object o : query.list()) {
				Cart c = (Cart)o;
				carts.add(c);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return carts;
	}

	@Override
	public List<Cart> findAllCartByUser(Cart cart) {
		List<Cart> carts = new ArrayList<Cart>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Cart cart where cart.customer.userId=?")
					                         .setParameter(0, cart.getCustomer().getUserId());
			for(Object o : query.list()) {
				Cart c = (Cart)o;
				carts.add(c);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return carts;
	}

	@Override
	public List<Cart> findAllCartByUserId(String userId) {
		List<Cart> carts = new ArrayList<Cart>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Cart cart where cart.customer.userId="+userId);
			for(Object o : query.list()) {
				Cart c = (Cart)o;
				carts.add(c);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return carts;
	}

	@Override
	public void deleteCart(Cart cart) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete Cart cart where cart.customer.userId=? and cart.good.goodId=?")
					                          .setParameter(0, cart.getCustomer().getUserId())
					                          .setParameter(1, cart.getGood().getGoodId());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}

}
