package com.community.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import com.community.model.Good;
import com.community.model.OrderGood;
import com.community.dao.GoodDao;
import com.community.util.HibernateSessionFactory;


@Repository("goodDao")
public class GoodDaoImpl implements GoodDao{

	@Override
	public void addGood(Good good) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(good);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Good> getAllGood() {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Good> goodlist = new ArrayList<Good>();
		Query query = session.createQuery("from Good");
		for(Object o:query.list())
		{
			Good good = (Good)o;
			goodlist.add(good);
		}
		session.getTransaction().commit();
		session.close();
		
		return goodlist;
	}
	
	@Override
	public Good getOneGood(String goodId) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("from Good good where good.goodId =?")
				.setParameter(0, goodId);
		
		Good good = (Good)query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		
		return good;
	}

	@Override
	public void deleteGood(Good good) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("delete from Good g where g.goodId=?" ).setParameter(0,good.getGoodId());
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
	}
	public void deleteGood(String id)
	{
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("delete from Good g where g.goodId=?" ).setParameter(0,id);
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void updateGood(Good good)throws HibernateException, SQLException  {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		try
		{
			session.update(good);
			session.getTransaction().commit();
		}		
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			
		}
		finally
		{
			
			session.close();
			
		}
		
	
		
	}
	@Override
	public List<Good> findGoodById(Good good) {
		List<Good> goods = new ArrayList<Good>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Good good where good.goodId=?")
					      .setParameter(0, good.getGoodId());
			for(Object o : query.list()) {
				Good g = (Good)o;
				goods.add(g);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return goods;
	}

	@Override
	public void modifyGoodNum(OrderGood orderGood) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			
			Query query = session.createQuery("update Good good set good.stock=good.stock-?,good.saleNum=good.saleNum+? where good.goodId=?")
					      .setParameter(0, orderGood.getNum())
					      .setParameter(1, orderGood.getNum())
					      .setParameter(2, orderGood.getGood().getGoodId());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}
	public List<Good> getGoodsByKindId(String kindId) {
		// TODO Auto-generated method stub
		List<Good> goods = new ArrayList<Good>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Good good where good.kind.kindId=?")
			              .setParameter(0, kindId);
			for(Object o : query.list()){
				Good k = (Good)o;
				goods.add(k);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return goods;
	}

	@Override
	public List<Good> getAllGoodBySaleNum() {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Good> goodlist = new ArrayList<Good>();
		Query query = session.createQuery("from Good good order by good.saleNum desc");
		for(Object o:query.list())
		{
			Good good = (Good)o;
			goodlist.add(good);
		}
		session.getTransaction().commit();
		session.close();
		
		return goodlist;
	}

	@Override
	public List<Good> showAllGoodDesc() {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Good> goodlist = new ArrayList<Good>();
		Query query = session.createQuery("from Good");
		for(Object o:query.list())
		{
			Good good = (Good)o;
			goodlist.add(good);
		}
		session.getTransaction().commit();
		session.close();
		
		return goodlist;
	}

	@Override
	public List<Good> showAllGoodAsc() {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Good> goodlist = new ArrayList<Good>();
		Query query = session.createQuery("from Good");
		for(Object o:query.list())
		{
			Good good = (Good)o;
			goodlist.add(good);
		}
		session.getTransaction().commit();
		session.close();
		
		return goodlist;
	}

}
