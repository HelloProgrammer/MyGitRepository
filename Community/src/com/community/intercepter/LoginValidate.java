package com.community.intercepter;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginValidate extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
        ActionContext ctx = invocation.getInvocationContext();  
        Map session = ctx.getSession();  
        String user = (String)session.get("USER_ID");
  
        // 如果没有登陆，即用户名不存在，都返回重新登陆 
        if(user == null){
        	return "login intercepter";    //返回一个全局的result结果
        }
        else {
        	return invocation.invoke();
		}
	}

}
