package com.community.service;

import com.community.model.Customer;

public interface CustomerService {
		public Customer getOneCustomer(Customer c);
		public boolean addCustomer(Customer customer);
		public boolean checkCustomer(String id,String pwd);
		public boolean checkCustomer(String id);

}
