<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'good_select.jsp' starting page</title>

  </head>
  
  <body>
  <jsp:include page="../Part/header.jsp"></jsp:include>
    <form action="findGoodByIdAction" method="post">
      <table>
        <tr>
          <td>商品ID：</td>
          <td><input name="good.goodId" type="text"></td>
        </tr>
        <tr>
          <td>商品数量：</td>
          <td><input name="goodNum" type="text"></td>
        </tr>
        <tr>
          <td><input value="购买" type="submit"></td>
        </tr>
      </table>
    </form>
  </body>
</html>
