<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link href="<%=basePath%>CSS/css/css_l.css" rel="stylesheet" type="text/css"  />
    
</head>
<body>
<div class="header-top">
	 <div class="wrap"> 
		<div class="logo">
			<a href="index.html"><img src="images/logo.png" alt=""/></a>
	    </div>
		<ul class="icon2 sub-icon2 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon2 list">
					<li><h3>许可证</h3><a href=""></a></li>
					<li><p>营销许可证 三级食品安全证  <a href="">优秀网店证书</a></p></li>
				</ul>
			</li>
		</ul>
		<div class="clear"></div>
 	</div>
   </div>
<div >
          	<div >
    	      <h4 align="center"  class="my_title">注册新用户</h4>
    		   <form>
    			 
		   			 
		   			   <div align="center" >
		   			     <input type="text"  class="my_password" placeholder="姓名">
	   			       </div>
		   			 
		    			<div>
		    			  <div align="center">
		    			    <input type="text"  class="my_password" placeholder="电话">
	    			      </div>
		    			</div>
		    			<div>
		    			  <div align="center">
		    			    <input type="password"  class="my_password" placeholder="密码" > 
	    			      </div>
		    			</div>
						<div>
						  <div align="center">
						    <input TYPE="password" class="my_password" placeholder="重新输入密码" >
					      </div>
						</div>
		    	
				 <div align="center">
		         <button  class="grey">保存</button>   
		         <button  class="grey" onClick="history.go(-1)">返回</button>
		         <p class="terms">一旦注册，表明您已经阅读并同意 <a href="#">用户协议</a>.</p>
				 </div>
		         <div class="clear"></div>
		    </form>
    	  </div> 
        </div>
		<div style="position:fixed;left:0px;bottom:0px;width:100%;">
        <div class="footer">
       	  
       	 
       	 <div class="copy">
       	   <div class="wrap">
       	   	  <p>Copyright &copy; 2014.Company name All rights reserved.</p>
       	   </div>
       	 </div>
       </div>
	   </div>
      

</body>
</html>