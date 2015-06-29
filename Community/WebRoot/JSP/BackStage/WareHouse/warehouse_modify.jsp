<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/css_l.css"/>
    <script type="text/javascript" src="<%=basePath%>JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>JS/js/libs/js_l.js"></script>
  	<script type="text/javascript">
    function validate() {
                   
        var usernameValue = document.getElementById("name").value;
        var passwd = document.getElementById("passwd").value;
        var address = document.getElementById("address").value;
        var tel = document.getElementById("tel").value;
        var managerName = document.getElementById("managerName").value;
        
       
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

            <div class="result-content">
                <form action="warehouseAction_updateWarehouse"  theme="simple" onsubmit="return validate();" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <s:iterator value="warehouses">
                            <tr>
                                <th> 编号：</th>
                                <td>
                                    <s:property value="warehouseId"/>
                                </td>
                            </tr>
                            <tr>
                                <th>名称：</th>
                                
                                <td><input class="common-text" name="warehouse.name" id="name" size="50" value=<s:property value="name"/> type="text"></td>
                            </tr>
                            <tr>
                                <th>密码：</th>
                                <td><input class="common-text" name="warehouse.passwd" id="passwd" value=<s:property value="passwd"/> size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th>联系方式：</th>
                                <td><input class="common-text" name="warehouse.tel" id="tel" value=<s:property value="tel"/> size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th>地址：</th>
                                <td><input class="common-text" name="warehouse.address"  id="address"  value=<s:property value="address"/> size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th>负责人：</th>
                                <td><input class="common-text" name="warehouse.managerName" id="managerName" value=<s:property value="managerName"/> size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="my_button" value="保存" type="submit">
                                    <input class="my_button" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                            </s:iterator>
                        </tbody></table>
                </form>
            </div>
       </div>
        </div>
</div>
  </body>
</html>
