<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <title>后台管理_登录</title>
	<link href="<%=basePath%>CSS/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<s:if test="ErrorMessage!=null"><script>alert('<s:property value="ErrorMessage" escape="false"/>');</script></s:if>
</head>
<body>
<div class="header-top">
	 <div class="wrap"> 
		<div class="logo">
			<a href=""><img src="<%=basePath%>images/logo.png" alt=""/></a>
	    </div>
		<ul class="icon2 sub-icon2 profile_img">
			<li><a class="active-icon c2" > </a>
				<ul class="sub-icon2 list">
					<li><h3>许可证</h3></li>
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
					<h4 class="title">后台管理</h4>
					<h5 class="sub_title">管理公告</h5>
					<p>O2O的本地化电子商务理念是将本地线下商务的机会与互联网的技术结合在一起，
					让互联网成为线下交易的前台，同时起到推广和成交的作用，这种线上引导，
					线下消费的模式是电子商务领域里程碑式的革命。</p>
					
					<h5 class="sub_title">管理员须知</h5>					
					<p>请大家自觉遵守相关规范和本分类的规章制度。找好自己的定位，配合分类高管完成官方的任务是我们的日常中必不可少的项目。有问题及时和高管沟通解决，不要在不明情况下制造矛盾。</p>
					<div class="button1" >					   
					<p>1、管理员权限一旦配置完成，管理员帐号不得以任何形式转让或者租借他人，发现此类情况会直接取消管理员权限；</p>					   
					<p>2、管理员不得利用管理员身份对用户实施威胁或者利用管理员身份出现在公司以外的平台为自己炒作等。</p>				   
					<p>3、违规出现加密，恶意诋毁他人或者是企业，利用管理员身份打击竞争对手，恶意转移问题并加密，将会被直接取消权限，严重的将会直接追究其相关责任。</p>
				    </div>
					 <div class="clear"></div>
				</div>
				
				<div class="col_1_of_login span_1_of_login">
				  <div class="login-title">
	           		<h4 class="title">已注册用户</h4>
	           		
					 <div class="comments-area">
						<form action="backLoginAction_Login" method="post">
							<p>
								<label>账号</label>
								<span>*</span>
								<input type="text" id="manager_id" value="" name="backId" />
							</p>
							<p>
								<label>密码</label>
								<span>*</span>
								<input type="password" id="manager_password" value="" name="backPwd" />
							</p>
							 <p id="login-form-remember">
								<label></label>
							 </p>
							 <p>
								<input type="submit"  value="登录">
							</p>
						</form>
					</div>
			      </div>
				</div>
		</div>
</div>

 <%@ include file="../Parts/footer.jsp" %>  
       
</body>
</html>