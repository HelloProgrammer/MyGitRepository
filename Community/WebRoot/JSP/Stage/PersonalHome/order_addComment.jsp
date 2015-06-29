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
	
	function addComment()
	{
		var comment=document.getElementById("comment");
		if(comment.value != "")
		{
			addform.action="orderAction_addComment";
			addform.submit;
		}
		else{
			alert("请输入评论");
		}
		
		
	}
	</script>
  </head>
  
  <body>
  <jsp:include page="../Part/header.jsp"></jsp:include>

 <div class="container clearfix">
    <%@ include file="../Part/menu_p.jsp" %> 
    <div class="main-wrap">
    
    
    <div style="width:1100px;maegin-left:auto;margin-right:auto;">   
        <div class="result-wrap">
		    
                <form name="addform" method="post" >
			<div class="config-items">
                    
                    <div class="result-content">
                    
                        <table width="100%" class="insert-tab">
						    <tr>
                                
                                <td><input hidden="hidden" id=orderGoodId value=<s:property value='ordergood.id'/> readonly="readonly" type="text"></td>
                            </tr>
                            <tr>
                                <th width="15%"><i class="require-red">*</i>本人评论：</th>
                                
                                <td><textarea resize="none" name="ordergood.comment"  class="my_textarea" id="comment" cols="30" style="width: 98%;" rows="10" ></textarea></td>
                            </tr>
                                
       
                        </table>
                        
                    </div>
                </div>
                <table width="100%" class="insert-tab">
				    <tr>
				    
				     <td style="border:hidden"><div align="left">
                        <input type="button" value="返回" onclick="history.go(-1)" class="my_button"></div></td>
                        <td style="border:hidden"><div align="right">
                        <input id="submit" class="my_button" type="submit" value="提交" onclick="addComment()"/></div></td>
                   
					</tr>
               </table>
               </form>
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
