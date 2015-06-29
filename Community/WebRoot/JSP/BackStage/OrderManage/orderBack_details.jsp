<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="../../CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="../../CSS/css/css_l.css"/>
    <script type="text/javascript" src="../../JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="../../JS/js/libs/js_l.js"></script>

  </head>
  
  <body>
    <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>         
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>  
       
        <div class="result-wrap">
		     <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
						    <th>缩略图</th>
                            <th>物品</th>
                            <th>退单理由</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>优惠政策</th>
                        </tr>
                        <tr>
						    <td><img width="100px" height="100px" src="../../images/guanggao.png"/></td>
                            <td >电动棒</td>
                            <td >男朋友很生气。。。。。。。;</td>
                            <td>180.00元</td>
							<td>1</td>
                            <td>满150减50</td>
                        </tr>
                         <tr>
                            <td><img width="100px" height="100px" src="../../images/banner1.jpg"/></td>
                            <td >运动鞋</td>
                            <td >颜色发错！！！！！</td>
                            <td>500.00元</td>
							<td>2</td>
                            <td>无</td>
                        </tr>
						<tr>
						    <th colspan="4" style="text-align:left">发货地址：哈工大威海环翠区啦啦啦收</th>
						    <th colspan="2" style="text-align:right">实付款：￥600.00</th>
						</tr>
                    </table>
                </div>
            </form>
            <form action="#" method="post" id="myform" name="myform">
                <div class="config-items">
                    <div class="result-content">
                        <table width="100%" class="insert-tab">
						    <tr>
						        <td  style="border:hidden"><div align="center">
						          <input type="submit" value="接受退单" class="my_button">
						          </div></td>
                                <td style="border:hidden"><div align="center">
                                  <input type="button" value="回绝退单" onClick="" class="my_button" >
                                </div></td>
							</tr>
                        </table>
                    </div>
                </div>
			<div class="config-items">
                    <div class="config-title">
                        <h1><i class="icon-font">&#xe014;</i>订单人详细信息</h1>
                    </div>
                    <div class="result-content">
                        <table width="100%" class="insert-tab">
						    <tr>
                                <th width="15%"><i class="require-red">*</i>订单状态：</th>
                                <td><input type="text" readonly="true" id="" value="已完成" size="85" name="email" class="common-text"></td>
                            </tr>
                            <tr>
                                <th width="15%"><i class="require-red">*</i>订单人：</th>
                                <td><input type="text" readonly="true" id="" value="猴子请来的逗比" size="85" name="email" class="common-text"></td>
                            </tr>
                                <tr>
                                    <th><i class="require-red">*</i>联系方式：</th>
                                    <td><input type="text" readonly="true" id="" value="1831232132" size="85" name="contact" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>地点：</th>
                                    <td><input type="text" readonly="true" id="" value="发货地址：哈工大威海环翠区啦啦啦收" size="85" name="phone" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>下单时间：</th>
                                    <td><input type="text" readonly="true" id="" value="2015-06-19 21:00:00" size="85" name="icp" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>送达时间：</th>
                                    <td><input type="text" readonly="true" id="" value="2015-06-20 21:00:00" size="85" name="address" class="common-text"></td>
                                </tr>
                                
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
  </body>
</html>
