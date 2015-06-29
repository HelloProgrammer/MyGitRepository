package com.community.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.ManagerDao;
import com.community.model.Customer;
import com.community.model.Manager;
import com.community.util.HibernateSessionFactory;

@Repository("managerDao")
public class ManagerDaoImpl implements ManagerDao {

	@Override
	public void addManager(Manager manager) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(manager);
		session.getTransaction().commit();
		session.close();
	}
	
	@Override
	public Manager getOneManager(String id) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Manager manager where manager.managerId =?")
				.setParameter(0, id);
		Manager m = (Manager)query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		
		return m;
	}

}
