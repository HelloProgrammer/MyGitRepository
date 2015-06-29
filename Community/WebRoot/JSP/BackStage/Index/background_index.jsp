<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/css_l.css"/>
    <script type="text/javascript" src="<%=path%>/JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>

  </head>
  
  <body>
  <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>  
                 
          <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>现在注册送女朋友！请广而告之！</span></div>
        </div>
        <div style="width:1100px;maegin-left:auto;margin-right:auto;"> 
        <div class="result-wrap">
            <div class="result-title">
                <h1>快捷操作</h1>
            </div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="<%=basePath%>orderAction_getAllOrder""><i class="icon-font">&#xe001;</i>查看订单</a>
                    
                    <a href="<%=basePath%>JSP/BackStage/GoodManage/goods_add.jsp"><i class="icon-font">&#xe048;</i>添加商品</a>
                    <a href="<%=basePath_menu%>goodAction_getAllGood"><i class="icon-font">&#xe041;</i>查看商品</a>
                </div>
            </div>
        </div>
        
       </div>
    </div>
  
 </div>
    
  </body>
</html>
