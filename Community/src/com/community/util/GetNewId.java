package com.community.util;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;

public class GetNewId {

	public static int getNewPkindId() {
		int pkindId = 0;
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("select max(cast(pkind.pkindId as int)) from Pkind pkind");
			pkindId = Integer.parseInt(query.uniqueResult().toString()) + 1;
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return pkindId;
	}
	
	public static int getNewKindId() {
		int kindId = 0;
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("select max(cast(kind.kindId as int)) from Kind kind");
			kindId = Integer.parseInt(query.uniqueResult().toString()) + 1;
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return kindId;
	}
	public static int getNewWarehouseId() {
		int warehousId = 0;
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("select max(cast(warehouse.warehouseId as int)) from Warehouse warehouse");
			warehousId = Integer.parseInt(query.uniqueResult().toString()) + 1;
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return warehousId;
	}
	public static int getNewShopId() {
		int shopId = 0;
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("select max(cast(shop.shopId as int)) from Shop shop");
			shopId = Integer.parseInt(query.uniqueResult().toString()) + 1;
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return shopId;
	}
	public static int getNewShopmanId() {
		int shopId = 0;
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("select max(cast(shopman.shopmanId as int)) from Shopman shopman");
			shopId = Integer.parseInt(query.uniqueResult().toString()) + 1;
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return shopId;
	}
	public static Long getNewOrderId() {
		return new Date().getTime();
	}
	
}
