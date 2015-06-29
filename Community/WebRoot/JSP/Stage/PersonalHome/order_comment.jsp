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
		    
                
			<div class="config-items">
                    <div class="config-title">
                        <h1><i class="icon-font">&#xe014;</i>收件人详细信息</h1>
                    </div>
                    <div class="result-content">
                        <table width="100%" class="insert-tab">
						    <tr>
                                
                                <td><input hidden="hidden" id="orderGoodId" value=<s:property value='ordergood.id'/> size="85" readonly="readonly" class="common-text" type="text"></td>
                            </tr>
                            <tr>
                                <th width="15%"><i class="require-red">*</i>本人评论：</th>

                                <td><textarea  readonly="readonly" resize="none" name="ordergood.manageComment"  class="my_textarea" id="orderGoodComment" cols="30" style="width: 98%;" rows="10" ><s:property value='ordergood.comment'/></textarea></td>

                            </tr>
                                <tr>
                                    <th><i class="require-red">*</i>商家回复：</th>

                                    <td><textarea  readonly="readonly" resize="none" name="ordergood.manageComment"  class="my_textarea" id="orderGoodManageComment" cols="30" style="width: 98%;" rows="10" ><s:property value='ordergood.manageComment'/></textarea></td>                          
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
