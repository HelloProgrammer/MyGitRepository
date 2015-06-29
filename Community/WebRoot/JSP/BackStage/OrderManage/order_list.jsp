<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理</title>
    
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/css_l.css"/>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/Calendar4.js" ></script>
    <script type="text/javascript" src="<%=path%>/JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/CJL.0.1.min.js"></script>
	<script type="text/javascript">
    function myrefresh() 
	{ 		
      window.location.reload(); 
	} 
	setTimeout('myrefresh()',30000); //指定1秒刷新一次  
	
	</script>
  </head>
  
  <body>
          <%@ include file="../Parts/header.jsp" %>
 <div  class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>         
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>
        <div id="mycontent" style="width:1100px;maegin-left:auto;margin-right:auto;">   
        <div class="search-wrap">
            <div class="search-content">
                <form action="orderAction_getAllOrderByTime" method="post" enctype="multipart/form-data">
                    <table class="search-tab">
                        <tr>
                            <th width="80">起始时间:</th>
                            <td width="100">
                                <input type="text"  readonly="true" name="startTime"  id="startTime" onClick="MyCalendar.SetDate(this)"  />
                            </td>
							<th width="80">结束时间:</th>
                            <td width="100">
                                <input type="text"  readonly="true" name="endTime"  id="endTime" onClick="MyCalendar.SetDate(this)" />
                            </td>
                           
                            
                            <td><input class="my_button"  name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a id="batchDel" href="#"><i class="icon-font"></i>批量删除</a>
                        <a id="updateOrd" href="#"><i class="icon-font"></i>手动更新</a>
                    </div>
                </div>
                <div class="result-content">
                    <table id="table_page" class="my_result-tab" >
                        <tr>                         
                            <th width="150px">订单号</th>
                            <th width="80px">顾客姓名</th>
                            <th width="100px">订单状态</th>                            
                            <th width="80px">物流状态</th>
                            <th width="80px">订单总价</th>
                            <th width="200px" >下单时间</th>
                           
                            <th width="80px">操作</th>
                        </tr>
                        <tbody id="group_one">                
                       		<s:iterator value="orderlist" id="sid" status="status"> 
                       		<tr>               		
                       		  <td><a href="orderAction_OrderDetails?order.orderId=${orderId}"><s:property value="orderId"/></a></td>	                  		  	         				          
					   		  <td><s:property value="%{customerList[#status.index].name}"/></td>			   		  
					          <td><s:property value="%{orderStateList[#status.index].orderStateName}"/></td>
					          <td><s:property value="logisticsStateId"/></td>
					          <td><s:property value="totalPrice"/></td>
					          <td><s:property value="date"/></td>		
					         
					         	          
					          <!-- <td><s:property value="ishot"/></td> -->					                      
          					<td><a href="orderAction_OrderDetails?order.orderId=${orderId}">详情</a>
          					
                       		</tr>
                       		</s:iterator>
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
        </div>
    </div>
   </div>        
        
  
 </div>
    
  </body>
</html>
