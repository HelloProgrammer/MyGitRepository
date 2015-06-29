package com.community.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.CustomerDao;
import com.community.model.Customer;
import com.community.service.CustomerService;
@Service("customerService")
public class CustomerServiceImpl implements CustomerService{
	private CustomerDao customerDao;
	
	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	@Resource(name="customerDao")
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	@Override
	public Customer getOneCustomer(Customer c) {
		// TODO Auto-generated method stub
		//System.out.println("杩涘叆service"+c.getUserId());
		Customer customer = customerDao.getOneCustomer(c);
		//System.out.println("閫�嚭service");
		return customer;
	}
	
	@Override
	public boolean addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Customer cus = customerDao.getOneCustomer(customer.getName());
		if(cus==null){
			customerDao.addCustomer(customer);
			return true;
		}
		return false;
	}

	@Override
	public boolean checkCustomer(String id,String pwd) {
		// TODO Auto-generated method stub
		Customer cus = customerDao.getOneCustomer(id);
		if(cus!=null){
			if(cus.getPasswd().equals(pwd))
				return true;
			return false;
		}
		return false;
	}

	public boolean checkCustomer(String id){
		Customer cus = customerDao.getOneCustomer(id);
		if(cus!=null){
			return true;
		}
		return false;
	}
	

}
