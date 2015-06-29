<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="../../../CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../../CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="../../../CSS/css/css_l.css"/>
    <script type="text/javascript" src="../../../JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="../../../JS/js/libs/js_l.js"></script>
  <script type="text/javascript">
    function validate() {
             
        var warehouseId = document.getElementById("id").value;        
        var usernameValue = document.getElementById("name").value;
        var passwd = document.getElementById("passwd").value;
        var address = document.getElementById("address").value;
        var tel = document.getElementById("tel").value;
        var managerName = document.getElementById("managerName").value;
        
       
       if(warehouseId.length == 0) {
            alert("warehouseId should not be blank!");
            return false;
        }
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
        
            
        if(managerName.length == 0) {
            alert("managerName should not be blank!");
            return false;
        }
        return true;
    }
    </script>
  
    
    
  </head>
  
  <body>
  <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>         
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>
        <div style="width:1100px;maegin-left:auto;margin-right:auto;">   
        <div class="result-wrap">
            <div class="result-content">
             

      
 
                <form action="warehouseAction_Register"  id="myform"  method="post" theme="simple" onsubmit="return validate();">
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>编号：</th>
                                <td>
                                    <input class="common-text " id="id" name="warehouse.warehouseId" size="50"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>名称：</th>
                                <td><input class="common-text " id="name" name="warehouse.name" size="50"   type="text"></td>
                            </tr>
							<tr>
                                <th><i class="require-red">*</i>密码：</th>
                                <td><input class="common-text" id="passwd" name="warehouse.passwd" size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>联系方式：</th>
                                <td><input class="common-text" id="tel" name="warehouse.tel" size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>地址：</th>
                                <td><input class="common-text" id="address" name="warehouse.address" size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>负责人：</th>
                                <td><input class="common-text" id="managerName" name="warehouse.managerName" size="50"  type="text"></td>
                            </tr>
                            
                            <tr>
                                <th></th>
                                <td>
                                    <input class="my_button" value="添加" type="submit">
                                    <input class="my_button" onClick="history.go(-1)" value="取消" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
      </div>
   </div>
 </div>
  
  
  

 
 
  </body>
</html>
