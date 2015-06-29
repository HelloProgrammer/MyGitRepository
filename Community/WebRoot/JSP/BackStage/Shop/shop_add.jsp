<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/css_l.css" />
    <script type="text/javascript" src="<%=basePath%>JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>JS/js/libs/js_l.js"></script>

  </head>
  
  <body>
    <div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="<%=basePath%>shopAction_getAllShop">首页</a></li>
                <li><a href="" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="javascript:;">重新登录</a></li>
                <li><a href="javascript:;">修改密码</a></li>
                <li><a href="javascript:;">退出</a></li>
            </ul>
        </div>
    </div>
</div>
 <div class="container clearfix">
           <form name="indexForm" method="post" enctype="multipart/form-data">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul id="faq" class="sidebar-list">
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe003;</i>商家管理</a></dt>
                       <dd>
                          <div align="center" class="my_right_bar_div"><a href="<%=basePath%>shopAction_getAllShop"><i class="icon-font">&#xe008;</i>查看商家</a></div>
                       </dd>
                       <dd>
					      <div align="center" class="my_right_bar_div"><a href="<%=basePath%>JSP/BackStage/Shop/shop_add.jsp"><i class="icon-font">&#xe005;</i>增加商家</a></div>
					   </dd>
				   
				</dl>
                </li>
				
            </ul>
        </div>
    </div>
</form>
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>
        <div style="width:1100px;maegin-left:auto;margin-right:auto;">   
        <div class="result-wrap">
            <div class="result-content">
             

      
                <form action="shopAction_Register" method="post" theme="simple" onsubmit="return validate();">
                    <table class="insert-tab" width="100%">
                        <tbody>
                      
                            <tr>
                                <th><i class="require-red">*</i>名称：</th>
                                <td><input class="common-text " id="name" name="shop.name" size="50"   type="text"></td>
                            </tr>
							<tr>
                                <th><i class="require-red">*</i>密码：</th>
                                <td><input class="common-text" id="passwd" name="shop.passwd" size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>联系方式：</th>
                                <td><input class="common-text" id="tel" name="shop.tel" size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>地址：</th>
                                <td><input class="common-text" id="address" name="shop.address" size="50"  type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>负责人：</th>
                                <td><input class="common-text" id="warehouseId" name="shop.warehouse.warehouseId" size="50"  type="text"></td>
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
  
  
  
  
  
  <form action="shopAction_Register" method="post" theme="simple" onsubmit="return validate();">
  <table>
        <tr>
          <td>name:</td>
          <td><input name="shop.name" type="text" id="name"/></td>
        </tr>
        <tr>
          <td>password:</td>
          <td><input name="shop.passwd" type="text" id="passwd"/></td>
        </tr>
        <tr>
          <td>address:</td>
          <td><input name="shop.address" type="text" id="address"/></td>
        </tr>
        <tr>
          <td>tel:</td>
          <td><input name="shop.tel" type="text" id="tel"/></td>
        </tr>
        <tr>
          <td>warehouseId:</td>
          <td><input name="shop.warehouse.warehouseId" type="text" id="warehouseId"/></td>
        </tr>
        <tr>
          <td><input type="submit"/></td>
        </tr>
      </table>
      </form>
  </body>
</html>
