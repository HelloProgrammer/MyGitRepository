package com.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.ShopDao;
import com.community.model.Shop;
import com.community.model.Shopman;
import com.community.model.Warehouse;
import com.community.util.GetNewId;
import com.community.util.HibernateSessionFactory;

@Repository("shopDao")
public class ShopDaoImpl implements ShopDao {

	@Override
	public void deleteShops(Warehouse warehouse) {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
		session.beginTransaction();
		Query query = session.createQuery("delete from Shop u where u.warehouse.warehouseId=" + warehouse.getWarehouseId());
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
	public List<Shop> findShops(Warehouse warehouse) {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Shop> shops = new ArrayList<Shop>();
		Query query = session.createQuery("from Shop shop where shop.warehouse.warehouseId =" + warehouse.getWarehouseId());
		for (Object o : query.list()) {
			Shop u = (Shop)o;
			shops.add(u);
		}
		session.getTransaction().commit();
		session.close();
		return shops;
	}

	
	//亮神
	@Override
	public void addShop(Shop shop){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		//shop.setWarehouse(new Warehouse("4"));
		shop.setShopId(GetNewId.getNewShopId()+"");
		session.save(shop);
		session.getTransaction().commit();
		session.close();		
	}

	@Override
	public List<Shop> getAllShop() {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Shop> shops = new ArrayList<Shop>();
		Query query = session.createQuery("from Shop");
		for (Object o: query.list()) {
			Shop shop = (Shop)o;
			shops.add(shop);
		}
		session.getTransaction().commit();
		session.close();
		return shops;
	}

	@Override
	public void deleteShopman(Shop shop) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("delete from Shopman shopman where shopman.shop.shopId=" + shop.getShopId());
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
	}
	@Override
	public void deleteShop(Shop shop) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("delete from Shop shop where shop.shopId=" + shop.getShopId());
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
	}
	
	@Override
	public List<Shop> findShop(Shop shop) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Shop> shops = new ArrayList<Shop>();
		Query query = session.createQuery("from Shop shop where shop.shopId =" + 
											shop.getShopId());
		for (Object o : query.list()) {
			Shop s = (Shop)o;
			shops.add(s);
		}
		session.getTransaction().commit();
		session.close();
		return shops;
	}
	
	@Override
	public List<Shop> findShopById(String shopId) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Shop> shops = new ArrayList<Shop>();
		Query query = session.createQuery("from Shop shop where shop.shopId =" + 
											shopId);
		for (Object o : query.list()) {
			Shop s = (Shop)o;
			shops.add(s);
		}
		session.getTransaction().commit();
		session.close();
		return shops;
	}

	@Override
	public void modifyShop(Shop shop) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		//Warehouse warehouse = shop.getWarehouse();
		Query query = session.createQuery
				      ("update Shop shop set shop.name=?,shop.passwd=?,shop.address=?,shop.tel=?,shop.warehouse.warehouseId=? where shop.shopId=?")
				      .setParameter(0, shop.getName()).setParameter(1, shop.getPasswd())
				      .setParameter(2, shop.getAddress()).setParameter(3, shop.getTel())
				      .setParameter(4, shop.getWarehouse().getWarehouseId()).setParameter(5, shop.getShopId());				      
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
	}

	@Override
	public List<Shop> findShopsBywarehouseId(String warehouseId) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Shop> shops = new ArrayList<Shop>();
		Query query = session.createQuery("from Shop shop where shop.warehouse.warehouseId =" + warehouseId);
		for (Object o : query.list()) {
			Shop s = (Shop)o;
			shops.add(s);
		}
		session.getTransaction().commit();
		session.close();
		return shops;
	}

	@Override
	public List<Shop> findShopByName(Shop shop) {
		// TODO Auto-generated method stub
		List<Shop> shops = new ArrayList<Shop>();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from Shop shop where shop.name=?")
					      .setParameter(0, shop.getName());
			for (Object o : query.list()) {
				Shop p = (Shop)o;
				shops.add(p);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return shops;
	}
}
