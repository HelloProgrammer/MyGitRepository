<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
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
    <link rel="stylesheet" href="<%=basePath%>CSS/css/tasp.css" />
    <link rel="stylesheet"  href="<%=basePath%>CSS/css/orderconfirm.css" />
    
    <script type="text/javascript">
      $(document).ready(function(){
    	  var total=0.0;
    	  for(var i=0;i<$("#cartnum").val();i++){
    		  if($("#p_"+i).val() != ""){
        		  var price = $("#p_"+i).val();
            	  var num = $("#g_"+i).val();
            	  var lt = price * num;
            	  $("#lt_"+i).val(lt.toFixed(1));
            	  total += parseFloat($("#lt_"+i).val());
        	  }
    	  }
    	  $("#t").val(total.toFixed(1));
    	  
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
  <form id="J_Form" name="J_Form"  action="showOrderAction" method="post">
  <div id="page">

 <div id="content" class="grid-c">

  <div id="address" class="address" style="margin-top: 20px;" >

<h3>确认收货地址
 
</h3>

<ul id="address-list" class="address-list">
<li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "  >

 <span class="marker-tip">寄送至</span>
   <div class="address-info">
 
 
<table>
      <tr>
	        <th>收货人地址：</th>
	        <td><input id="raddr"  style="width:500px;" name="order.receiveAddress" value="" type="text"></td>
      </tr>
      <tr>
      		<th>目的地邮编：</th>
      		<td><input id="rzip"   style="width:100px;" name="order.receiveZipcode"  value="" type="text"></td>
      </tr>
      <tr>
	        <th>收货人姓名：</th>
	        <td><input id="rname"  style="width:100px;" name="order.receiveName" value="" type="text"></td>
      </tr>
       <tr>
	        <th>收货人电话：</th>
	        <td><input id="rtel"   style="width:100px;" name="order.receiveTel" value="" type="text"></td>
      </tr>
</table>
         
 </div>
     </li>
     </ul>




</div>

 
           <div>
 <h3 class="dib">确认订单信息</h3>
 <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
 <tr>
 <th class="s-title" >商品信息<hr/></th>
 <th class="s-price">单价(元)<hr/></th>
 <th class="s-amount">数量<hr/></th>
 <th class="s-agio">金额(元)<hr/></th>
 <th class="s-total">操作<hr/></th>
 </tr>

     


<s:iterator value="carts" status="stu">
<tbody  class="J_Shop" >
	<tr class="first"><td colspan="5"></td></tr>
	<tr class="shop blue-line">
	 
	</tr>
	
	<tr class="item"  >
		 <td class="s-title">     
		     <input class="justtest" type="text" hidden="hidden" name="orderGood.good.goodId" value='<s:property value="%{goods[#stu.index].goodId}"/>'/>
		     <div style="float:left"><img alt="商品图片" src='<%=picPath %><s:property value="%{goods[#stu.index].picture}"/>' width="100px" height="100px"/></div>
		     <div align="justify" style="padding:25px"><s:property value="%{goods[#stu.index].name}"/></div>
			 <div style="clear:both"></div>
		 </td>
		 
		 <td class="s-price">
		 	 <input id="p_${stu.index}" style="border:none;background-color:transparent;" class="justtest" type="text" readonly="readonly" name="orderGood.salePrice" value='<s:property value="%{goods[#stu.index].price}"/>'/>
		 </td>
		 <td class="s-amount" >
		     <input id="g_${stu.index}" style="border:none;background-color:transparent;" class="justtest" type="text" readonly="readonly" name="orderGood.num" value='<s:property value="num"/>'/>
		 </td>
		 <td class="s-agio">
		     <input id="lt_${stu.index}" style="border:none;background-color:transparent;" class="justtest" type="text" readonly="readonly" name="orderGood.totalPrice" value=''/>
		 </td>
		 <td class="s-total">
		     <a href="deleteCartAction?cart.good.goodId=<s:property value="%{goods[#stu.index].goodId}"/>">删除</a>
		 </td>
     </tr>
</s:iterator>
     <tr style="display:none">
       <td>
	     <input id="cartnum" value=<s:property value="carts.size()"/> type="text">
	   </td>
	</tr>

 </table>
 <div align="right">
 	<a href="javascript:history.go(-1)" style="float:left">返回上一页</a>
	共需付款：
	<input id="t" style="border:none;background-color:transparent;" class="justtest" type="text" readonly="readonly" name="order.totalPrice" value="0"/>
	<input class="my_button" id="btn" type="submit" value="结算">
</div>

</div>
  
</div>


</div>
  
   </form>



  </body>
</html>
