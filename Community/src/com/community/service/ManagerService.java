package com.community.service;

import com.community.model.Manager;

public interface ManagerService {
	
	public void addManager(Manager manager);
	public boolean checkManager(String id,String pwd);
}
