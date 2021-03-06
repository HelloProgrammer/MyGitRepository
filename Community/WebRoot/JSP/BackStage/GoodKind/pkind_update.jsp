<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/css_l.css"/>
    <script type="text/javascript" src="<%=basePath%>JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>JS/js/libs/js_l.js"></script>
    <script type="text/javascript">
    $(document).ready( function() {
    	
        $("#btn").click( function() {
            if($("#kindName").val() == ""){
            	$("#text").html('<font color="#eaf0f00;">类别名不能为空!</font>');
            }else{
            	window.location.href="updatePkindAction?pkindName="+
       		 encodeURI(encodeURI($("#kindName").val()));
            };
            
        });
    });
    </script>
  </head>
  
  <body>
    <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>         
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>  
       <div style="width:1100px;maegin-left:auto;margin-right:auto;"> 

            <div class="result-content">
            <!-- <form action="updatePkindAction" method="post"> -->
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <s:iterator value="pkinds">
                            <tr>
                                <th> 种类ID:</th>
                                <td>
                                    <s:property value="pkindId"/>
                                </td>
                            </tr>
                            <tr>
                                <th>种类名称:</th>
                                <td><input class="common-text" name="pkind.pkindName" id="kindName" size="50" value=<s:property value="pkindName"/> type="text"><span id="text"></span></td>
                                
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input id="btn" class="my_button" value="保存" type="button" >
                                    <input class="my_button" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                            </s:iterator>
                        </tbody></table>
                        <!-- </form> -->
            </div>
       </div>
        </div>
</div>
  
  
  
  
  </body>
</html>
