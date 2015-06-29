package com.community.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.ManagerDao;
import com.community.model.Manager;
import com.community.service.ManagerService;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	private ManagerDao managerDao;
	
	@Resource(name="managerDao")
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	@Override
	public void addManager(Manager manager) {
		managerDao.addManager(manager);
	}
	
	@Override
	public boolean checkManager(String id, String pwd) {
		// TODO Auto-generated method stub
		Manager manager = managerDao.getOneManager(id);
		if(manager!=null){
			if (manager.getPasswd().equals(pwd)) {
				return true;
			}
			return false;
		}
		return false;
	}
}
