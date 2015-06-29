<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userorder_success.jsp' starting page</title>
    <script type="text/javascript">
    var t = 5;
    function countDown(){
    var time = document.getElementById("time");
    t--;
    time.value=t;
    if (t<=0) {
    location.href="<%=basePath%>JSP/Stage/cat.jsp";
    clearInterval(inter);
    };
    }
    var inter = setInterval("countDown()",1000);
//window.onload=countDown;
</script> 
  </head>
  
  <body>
  <div align="center">
         <h1>付款成功！</h1>
    
    剩余
    <input type="text" readonly="true" style="border:none;width:10px;" value="5" id="time"/> 
    秒自动跳转。。
    <p>如果没跳转请手动点击<a href="<%=basePath%>JSP/Stage/cat.jsp">跳转。。。</a></p>
  </div>
  </body>
</html>
