package com.community.dao;

import com.community.model.Manager;


public interface ManagerDao {

	public void addManager(Manager manager);
	public Manager getOneManager(String id);
}
