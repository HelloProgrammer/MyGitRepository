package com.community.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.WarehouseDao;
import com.community.model.Warehouse;
import com.community.util.HibernateSessionFactory;

@Repository("warehouseDao")
public class WarehouseDaoImpl implements WarehouseDao {

	@Override
	public void addWarehouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(warehouse);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Warehouse> getAllWarehouse() {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Warehouse> warehouses = new ArrayList<Warehouse>();
		Query query = session.createQuery("from Warehouse");
		for (Object o: query.list()) {
			Warehouse warehouse = (Warehouse)o;
			warehouses.add(warehouse);
		}
		session.getTransaction().commit();
		session.close();
		return warehouses;
		
	}

	@Override
	public void deleteWarehouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("delete from Warehouse u where u.warehouseId=" + warehouse.getWarehouseId());
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
	}
	

	@Override
	public void deleteWarehouse(String id) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			
			session.beginTransaction();
			Query query = session.createQuery("delete from Warehouse u where u.warehouseId=?")
				.setParameter(0, id);
		query.executeUpdate();
		session.getTransaction().commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		
	
		
		
	}

	@Override
	public List<Warehouse> findWarehouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		List<Warehouse> warehouses = new ArrayList<Warehouse>();
		Query query = session.createQuery("from Warehouse warehouse where warehouse.warehouseId =" + warehouse.getWarehouseId());
		for (Object o : query.list()) {
			Warehouse u = (Warehouse)o;
			warehouses.add(u);
		}
		session.getTransaction().commit();
		session.close();
		return warehouses;
	}

	@Override
	public void modifyWarehouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery
				 ("update Warehouse u set u.name=?,u.address=?,u.tel=?,u.managerName=?,u.passwd=? where u.warehouseId=?")
			      .setParameter(0, warehouse.getName()).setParameter(1, warehouse.getAddress())
			      .setParameter(2, warehouse.getTel()).setParameter(3, warehouse.getManagerName()).setParameter(4, warehouse.getPasswd()).setParameter(5, warehouse.getWarehouseId());
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
	}

}
