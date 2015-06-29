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
	<script type="text/javascript">
	$(document).ready(function() {
	
		var orderStateId = document.getElementById("orderState");
	    //document.getElementByName("commentStates"); 
		var commmentStateId = document.getElementById("commmentStateId");
		var orderId = document.getElementById("orderId");
		
	
		
		if(orderStateId.value=="1")
		{
			
		     $('td[name="commentStates"]').text("商家未处理订单"); 
		    
		}else if(orderStateId.value=="2"){
			
			 $('td[name="commentStates"]').html("<a href='orderAction_UpdateOrder?order.orderId="+orderId.value+"'>确认收货</a>"); 
			
		}else if(orderStateId.value=="3"){
			
		    $('td[name="commentStates"]').text("商家已拒单"); 
			
		}else{
		
			/* if(commmentStateId.value=="未评论")
			{
				 $('td[name="commentStates"]').html("<a href='orderAction_FrontOrderDetails?order.orderId=1435236883479'>去评价</a>");
			}
			else{
				 $('td[name="commentStates"]').html("<a href='orderAction_FrontOrderDetails?order.orderId=1435236883479'>查看评价</a>");
			}; */
		}
		/* for(var i=1;i<length;i++)
		{
			
			
		} */
		
		 
	
	});
	</script>
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
        <div class="result-wrap">
		     <form name="myform" method="post" enctype="multipart/form-data">
                <div class="result-content">
             		
                                                         订单编号:<s:property value="order.orderId"></s:property>
                                                          顾客：<s:property value="customer.name"></s:property>
                                                        下单日期：<s:property value="order.date"></s:property>
                    <table id="orderGood" class="result-tab" width="100%">                              
                        <tr>
						    <th>物品编号</th>
						    <th>缩略图</th>
                           	<th>物品名称</th>
                          	<th>单价</th>                         	
                            <th>数量</th>
                            <th>总价</th>
                            <th>备注</th>
                            <th>状态</th>
                            
                        </tr>
                        <s:iterator value="ordergoodList" id="sid" status="status"> 
                       		<tr>
                       			<td name="g_${status.index}"><s:property value="good.goodId"/></td>
                      		    <td><img  id="#status.index" width="100" height="100" style=" width: 100px; height: 100px;"  src="<s:property value="%{goodList[#status.index].picture}"/>" ></td>
                       			<%-- <td><s:property value="%{goodList[#status.index].picture}"/></td> --%>
                       			<td><s:property value="%{goodList[#status.index].name}"/></td>
                        		<td><s:property value="%{goodList[#status.index].price}"/></td>
                        		<td><s:property value="num"/></td>
                        		<td><s:property value="totalPrice"/></td>
                        		<td><s:property value="des"/></td>
                        		
                        		<td hidden="hidden"><input id="orderState" type="text" value=<s:property value="orderStateId"/>></td>
                        		<td name="commentStates"><a href="orderAction_comment?ordergood.Id=${Id}"><s:property value="commentState"/></a></td>
                        		<td hidden="hidden"><input id="commmentStateId" type="text" value=<s:property value="commentState"/>></td>
                        		<td hidden="hidden"><input id="orderId" type="text" value=<s:property value="order.orderId"/>></td>
                        		<td hidden="hidden"><input id="goodId" type="text" value=<s:property value="good.goodId"/>></td>
                        		
                        		
                        	</tr>
                        		
                        	
                        </s:iterator>
						<tr>
						   
						    <td colspan="8" style="text-align:left">付款：￥<s:property value="order.totalPrice"></s:property></td>
						</tr>
                    </table>
                </div>
            </form>
            <form action="#" method="post"  name="updateform">
                
			<div class="config-items">
                    <div class="config-title">
                        <h1><i class="icon-font">&#xe014;</i>收件人详细信息</h1>
                    </div>
                    <div class="result-content">
                        <table width="100%" class="insert-tab">
						    <tr>
                                <th width="15%"><i class="require-red">*</i>订单状态：</th>
                                <td><input type="text" readonly="true" id="orderState" value="<s:property value='orderstate.orderStateName'/>" size="85" name="email" class="common-text"></td>
                            </tr>
                            <tr>
                                <th width="15%"><i class="require-red">*</i>收件人：</th>
                                <td><input type="text" readonly="true" id="" value="<s:property value='order.receiveName'/>" size="85" name="" class="common-text"></td>
                            </tr>
                                <tr>
                                    <th><i class="require-red">*</i>联系方式：</th>
                                    <td><input type="text" readonly="true" id="" value="<s:property value='order.receiveTel'/>" size="85" name="" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>邮编：</th>
                                    <td><input type="text" readonly="true" id="" value="<s:property value='order.receiveZipcode'/>" size="85" name="" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>地址：</th>
                                    <td><input type="text" readonly="true" id="" value="<s:property value='order.receiveAddress'/>" size="85" name="" class="common-text"></td>
                                </tr>
                                <tr>
                                	<th><i class="require-red">*</i>物流状态：</th>
                                	<td>
					          		<input  type="text" readonly="true" value="<s:property value='order.logisticsStateId'/>" size="85" name="" class="common-text">
					          		</td>
					           </tr>		
                               		
                               
                                
                        </table>
                    </div>
                </div>
                <table width="100%" class="insert-tab">
				    <tr>
				     <td style="border:hidden"><div align="left">
                        <input type="button" value="返回" onclick="history.go(-1)" class="my_button"></div></td>
                 
                   
					</tr>
               </table>
				<!-- <div align="center">
				    <input type="submit" value="查看物流" class="my_button">
				</div> -->
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
