<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
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
	<script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		
		if(document.getElementById("commentState").value == "双方已评")
		{
			document.getElementById("submit").style.display="none";
			document.getElementById("manageinput").readOnly="readonly";
		}
		else if(document.getElementById("commentState").value == "未评论")
		{
			document.getElementById("submit").style.display="none";
			document.getElementById("manageinput").readOnly="readonly";
		}
	
	});
	
	    function checknull()
	    {
	        var inputvalue = document.getElementById("manageinput").value;
	        if(inputvalue==""||inputvalue==null)
	        {
	            alert("卖家评论为空！");
	        	
	        }
	        else
	        {
	        	commentform.action="orderAction_managecomment";
	        	commentform.submit;
	        }
	    	
	    }
	    
	    
	    
	    
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
                <form  theme="simple"  method="post"  name="commentform" >
                    <table class="insert-tab" width="100%">
                        <tbody>
                        
                            <tr>
                                <th> 订单编号:</th>
                                <td>
                                    <s:property value="order.orderId"></s:property>
                                </td>
                            </tr>
                            <tr>
                                <th>商品ID:</th>
                                
                                <td><s:property value="good.goodId"></s:property></td>
                            </tr>
                            <tr>
                                <th>下单日期:</th>
                                <td><s:property value="order.date"></s:property></td>
                            </tr>
                            <tr>
                                <th>买家评论:</th>
                                <td><textarea  readonly="true" resize="none" name="ordergood.comment"  class="my_textarea" cols="30" style="width: 98%;" rows="10"   ><s:property value='ordergood.comment'/></textarea></td>
                               
                            </tr>
                            <tr>
                               <th>卖家评论:</th>
                               <td hidden="hidden"><input id="commentState"  type="text" value = <s:property value='ordergood.commentState'/> ></td>
                               
                                <td><textarea  resize="none" name="ordergood.manageComment"  class="my_textarea" id="manageinput" cols="30" style="width: 98%;" rows="10"  ><s:property value='ordergood.manageComment'/></textarea></td>
                            </tr>
                           
                            <tr>
                                <th></th>
                                <td>
                                    <input id="submit" class="my_button" value="提交评论" type="submit" onclick="checknull()">
                                    <input class="my_button" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                            
                        </tbody></table>
                </form>
            </div>
       </div>
        </div>
</div>


                              
  </body>
</html>
