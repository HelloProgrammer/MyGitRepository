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
    <script type="text/javascript">
      function profit(){
    	  goodCount.action="goodcountAction_showAllGoodByProfit";
    	  goodCount.submit();
      }
      function saleNum(){
    	  goodCount.action="goodcountAction_getAllGood";
    	  goodCount.submit();
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
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                                    
                    </table>
                </form>
            </div>
        </div>
        
        <div class="result-wrap">
            <form name="goodCount" method="post" enctype="multipart/form-data">
                <div class="result-content">
    
      
                    <table id="table_page" class="my_result-tab"   >
                        <thead>
                        <tr>
						    <th width="150px">编号</th>
						    <th width="103px">缩略图</th>
                            <th width="150px">名称</th>
                            <th width="80px" onclick="sortAble('table_page', 3, 'int')" style="cursor:pointer">进价（元）</th>
                            <th width="80px">单价（元）</th>
                            <th width="60px">库存</th>
                            <th width="60px" onclick="saleNum()" style="cursor:pointer">销量</th>
                            <th width="90px" onclick="profit()" style="cursor:pointer">利润（元）</th>
							<th width="100px">操作</th>
                        </tr>
                        </thead>
      <tbody id="group_one">
      <s:iterator value="goodlist" id="sid" status="status">
        <tr>
          <td><a href="goodcountAction_getOrderGoodByGoodId?good.goodId=${goodId}"><s:property value="goodId"/></a></td>
		  <td><img id="#status.index" width="100" height="100" style=" width: 100px; height: 100px;"  src="<s:property value='picture'/>"></td> 
          <td><s:property value="name"/></td> 
          <td><s:property value="buyPrice"/></td>
		  <td><s:property value="price"/></td>
		  <td><s:property value="stock"/></td>
		  <td><s:property value="saleNum"/></td>
		  <td><s:property value="ishot" /></td>
          <td><a href="goodcountAction_getOrderGoodByGoodId?good.goodId=${goodId}">详情</a></td>
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
            </form>
        </div>
         </div>
    </div>
        
  
 </div>

  </body>
</html>
