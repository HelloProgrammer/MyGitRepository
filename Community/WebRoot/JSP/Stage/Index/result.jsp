<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginResult.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
    var t = 5;
    function countDown(){
    var time = document.getElementById("time");
    t--;
    time.value=t;
    if (t<=0) {
    location.href="<%=basePath%>/JSP/Stage/Index/login.jsp";
    clearInterval(inter);
    };
    }
    var inter = setInterval("countDown()",1000);
//window.onload=countDown;
</script> 
  </head>
  
  <body>
    <h1>login session:<s:property value="#session.USER_NAME"/></h1>
    <h1>regist:<s:property value="customer.name"/></h1>
    剩余
    <input type="text" readonly="true" style="border:none;width:10px;" value="5" id="time"/> 
    秒自动跳转。。
    <p>如果没跳转请手动点击<a href="<%=basePath%>JSP/Stage/Index/login.jsp">跳转。。。</a></p>
  </body>
</html>
