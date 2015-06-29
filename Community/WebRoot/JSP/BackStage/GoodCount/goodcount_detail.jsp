<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/css_l.css" />
    <script type="text/javascript" src="<%=basePath%>JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>JS/js/libs/js_l.js"></script>
	<script type="text/javascript" src="<%=basePath%>JS/js/libs/CJL.0.1.min.js"></script>
  </head>
  
  <body>
  <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>
                  
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>  
        <div style="width:1100px;maegin-left:auto;margin-right:auto;"> 
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                          

                        </tr>                
                    </table>
                </form>
            </div>
        </div>
        
        <div class="result-wrap">
            <form method="post" enctype="multipart/form-data">
                <div class="result-content">
    
      
                    <table id="table_page" class="my_result-tab"   >
                        <thead>
                        <tr>
                            <th width="150px">订单编号</th>
                            <th width="150px">名称</th>
                            <th width="80px">单价（元）</th>
                            <th width="60px">销量</th>
                            <th width="80px">进价（元）</th>
                            <th width=80px>利润（元）</th>
                        </tr>
                        </thead>
      <tbody id="group_one">
      <s:iterator value="orderGoodList" id="sid" status="status">
        <tr>
            <td><s:property value="order.orderId"/></td>
			<td><s:property value="good.goodId"/></td> 
			<td><s:property value="salePrice"/></td>
			<td><s:property value="num"/></td>
			<td><s:property value="commentState"/></td>
			<td><s:property value="comment"/></td>
        </tr>
      </s:iterator>
      <tr>

			<td colspan="6"><div align="right">总利润<input id="profit" style="border:none;background-color:transparent;overflow:visible;" type="text" value=<s:property value="totalProfit"/> readonly="readonly"></div></td>
         
	 </tr>
      </tbody>
                    </table>
 
                    <div align="left"> 
                     <table>
						<tr>
						<td><a href="javascript:;" onclick="page.firstPage()">首页</a>——</td>
						<td><a href="javascript:;" onclick="page.prePage();">上一页</a>-</td>
						<td><a  id="my_iPageIndex"></a>-</td>
						<td><a href="javascript:;" onclick="page.nextPage();">下一页</a>——</td>
						<td>共-<a href="javascript:;" id="PageCount"></a>-页——</td>
						<td><a  href="javascript:;" onclick="page.aimPage()">转到</a>第<input type="text" id="current_page" style="text-align:center;width:40px;" />页</td>
						<td><span id="pageindex"></span></td></tr>
					</table>
					
                    </div>
                </div>
            </form>
            <input class="my_button" onClick="history.go(-1)" value="返回" type="button">
        </div>
         </div>
    </div>
        
  
 </div>
 
  </body>
</html>
