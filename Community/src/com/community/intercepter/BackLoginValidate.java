package com.community.intercepter;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class BackLoginValidate extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		ActionContext ctx = invocation.getInvocationContext();  
        Map session = ctx.getSession();  
        String manager = (String)session.get("M_ID");
       
		if (manager != null) {   
           return invocation.invoke();  
       }
       else{
        	return "backlogin intercepter";
		}
}

}
