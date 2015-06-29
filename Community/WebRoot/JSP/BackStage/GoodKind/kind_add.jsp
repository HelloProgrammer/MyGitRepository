<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  String pkindId = request.getParameter("pkindId");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>CSS/css/css_l.css" />
    <script type="text/javascript" src="<%=basePath%>JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>JS/js/libs/js_l.js"></script>
    <script type="text/javascript">
    $(document).ready( function() {
    	$.post("listAllPkindAction",null,function(data){
    		var member = eval(data);
    		for(var i=0;i<member.length;i++){
    			var admin=member[i];
				var tr=$("<option></option>");
				tr.attr("width","auto");
				tr.attr("value",admin.pkindId);
				tr.text(admin.pkindName);
				$("#selectpkind").append(tr);
    		}
    	});
    	
        //使用 Ajax 的方式 判断登录
        $("#btn").click( function() {
            var url = "findKindByNameAction";
            //获取表单值，并以json的数据形式保存到params中    
            var params = {
            	kindName:$("#kindName").val()
            };
            if($("#kindName").val() == ""){
            	$("#text").html('<font color="#eaf0f00;">类别名不能为空!</font>');
            }else{
            	//使用$.post方式 
                $.post(
                    url,        //服务器要接受的url
                    params,     //传递的参数 
                    function(data){ //服务器返回后执行的函数参数 data保存的就是服务器发送到客户端的数据    
                        
                        var member = eval("("+data+")");    //包数据解析为json格式  
                        if(member.name=="NO"){
                        	//alert("该类别已经存在");
                        	$("#text").html('<font color="#eaf0f00;">该类别已经存在!</font>');
                        } else {
                            window.location.href="addKindAction?kind.kindName="+
                            		 encodeURI(encodeURI($("#kindName").val()))+
                            		 "&kind.pkind.pkindId="+<%=pkindId %>;
                        }
                    },
                    'json'  //数据传递的类型  json
                );
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
        <div class="result-wrap">
            <div class="result-content">
             

     
                    <table class="insert-tab" width="100%">
                        <tbody>
                            <tr>
                                <th><i class="require-red">*</i>二级类别名称:</th>
                                <td>
                                    <input class="common-text " id="kindName" name="kind.kindName" size="50"  type="text">
                                    <span id="text"></span>
                                </td>
                               
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="my_button" type="submit" id="btn" value="添加">
                                    <input class="my_button" onClick="history.go(-1)" value="取消" type="button">
                                </td>
                            </tr>
                        </tbody></table>
            </div>
        </div>
      </div>
   </div>
 </div>
  
  
  

 
 
  
  </body>
</html>
