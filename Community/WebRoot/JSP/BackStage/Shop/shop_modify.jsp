<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  <script type="text/javascript">
    function validate() {
             
           
        var usernameValue = document.getElementById("name").value;
        var passwd = document.getElementById("passwd").value;
        var address = document.getElementById("address").value;
        var tel = document.getElementById("tel").value;
        var warehouseId = document.getElementById("warehouseId").value;
        
       
        if(usernameValue.length == 0) {
            alert("name should not be blank!");
            return false;
        }
        if(passwd.length == 0) {
            alert("passwd should not be blank!");
            return false;
        }
        if(address.length == 0) {
            alert("address should not be blank!");
            return false;
        }
        if(tel.length == 0) {
            alert("tel should not be blank!");
            return false;
        }
        else if(tel.length != 11){
        	alert("please add correct tel");
        	return false;
        }
        
            
        if(warehouseId.length == 0) {
            alert("warehouseId should not be blank!");
            return false;
        }
        return true;
    }
    </script>
  
    <base href="<%=basePath%>">
    
    <title>My JSP 'shop_modify.jsp' starting page</title>

  </head>
  
  <body>
    <form action="shopAction_updateShop" method="post" theme="simple" onsubmit="return validate();">
      <table>
        <s:iterator value="shops">
          <tr>
            <td>ID:</td>
            <td><s:property value="shopId"/></td>
          </tr>
          <tr>
            <td>name:</td>
            <td><input name="shop.name" id="name" type="text" value=<s:property value="name"/> ></td>
          </tr>
          <tr>
            <td>password:</td>
            <td><input name="shop.passwd"id="passwd"type="text" value=<s:property value="passwd"/> ></td>
          </tr>
           <tr>
            <td>address:</td>
            <td><input name="shop.address" id="address" type="text" value=<s:property value="address"/> ></td>
          </tr>
           <tr>
            <td>tel:</td>
            <td><input name="shop.tel" id="tel" type="text" value=<s:property value="tel"/> ></td>
          </tr>
           <tr>
            <td>warehouse:</td>
            <td><input name="shop.warehouse.warehouseId" id="warehouseId" type="text" value=<s:property value="warehouse.warehouseId"/> ></td>
          </tr>
          <tr>
            <td><input type="submit"></td>
          </tr>
        </s:iterator>
      </table>
    </form>
  </body>
</html>
