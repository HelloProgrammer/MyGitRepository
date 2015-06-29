<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Stage/refrence.jsp" %>
<%
String path = request.getContextPath();
String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单处理</title>
    <link rel="stylesheet" href="<%=basePath%>CSS/css/tasp.css" />
    <link rel="stylesheet"  href="<%=basePath%>CSS/css/orderconfirm.css" />
    <link rel="stylesheet"  href="<%=basePath%>CSS/css/css_l.css" />
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
    <style type="text/css">
    	.justtest { border:none; width:50px}
    </style>
  </head>
  
  <body>
  <jsp:include page="../Part/header.jsp"></jsp:include>
  
   
   <form id="J_Form" name="J_Form"  action="transDataAction" method="post">
  <div id="page">

 <div id="content" class="grid-c">

  <div id="address" class="address" style="margin-top: 20px;" >

<h3>确认收货地址
 <span class="manage-address">
 <a href="javascript:;" target="_blank" title="管理我的收货地址"
 class="J_MakePoint" >管理收货地址</a>
 </span>
</h3>

<ul id="address-list" class="address-list">
<li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "  >

 <span class="marker-tip">寄送至</span>
   <div class="address-info">
 
 
<table>
      <tr>
	        <th></th>
	        <th>收货人地址</th>
	        <th>目的地邮编</th>
	        <th>收货人姓名</th>
	        <th>收货人电话</th>
      </tr>
      <tr>
	        <td><input type="radio" name="adress"></td>
	        <td><input id="raddr"  style="width:500px;" name="order.receiveAddress" value="湖北省 恩施土家族苗族自治州 恩施市 湖北民族学院（信息工程学院）  男生宿舍楼235栋" type="text"></td>
	        <td><input id="rzip"   style="width:100px;" name="order.receiveZipcode"  value="264200" type="text"></td>
	        <td><input id="rname"  style="width:100px;" name="order.receiveName" value="晁辉" type="text"></td>
	        <td><input id="rtel"   style="width:100px;" name="order.receiveTel" value="18427717260" type="text"></td>
      </tr>
</table>
         
 </div>
     </li>
     </ul>


<div class="address-bar">
 <a href="#" class="new J_MakePoint" id="J_NewAddressBtn">使用新地址</a>
 </div>

</div>

 
           <div>
 <h3 class="dib">确认订单信息</h3>
 <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
	 <tr>
		 <th class="s-title" >缩略图<hr/></th>
		 <th class="s-price">单价(元)<hr/></th>
		 <th class="s-amount">数量<hr/></th>
		 <th class="s-agio">优惠方式<hr/></th>
		 <th class="s-total">小计(元)<hr/></th>
	 </tr>
	<tbody  class="J_Shop" >
		<tr class="first"><td colspan="5"></td></tr>
		<tr class="shop blue-line">
		</tr>
		<s:iterator value="carts" status="stu">
		<tr class="item"  >
			 <td class="s-title">
			     <input class="justtest" type="text" hidden="hidden" name="orderGoods[${stu.index}].good.goodId" value='<s:property value="%{goods[#stu.index].goodId}"/>'/>
			     <img alt="商品图片" src='<s:property value="%{goods[#stu.index].goodId}"/>' width="100px" height="100px"/>
			     <div align="justify"><s:property  value="%{goods[#stu.index].name}"/></div>
			 </td>
			 <td class="s-price">
			     <input id="p_${stu.index}" class="justtest" type="text" readonly="readonly" name="orderGoods[${stu.index}].salePrice" value='<s:property value="%{goods[#stu.index].price}"/>'/>
			 </td>
			 <td class="s-amount" >
			     <input id="g_${stu.index}" class="justtest" type="text" readonly="readonly" name="orderGoods[${stu.index}].num" value='<s:property value="num"/>'/>
			 </td>
			 <td class="s-agio" id="d">
			     <s:property value="%{goods[#stu.index].discount}"/>
			 </td>
			 <td class="s-total">
			     <input id="lt_${stu.index}" class="justtest" type="text" readonly="readonly" name="orderGoods[${stu.index}].totalPrice" value=''/>
			 </td>
	     </tr>
	     <tr>
	         <td colspan="5">
	             给卖家留言：<input style="width:80%" type="text" name="orderGoods[${stu.index}].des">
	         </td>
	     </tr>
	     <br>
	     </s:iterator>
	    
	     <tr style="display:none">
	        <td>
	          <input id="cartnum" type="text" value='<s:property value="carts.size()"/>'/>
	        </td>
	     </tr>
	
	
		<tr class="shop-total blue-line">
		   <td colspan="5">
		     共需付款（含运费）：
		     <input id="t" class="justtest" type="text" readonly="readonly" name="order.totalPrice" value=''/>
		   </td>
		</tr>
	</tbody>
	  <tfoot>
		 <tr>
			 <td colspan="5">
				<div class="order-go">
				<div class="J_AddressConfirm address-confirm">
				 <div style="margin-bottom: 40px;">
				         <a href="<%=basePath %>showAllCartByUserAction"class="back" target="_top">返回购物车</a>
				         <input class="my_button" id="btn" type="submit" value="提交订单">
				         
				  </div>
				 </div>
				
					 <div class="J_confirmError confirm-error">
						 <div class="msg" style="clear: both;">
						     <p class="tips naked" style="float:right;padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
						 </div>
					 </div>
				 </div>
			 </td>
		 </tr>
	 </tfoot>
 </table>

</div>
  
</div>


</div>
  
   </form>
  
  
  
  
  
  </body>
</html>
