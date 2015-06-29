<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Common/common.jsp" %>
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
  	  if($("#p").val() != ""){
  		  var price = $("#p").val();
      	  var num = $("#g").val();
      	  var lt = price * num;
      	  $("#lt").val(lt.toFixed(1));
      	  $("#t").val($("#lt").val());
  	  }
  	  $("#btn").click(function(){
  	  	var text1,text2,text3,text4;
  	  	var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
  	  	var zip =  /^[1-9][0-9]{5}$/;
  	  	text1 = $.trim($("#raddr").val());
  	  	text2 = $.trim($("#rzip").val());
  	  	text3 = $.trim($("#rname").val());
  	  	text4 = $.trim($("#rtel").val());
  	  	if(text1&&text2&&text3&&text4){
  	  		if(!zip.test(text2)&&!reg.test(text4)){
  	  			alert("电话，邮编不正确");
  	  		}else if(!reg.test(text4)){
  	  			alert("电话号码不正确")
  	  		}else if(!zip.test(text2)){
  	  			alert("邮编不正确");
  	  		}else{
  	  			J_Form.action="transferDataAction";
  	  			J_Form.submit();
  	  		}
  	  	}else{
  	  		alert("收货信息不完整");
  	  	}
  	  });
    });
    </script>

    </head>
  
  <body>
  <jsp:include page="../Part/header.jsp"></jsp:include>
  <form id="J_Form" name="J_Form"  method="post">
  <div id="page">

 	<div id="content" class="grid-c">
  	<div id="address" class="address" style="margin-top: 20px;" >
	<h3>确认收货地址</h3>

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
			 <th class="s-title" >缩略图<hr/></th>
			 <th class="s-price">单价(元)<hr/></th>
			 <th class="s-amount">数量<hr/></th>
			 <th class="s-agio">优惠方式(元)<hr/></th>
			 <th class="s-total">小计(元)<hr/></th>
		 </tr>

		<s:iterator value="goods">
		<tbody  class="J_Shop" >
			<tr class="first"><td colspan="5"></td></tr>
			<tr class="shop blue-line">
			
			 
			</tr>
			
			<tr class="item"  >
				 <td class="s-title">
				     <input class="justtest" type="text" hidden="hidden" name="orderGood.good.goodId" value='<s:property value="goodId"/>'/>
				     <div style="float:left"><img alt="商品图片" src='<%=picPath %><s:property value="picture"/>' width="100px" height="100px"/></div>
				     <div align="justify" style="padding:25px"><s:property  value="name"/></div>
				     <div style="clear:both"></div>
				 </td>
				 <td class="s-price">
				 	 <input id="p" class="justtest" type="text" readonly="readonly" name="orderGood.salePrice" value='<s:property value="price"/>'/>
				 </td>
				 <td class="s-amount" >
				     <input id="g" class="justtest" type="text" readonly="readonly" name="orderGood.num" value='<s:property value="goodNum"/>'/>
				 </td>
				 <td class="s-agio" id="d">
				     <s:property value="discount"/>
				 </td>
				 <td class="s-total">
				     <input id="lt" class="justtest" type="text" readonly="readonly" name="orderGood.totalPrice" value=''/>
				 </td>
		     </tr>
			<tr class="item-service">
			 <td colspan="5" class="servicearea" style="display: none"></td>
			</tr>

			<tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>
			<tr class="other other-line">
 				<td colspan="5">
 					<ul class="dib-wrap">
 						<li class="dib user-info">
							 <ul class="wrap">
								 <li>
									  <div class="field gbook">
										   <label class="label">给卖家留言：</label>
										   <textarea style="width:350px;height:80px;"  name="orderGood.des"></textarea>
									 </div>
								</li>
  							 </ul>
 						</li>
 						<li class="dib extra-info">

							 <div class="shoparea">
							 <ul class="dib-wrap">
								 <li class="dib title">店铺优惠：</li>
								 <li class="dib sel"><div class="J_ShopPromo J_Promotion promotion clearfix" ></div></li>
								 <li class="dib fee">  <span class='price '>
								 -<em class="style-normal-bold-black J_ShopPromo_Result"  >0.0</em>
								  </span>
								 </li>
							 </ul>
							 </div>

							 <div class="shoppointarea"></div>

   							<div class="extra-area">
								 <ul class="dib-wrap">
									 <li class="dib title">发货时间：</li>
									 <li class="dib content">卖家承诺订单在买家付款后，72小时内<a href="#">发货</a></li>
								 </ul>
							 </div>
   
						   	<div class="servicearea" style="display: none"></div>
						 </li>
 					</ul>
 				</td>
			</tr>

			<tr class="shop-total blue-line">
			   <td colspan="5">
			     共需付款（含运费）：
			     <input id="t" class="justtest" type="text" readonly="readonly" name="order.totalPrice" value=''/>
			   </td>
			</tr>
		</tbody>
 		</s:iterator>
  		<tfoot>
			 <tr>
			 	<td colspan="5">

					<div class="order-go">
						<div class="J_AddressConfirm address-confirm">
					 		<div style="margin-bottom: 40px;">
						         <a href="javascript:history.go(-1)" class="back" target="_top">返回上一页</a>
						         <input class="my_button" id="btn" type="button" value="提交订单">
         
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
