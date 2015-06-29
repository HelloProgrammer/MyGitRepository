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
    
    <title>支付</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/css_l.css"/>
    <link href="CSS/css_front/search.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="CSS/css_front/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="CSS/css_front/form.css" rel="stylesheet" type="text/css" media="all" />
	<link href="CSS/css_front/megamenu.css" rel="stylesheet" type="text/css" media="all" />

	
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/main.css"/>
	
	<script type="text/javascript" src="<%=path%>/JS/js/libs/Calendar4.js" ></script>
    <script type="text/javascript" src="<%=path%>/JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
    <link rel="stylesheet" href="<%=basePath%>CSS/css/tasp.css" />
    <link rel="stylesheet"  href="<%=basePath%>CSS/css/orderconfirm.css" />
  </head>
  
  <body>
  <jsp:include page="../Part/header.jsp"></jsp:include>
  <div align="center" style="margin-top:100px">

    <form action="addOrderAction" method="post">
      <table>
        <tr style="display: none">
          <td><input type="text" name="order.receiveName" value=<s:property value="order.receiveName"/>></td>
          <td><input type="text" name="order.receiveAddress" value=<s:property value="order.receiveAddress"/>></td>
          <td><input type="text" name="order.receiveTel" value=<s:property value="order.receiveTel"/>></td>
          <td><input type="text" name="order.receiveZipcode" value=<s:property value="order.receiveZipcode"/>></td>
          <td><input type="text" name="orderGood.good.goodId" value=<s:property value="orderGood.good.goodId"/>></td>
          <td><input type="text" name="orderGood.num" value=<s:property value="orderGood.num"/>></td>
          <td><input type="text" name="orderGood.salePrice" value=<s:property value="orderGood.salePrice"/>></td>
          <td><input type="text" name="orderGood.totalPrice" value=<s:property value="orderGood.totalPrice"/>></td>
          <td><input type="text" name="order.totalPrice" value=<s:property value="order.totalPrice"/>></td>
          <td><input type="text" name="orderGood.des" value=<s:property value="orderGood.des"/>></td>
        </tr>
      </table>
      <table>
        <tr style="line-height:50px">
          <td width="100px">选择支付方式：</td>
          <td width="150px"><input type="radio" name="order.payMethod" value="支付宝">支付宝</td>
          <td width="150px"><input type="radio" name="order.payMethod" value="网银">网银</td>
       	  <td width="150px"><input type="radio" name="order.payMethod" value="快捷支付">快捷支付</td>
      	</tr>
        <tr style="line-height:50px">
          <td>支付密码：</td>
          <td><input name="paypwd" type="password" id="paypwd"></td>
        </tr>
        <tr style="line-height:50px">
          <td></td>
          <td><input type="submit" class="my_button" value="支付">
          <input type="button" class="my_button" onclick="history.go(-1)" value="取消"></td>
        </tr>
      </table>
    </form>
</div>
  </body>
</html>
