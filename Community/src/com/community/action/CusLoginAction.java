package com.community.action;
/**
 * 用户
 */

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import com.community.model.Customer;
import com.community.service.CustomerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Controller("cusLoginAction")
public class CusLoginAction extends ActionSupport {
	private Customer customer;
	private String cname;
	private String cpasswd;
	private String errorMessage;
	
	private String checkName;
	private String result;
	
	private CustomerService customerService;
	
	public String Login(){
		if(customerService.checkCustomer(cname, cpasswd)){
			errorMessage=null;
			ActionContext actionContext = ActionContext.getContext();
	        Map session = actionContext.getSession();
	        session.put("USER_ID", cname);
	        
			return "login success";
		}
		else {
			errorMessage = "用户名或密码错误";
			return "login false";
		}
	}
	
	public String Regist(){
		if(customerService.addCustomer(customer))
			return "regist success";
		return "regist false";
	}
	
	public String Validate()throws IOException {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("------------------------"+checkName);
		if (customerService.checkCustomer(checkName)) {
			map.put("name", "DONE");
		}else {
			map.put("name", "NONE");
		}
		// 将要返回的map对象进行json处理
        JSONObject jo = JSONObject.fromObject(map);
        // 调用json对象的toString方法转换为字符串然后赋值给result
        result = jo.toString();
		return "JSON";
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCpasswd() {
		return cpasswd;
	}

	public void setCpasswd(String cpasswd) {
		this.cpasswd = cpasswd;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getCheckName() {
		return checkName;
	}

	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public CustomerService getCustomerService() {
		return customerService;
	}
	@Resource(name="customerService")
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
}
