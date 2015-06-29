<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Stage/refrence.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
    <s:if test="errorMessage!=null"><script>alert('<s:property value="errorMessage" escape="false"/>');</script></s:if>
 	
  
  </head>
  
  <body>
  
    <div class="header-top">
	 <div class="wrap"> 
		<div class="logo">
			<a href="index.html"><img src="<%=basePath %>images/logo.png" alt=""/></a>
	    </div>
		<ul class="icon2 sub-icon2 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon2 list">
					<li><h3>许可证</h3><a href=""></a></li>
					<li><p>营销许可证 三级食品安全证  优秀网店证书</p></li>
				</ul>
			</li>
		</ul>
		
		<div class="clear"></div>
 	</div>
   </div>
<div class="header-bottom" >
   	  <div class="wrap">
   		 <div class="clear"></div>
     </div>
</div>
<div class="login">
          <div class="wrap">
				<div class="col_1_of_login span_1_of_login">
					<h4 class="title">新用户</h4>
					<h5 class="sub_title">注册公告</h5>
					<p>现在注册！送女朋友！现在注册！送女朋友！现在注册！送女朋友！现在注册！送女朋友！现在注册！送女朋友！现在注册！送女朋友！
					现在注册！送女朋友！现在注册！送女朋友！现在注册！送女朋友！</p>
					<div class="button1" >
					   <a href="<%=basePath %>JSP/Stage/Index/regist.jsp"><input type="submit" name="Submit" value="立即注册"></a>
				  </div>
					 <div class="clear"></div>
				</div>
				<div class="col_1_of_login span_1_of_login">
				  <div class="login-title">
	           		<h4 class="title">已注册用户</h4>
					 <div class="comments-area">
						<form action="cusLoginAction_Login" method="post">
							<p>
								<label>账号</label>
								<span>*</span>
								<input type="text" name="cname"/>
							</p>
							<p>
								<label>密码</label>
								<span>*</span>
								<input type="password" name="cpasswd"/>
							</p>
							 <p id="login-form-remember">
								<label><a href="<%=path%>/JSP/BackStage/Index/background_login.jsp">后 台 登 录</a></label>
							 </p>
							 <div style="clear:both"></div>
							 <div>
								<input type="submit" value="登录">
							</div>
						</form>
					</div>
			      </div>
				</div>
		</div>
</div>

<div class="clear"></div>
<div style="position:fixed;left:0px;bottom:0px;width:100%;">
<div class="copy">
       	   <div class="wrap">
       	   	  <p>Copyright &copy; 2014.Company name All rights reserved.</p>
       	   	  
       	   </div>
</div>
</div>
  </body>
</html>
