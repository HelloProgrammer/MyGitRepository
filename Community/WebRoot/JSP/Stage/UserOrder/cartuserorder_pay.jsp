<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Stage/refrence.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付</title>

  </head>
  
  <body>
  <jsp:include page="../Part/header.jsp"></jsp:include>
  <div align="center">
    <form action="addCartOrderAction" method="post">
      <table>
        <tr style="display:none">
          <td><input type="text" name="order.receiveName" value=<s:property value="order.receiveName"/>></td>
          <td><input type="text" name="order.receiveAddress" value=<s:property value="order.receiveAddress"/>></td>
          <td><input type="text" name="order.receiveTel" value=<s:property value="order.receiveTel"/>></td>
          <td><input type="text" name="order.receiveZipcode" value=<s:property value="order.receiveZipcode"/>></td>
          <td><input type="text" name="order.totalPrice" value=<s:property value="order.totalPrice"/>></td>
          <s:iterator value="orderGoods" status="stu">
            <td><input type="text" name="orderGoods[${stu.index}].good.goodId" value=<s:property value="good.goodId"/>></td>
            <td><input type="text" name="orderGoods[${stu.index}].num" value=<s:property value="num"/>></td>
            <td><input type="text" name="orderGoods[${stu.index}].salePrice" value=<s:property value="salePrice"/>></td>
            <td><input type="text" name="orderGoods[${stu.index}].totalPrice" value=<s:property value="totalPrice"/>></td>
            <td><input type="text" name="orderGoods[${stu.index}].des" value=<s:property value="des"/>></td>
          </s:iterator>
        </tr>
        <tr>
          <td>选择支付方式：</td>
          <td><input type="radio" name="order.payMethod" value="支付宝">支付宝</td>
          <td><input type="radio" name="order.payMethod" value="网银">网银</td>
       	  <td><input type="radio" name="order.payMethod" value="快捷支付">快捷支付</td>
      	</tr>
        <tr>
          <td>支付密码：</td>
          <td><input name="paypwd" type="password" id="paypwd"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" class="my_button" value="支付">
          <input type="button" class="my_button" onclick="history.go(-1)" value="取消"></td>
        </tr>
      </table>
    </form>
   </div>
  </body>
</html>
