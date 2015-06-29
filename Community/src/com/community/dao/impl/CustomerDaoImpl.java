package com.community.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.community.dao.CustomerDao;
import com.community.model.Customer;
import com.community.util.HibernateSessionFactory;
@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao {

	@Override
	public Customer getOneCustomer(Customer c) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Customer c where c.userId =?")
				.setParameter(0, c.getUserId());
		 Customer customer= (Customer)query.uniqueResult();
		session.getTransaction().commit();
		session.close();		
		return customer;
		
		
	}
	
	@Override
	public void addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(customer);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Customer getOneCustomer(String id) {
		// TODO Auto-generated method stub
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("from Customer customer where customer.userId =?")
				.setParameter(0, id);
		Customer cus = (Customer)query.uniqueResult();
		session.getTransaction().commit();
		session.close();
		
		return cus;
	}

}
