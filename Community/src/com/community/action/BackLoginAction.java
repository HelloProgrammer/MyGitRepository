package com.community.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.community.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Controller("backLoginAction")
public class BackLoginAction extends ActionSupport {
	private String backId;
	private String backPwd;
	private String ErrorMessage;
	private ManagerService managerService;
	
	public String Login(){
		if (managerService.checkManager(backId, backPwd)) {
			ErrorMessage=null;
			ActionContext actionContext = ActionContext.getContext();
	        Map session = actionContext.getSession();
	        session.put("M_ID", backId);
			return "success";
		} else {
			ErrorMessage = "用户名或密码错误";
			return "false";
		}
	}
	
	public String getBackId() {
		return backId;
	}
	public void setBackId(String backId) {
		this.backId = backId;
	}
	public String getBackPwd() {
		return backPwd;
	}
	public void setBackPwd(String backPwd) {
		this.backPwd = backPwd;
	}
	public String getErrorMessage() {
		return ErrorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		ErrorMessage = errorMessage;
	}
	public ManagerService getManagerService() {
		return managerService;
	}
	@Resource(name="managerService")
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	
}
