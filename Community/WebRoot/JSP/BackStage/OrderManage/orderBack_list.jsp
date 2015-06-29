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
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
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
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text" ></td>
                            <td><input class="my_button" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a id="batchDel" href="#"><i class="icon-font"></i>批量回绝</a>
                        <a id="updateOrd" href="#"><i class="icon-font"></i>手动更新</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%"><input class="allChoose" name="" type="checkbox"></th>
                            <th>ID</th>
                            <th>订单人姓名</th>
                            <th>联系方式</th>
                            <th>下单时间</th>
                            <th>退单理由</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td class="tc"><input type="checkbox"></td>
                            <td><a  href="orderBack_detial.html" >2121121</a></td>
                            <td >朱勇</td>
                            <td>18369180463</td>
                            <td>2014-03-15 21:11:01</td>
                            <td>我特么要吃辣的</td>
                            <td>
                                <a  href="#">接受！</a>
                                <a  href="#">回绝</a>
                            </td>
                        </tr>
                         <tr>
                            <td class="tc"><input type="checkbox"></td>
                            <td><a  href="orderBack_detial.html" >323223</a></td>
                            <td >周杰伦</td>
                            <td>18369180363</td>
                            <td>2014-03-15 11:11:01</td>
                            <td>啥都尽快发货</td>
                            <td>
                                <a  href="#">接受！</a>
                                <a  href="#">拒绝</a>
                            </td>
                        </tr>
                    </table>
                    <div class="list-page"> 2 条 1/1 页</div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
  
 </div>
    
  </body>
</html>
