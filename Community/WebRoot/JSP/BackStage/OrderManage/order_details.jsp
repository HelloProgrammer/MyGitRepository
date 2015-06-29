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
    <script type="text/javascript" src="<%=path%>/JS/js/libs/modernizr.min.js"></script>
	 <script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
		
		var commentState = document.getElementById("commentState");
		
		/* if(commentState.value=="未评论")
		{
			
			
		     $('td[name="state"]').text("未评论"); 
		    
		} */
		var selectWarehouse = document.getElementById("selectWarehouse"); 
		var warehouseId = document.getElementById("warehouseId");
		var warehouseName = document.getElementById("warehouseName");
		var acceptButton = document.getElementById("acceptOrder");
		var refuseButton = document.getElementById("refuseOrder");
		
		
		
		
		
		if($("#orderState").val() == "用户已下单")
		{
			warehouseId.style.display="none";
			warehouseName.style.display="none";
			$.post("listAllWarehouseAction",null,function(data){
				selectWarehouse.options.add(new Option("请选择","0"));
	    		var member = eval(data);
	    		for(var i=0;i<member.length;i++){
	    			var warehouse=member[i];
					var tr=$("<option></option>");
					tr.attr("width","auto");
					tr.attr("value",warehouse.warehouseId);
					tr.text(warehouse.name);
					
					$("#selectWarehouse").append(tr);
	    		}
    		});
    		
    		selectWarehouse.onchange=function ()
			{
				document.getElementById("warehouseId").value = $("#selectWarehouse option:selected").val();
				document.getElementById("warehouseName").value = $("#selectWarehouse option:selected").text();
			};
		}else{
			selectWarehouse.style.display="none";
		    warehouseId.style.display="none";
			acceptButton.style.display="none";
			refuseButton.style.display="none";
			
			$.post("findOneWarehouseAction",{warehouseId:$("#warehouseId").val()},function(data){
			
				
	    		var member = eval("("+data+")");
	    		
	    		warehouseName.value = member.name;
	    		
			});
			
		}	
		} );
		
		
		
		function accetpfun()
		{
			if($("#selectWarehouse option:selected").text() == "请选择")
			{
				alert("请选择物流配送点");
			}
			else
			{
				updateform.action = "orderAction_acceptOrder";
				updateform.submit;
			}	
			
		
			//updateform.action = "orderAction_acceptOrder";
			//updateform.submit;
		}
		function refusefun()
		{
			updateform.action="orderAction_refuseOrder";
			updateform.submit;
		}
		
		function backfun()
		{
			updateform.action = "orderAction_getAllOrder";
			updateform.submit;
		}
		
	</script>
  </head>
  
  <body>
    <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>         
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>  
       
        <div class="result-wrap">
		     <form name="myform" method="post" enctype="multipart/form-data">
                <div class="result-content">
             		
                                                         订单编号:<s:property value="order.orderId"></s:property>
                                                          顾客：<s:property value="customer.name"></s:property>
                                                        下单日期：<s:property value="order.date"></s:property>
                    <table class="result-tab" width="100%">                              
                        <tr>
						    <th>物品编号</th>
						    <th>缩略图</th>
                           	<th>物品名称</th>
                          	<th>单价</th>                         	
                            <th>数量</th>
                            <th>总价</th>
                            <th>备注</th>
                            <th >评论详情</th>
                            
                        </tr>
                        <s:iterator value="ordergoodList" id="sid" status="status"> 
                       		<tr>
                       			<td><s:property value="good.goodId"/></td>
                      		    <td><img  id="#status.index" width="100" height="100" style=" width: 100px; height: 100px;"  src="<s:property value="%{goodList[#status.index].picture}"/>" ></td>
                       			<%-- <td><s:property value="%{goodList[#status.index].picture}"/></td> --%>
                       			<td><s:property value="%{goodList[#status.index].name}"/></td>
                        		<td><s:property value="%{goodList[#status.index].price}"/></td>
                        		<td><s:property value="num"/></td>
                        		<td><s:property value="totalPrice"/></td>
                        		<td><s:property value="des"/></td>
                        		<td name="state"><a href="orderAction_CommentDetails?good.goodId=${good.goodId }"><s:property value="commentState"/></a></td>
                        		<td hidden="hidden"><input  id="commentState"  type="text" value="<s:property value="commentState"/>"></td>
                        	</tr>
                        </s:iterator>
						<tr>
						   
						    <td colspan="7" style="text-align:left">付款：￥<s:property value="order.totalPrice"></s:property></td>
						</tr>
                    </table>
                </div>
            </form>
            <form  method="post"  name="updateform">
                
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
                               <tr>
                                	<th><i class="require-red">*</i>选择物流配送点：</th>
                                	<td>
					          		<select id="selectWarehouse" ></select>
					          		<input  id="warehouseName"type="text" readonly="true" >
					          		<input  id="warehouseId" name="order.warehouse.warehouseId" value="<s:property value='order.warehouse.warehouseId'/>" type="text" readonly="true">
					          		</td>
					           </tr>			
                               
                                
                        </table>
                    </div>
                </div>
                <table width="100%" class="insert-tab">
				    <tr>
				     <td style="border:hidden"><div align="left">
                        <input type="submit" value="返回" onclick="window.history.back()" class="my_button"></div></td>
					<td  style="border:hidden"><div align="right">
						<input   id=acceptOrder type="submit" value="接单" class="my_button" onclick="accetpfun()"></div></td>
                    <td style="border:hidden"><div align="left">
                        <input id=refuseOrder type="submit" value="拒绝" onClick="refusefun()" class="my_button" ></div></td>
                   
					</tr>
               </table>
				<!-- <div align="center">
				    <input type="submit" value="查看物流" class="my_button">
				</div> -->
            </form>
        </div>
    </div>
</div>
  </body>
</html>
