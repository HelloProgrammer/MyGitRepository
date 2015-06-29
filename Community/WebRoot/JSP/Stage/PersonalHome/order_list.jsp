<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/css_l.css"/>
    <link href="CSS/css_front/search.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="CSS/css_front/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="CSS/css_front/form.css" rel="stylesheet" type="text/css" media="all" />
	<link href="CSS/css_front/megamenu.css" rel="stylesheet" type="text/css" media="all" />

	
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/main.css"/>
	
	<script type="text/javascript" src="<%=path%>/JS/js/libs/Calendar4.js" ></script>
    <script type="text/javascript" src="<%=path%>/JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
	
	
	
  </head>
  
  <body>
<jsp:include page="../Part/header.jsp"></jsp:include>
   <div class="header-top">
    
	 <div class="wrap"> 
		<div class="logo">
			<a href="<%=basePath %>/JSP/Stage/cat.jsp"><img src="" alt=""/></a>
	    </div>
		
		<div class="clear"></div>
 	</div>
   </div>
<div class="header-bottom" >
   	  <div class="wrap">
   		 <div class="clear"></div>
     </div>
</div>



 <div class="container clearfix">
    <%@ include file="../Part/menu_p.jsp" %> 
    
  
    <div class="main-wrap">
    <div style="width:1100px;maegin-left:auto;margin-right:auto;">   
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post" enctype="multipart/form-data">
                    <table class="search-tab">
                       
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                   
                        <a id="updateOrd" href="javascript:history.go(0)"><i class="icon-font"></i>手动更新</a>
                    </div>
                </div>
                <div class="result-content">
                    <table id="table_page" class="my_result-tab" >
                        <tr>                         
                            <th width="150px">订单号</th>
                           
                            <th width="100px">订单状态</th>                            
                            <th width="80px">物流状态</th>
                            <th width="80px">订单总价</th>
                            <th width="180px">下单时间</th>
                           
                            <th width="80px">操作</th>
                        </tr>
                        <tbody id="group_one">                
                       		<s:iterator value="orderlist" id="sid" status="status"> 
                       		<tr>               		
                       		  <td><a href="orderAction_FrontOrderDetails?order.orderId=${orderId}"><s:property value="orderId"/></a></td>	                  		  	         				          			   		  
					          <td><s:property value="%{orderStateList[#status.index].orderStateName}"/></td>
					          <td><s:property value="logisticsStateId"/></td>
					          <td><s:property value="totalPrice"/></td>
					          <td><s:property value="date"/></td>		
					         
					         	          
					          <!-- <td><s:property value="ishot"/></td> -->					                      
          					<td><a href="orderAction_FrontOrderDetails?order.orderId=${orderId}">详情</a>
          					
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










<div class="clear"></div>
<div style="position:fixed;left:0px;bottom:0px;width:100%;">
<div class="copy">
       	   <div class="wrap">
       	   	  <p>Copyright &copy; 2014.Company name All rights reserved.</p>
       	   </div>
</div>
</div>






         
         
         
        
    
  </body>
</html>
