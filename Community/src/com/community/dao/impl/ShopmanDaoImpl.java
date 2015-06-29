package com.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.ShopDao;
import com.community.dao.ShopmanDao;
import com.community.model.Shop;
import com.community.model.Shopman;
import com.community.model.Warehouse;
import com.community.util.GetNewId;
import com.community.util.HibernateSessionFactory;

@Repository("shopmanDao")
public class ShopmanDaoImpl implements ShopmanDao {

	ShopDao shopDao ;
	
	@Resource(name="shopDao")
	public void setShopDaos(ShopDao shopDao) {
		this.shopDao = shopDao;
	}
	@Override
	public void deleteShopmans(Warehouse warehouse) {
		// TODO Auto-generated method stub
		
		List<Shop> shops = new ArrayList<Shop>();
		shops = shopDao.findShops(warehouse);
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		if(shops.size()>0)
		{
			for(int i = 0;i<shops.size();i++)
			{
				Query query = session.createQuery("delete from Shopman u where u.shop.shopId=" + shops.get(i).getShopId());
				query.executeUpdate();
			}
			
		}
		
		session.getTransaction().commit();
		session.close();
		
		
	}
	@Override
	public void addShopman(Shopman shopman) {
		// TODO Auto-generated method stub
	
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		shopman.setShopmanId(GetNewId.getNewShopmanId()+"");
		session.save(shopman);
		session.getTransaction().commit();
		session.close();
		
	}
	@Override
	public List<Shopman> getAllShopman() {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Shopman> shopmans = new ArrayList<Shopman>();
		Query query = session.createQuery("from Shopman");
		for (Object o: query.list()) {
			Shopman shopman = (Shopman)o;
			shopmans.add(shopman);
		}
		session.getTransaction().commit();
		session.close();
		return shopmans;
		
	}
	@Override
	public List<Shopman> findShopman(Shopman shopman) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Shopman> shopmans = new ArrayList<Shopman>();
		Query query = session.createQuery("from Shopman shopman where shopman.shopmanId =" + shopman.getShopmanId());
		for (Object o : query.list()) {
			Shopman s = (Shopman)o;
			shopmans.add(s);
		}
		session.getTransaction().commit();
		session.close();
		return shopmans;
	}
	@Override
	public List<Shopman> findShopmanByName(String shopmanName) {
		// TODO Auto-generated method stub
		List<Shopman> shopmans = new ArrayList<Shopman>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Shopman shopman where shopman.name=?")
					      .setParameter(0, shopmanName);
			for (Object o : query.list()) {
				Shopman p = (Shopman)o;
				shopmans.add(p);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return shopmans;
	}
	@Override
	public void modifyShopman(Shopman shopman) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("update Shopman shopman set shopman.name=?,shopman.shop.shopId=? where shopman.shopmanId=?")
					      .setParameter(0, shopman.getName())
					      .setParameter(1, shopman.getShop().getShopId())
					      .setParameter(2, shopman.getShopmanId());
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
