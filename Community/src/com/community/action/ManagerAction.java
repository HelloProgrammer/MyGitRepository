package com.community.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;

import com.community.dao.ManagerDao;
import com.community.model.Manager;
import com.community.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("managerAction")
public class ManagerAction extends ActionSupport {

	ManagerDao managerDao;
	ManagerService managerService;
	Manager manager;
	

	
	
	
	public ManagerDao getManagerDao() {
		return managerDao;
	}
	@Resource(name="managerDao")
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	public ManagerService getManagerService() {
		return managerService;
	}
	@Resource(name="managerService")
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
}
