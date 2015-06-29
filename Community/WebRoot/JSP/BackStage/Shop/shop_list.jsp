<%@page import="com.community.model.Shop"%>
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
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text" ></td>
                            <td><input class="my_button" name="sub" value="查询" type="submit"></td>
                            <td><a href="<%=basePath%>JSP/BackStage/Shop/shop_add.jsp"><input class="my_button" value="添加用户" type="button"></input></a></td>
                        </tr>                
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            
                <div class="result-title">
                    <div class="result-list">
                        <a id="batchDel" href="#"><i class="icon-font"></i>批量删除</a>
                        <a id="updateOrd" href="#"><i class="icon-font"></i>手动更新</a>
                    </div>
                </div>
                <div class="result-content">
    
      
                    <table id="table_page" class="my_result-tab"   >
                        <tr>

						    <th class="tc" width="30px" ><input class="allChoose" name="" type="checkbox"></th>
						    <th width="110px">编号</th>
                            <th width="160px">店名</th>
                            <th width="200px">地址</th>
                            <th width="110px">所属种类</th>
                            <th width="130px">联系方式</th>
                            <th width="210px">操作</th>
                        </tr>
                        <tbody id="group_one">
      <s:iterator value="shops">
        <tr>  
           
          <td class="tc"><input type="checkbox"></td>
          <td><s:property value="shopId" /></td>
          <td><s:property value="name"/></td>
          <td>
          <div class="ttt">
              <a><span>
                  <s:property value="address"  />
                  <ul class="my_icon2">
			          <li><a class="active-icon c2" href="javascript:;"> </a>
				      <ul class="sub-my_icon2 list">
					      <li><h3><s:property value="address"  /></h3><a href="javascript:;"></a></li>
				      </ul>
			          </li>
		          </ul>
              </span></a>
          </div>
          
		</td>
          <td><s:property value="warehouse.warehouseId"/></td>
          <td><s:property value="tel"/></td>
          <td><a href="shopAction_deleteShop?shop.shopId=${shopId}">删除</a>
          <a href="shopAction_getOneShop?shop.shopId=${shopId}">修改</a></td>
        </tr>
      </s:iterator>
      </tbody>
                    </table>
                       
                    <div align="center"> 
                     <table>
<tr>
<td><a href="javascript:;" onclick="page.firstPage()">首页</a>——</td>
<td><a href="javascript:;" onclick="page.prePage();">上一页</a>-</td>
<td><a  id="my_iPageIndex"></a>-</td>
<td><a href="javascript:;" onclick="page.nextPage();">下一页</a>——</td>
<td>共-<a href="javascript:;" id="PageCount"></a>-页——</td>
<td><a  href="javascript:;" onclick="page.aimPage()">转到</a>第<input type="text" id="current_page" style="text-align:center;width:40px;" />页</td>
<td><span id="pageindex"></span></td></tr></table>
                    </div>
                </div>
           
        </div>
         </div>
    </div>
        
  
 </div>
  
  
  
    <a href="<%=basePath%>JSP/BackStage/Shop/shop_add.jsp">添加用户</a>
    <table>
      <tr>
        <td>编号</td>
        <td>店名</td>
        <td>电话</td>
        <td>地址</td>
        <td>密码</td>
        <td>所属种类</td>
      </tr>
      <s:iterator value="shops">
        <tr>
          <td><s:property value="shopId"/></td>
          <td><s:property value="name"/></td>
          <td><s:property value="tel"/></td>
          <td><s:property value="address"/></td>
          <td><s:property value="passwd"/></td>
          <td><s:property value="warehouse.warehouseId"/></td>         
          <td><a href="shopAction_deleteShop?shop.shopId=${shopId}">删除用户</a></td>
        <%--   <td><a href="shopAction_getOneShop?shop.shopId=${shopId}">修改用户</a></td> --%>
          <td><a href="shopAction_getOneShop?shop.shopId=${shopId}">修改用户</a></td>
         
        </tr>
      </s:iterator>
    </table>
  </body>
</html>
