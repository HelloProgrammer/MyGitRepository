package com.community.dao;

import com.community.model.Customer;

public interface CustomerDao {
	public Customer getOneCustomer(Customer c);
	public void addCustomer(Customer customer);
	public Customer getOneCustomer(String id);
}
