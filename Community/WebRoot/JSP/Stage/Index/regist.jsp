<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Stage/refrence.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>注册</title>
    <script type="text/javascript">
    $(document).ready( function() {
    	var valiCheck=[0,0,0,0,0];
    	function test(){
    		var count=0;
    		for ( var i=0 ; i < valiCheck.length ; ++i ) 
    			count += valiCheck[i];
   			if(count==5) return true;
   			else return false;
    	}
    	$("#regbtn").click(function(){
    		if(test()){ 
    			regform.action="cusLoginAction_Regist";
    			regform.submit();
    		}
    		else alert("请正确完整填写");
    	});
    	$(".vali").hide();
    	$("[name='customer.tel']").blur(function(){
    		if($("[name='customer.tel']").val() != ""){
            	$("#rtel").hide();
              	valiCheck[0] = 1;
           	}else{
           		$("#rtel").show();
              	valiCheck[0] = 0;
           	}
    	});
    	$("[name='customer.passwd']").blur(function(){
    		if($("[name='customer.passwd']").val() != ""){
            	$("#rpwd").hide();
              	valiCheck[1] = 1;
           	}else{
           		$("#rpwd").show();
              	valiCheck[1] = 0;
           	}
    	});
    	$("[name='crepwd']").blur(function(){
    		if($("[name='crepwd']").val() != ""){
            	$("#rrepwd").hide();
            	if($("[name='customer.passwd']").val()==$("[name='crepwd']").val()){
	           		$("#rtwice").hide();
	           		valiCheck[2] = 1;
	           	}else{
	           		$("#rtwice").show();
	              	valiCheck[2] = 0;
	           	}
           	}else {
           		$("#rrepwd").show();
              	valiCheck[2] = 0;
            }
    	});
    	$("#uid").blur(function(){
            var url = "cusLoginAction_Validate";
            var params = {
            	checkName:$("#uid").val()
            };
            if($("#uid").val() != ""){
            	$("#rname").hide();
                $.post(
                    url,        //服务器要接受的url
                    params,     //传递的参数 
                    function(data){ //服务器返回后执行的函数参数 data保存的就是服务器发送到客户端的数据    
                        
                        var member = eval("("+data+")");    //包数据解析为json格式  
                        if(member.name=="NONE"){
                        	$("#named").hide();
                          	valiCheck[3] = 1;
                        }
                        if(member.name=="DONE"){
                        	$("#named").show();
                          	valiCheck[3] = 0;
                        } 
                    },
                    'json'  //数据传递的类型  json
                );
            }
            else{
            	$("#rname").show();
              	valiCheck[3] = 0;
            }
        });
        $("[name='customer.name']").blur(function(){
        	if($("[name='customer.name']").val() != ""){
            	$("#uname").hide();
              	valiCheck[4] = 1;
           	}else{
           		$("#uname").show();
              	valiCheck[4] = 0;
           	}
        });
    });
    </script>
    <link href="<%=basePath%>CSS/css/css_l.css" rel="stylesheet" type="text/css"  />
  </head>
  
  <body>
  	<div class="header-top">
		<div class="wrap"> 
			<div class="logo">
				<a href="index.html"><img src="<%=basePath %>images/logo.png" alt=""/></a>
	    	</div>
		    <div align="right">
			   <ul>
				 <li><a href="<%=basePath%>JSP/Stage/Index/login.jsp">登录</a></li> 
			   </ul>
			</div>
			<div class="clear"></div>
 		</div>
   </div>
   <div class="header-bottom">
   		<div class="wrap">
		   <div class="clear"></div>
     	</div>
   </div>
   <div >
   <div style="width:1280px;maegin-left:auto;margin-right:auto;"> 
		<h4 align="center" class="my_title">注册新用户</h4>
		   <form name="regform" method="post">
			 	<div>
			 		
	 			   		<div  style="margin-left:450px">
	 			     		<input class="my_password" id="uid" type="text" placeholder="用户名" name="customer.userId"/>
	 			     		<span id="rname" class="vali">请填写用户名</span>
	 			     		<span id="named" class="vali">用户名已存在</span>
				       </div>
	 			 
	 			 	
	 			   		<div style="margin-left:450px">
	 			     		<input class="my_password" type="text" placeholder="姓名" name="customer.name"/>
	 			     		<span id="uname" class="vali">请填写姓名</span>
				       </div>
	 			 	
	  				
			  			<div style="margin-left:450px">
			  			    <input class="my_password" type="text" placeholder="电话" name="customer.tel"/>
			  			    <span id="rtel" class="vali">请填写电话</span>
			 			</div>
	  				
		  			
			  			  <div style="margin-left:450px">
			  			    	<input class="my_password" type="password"  placeholder="密码" name="customer.passwd"/>
			  			    	<span id="rpwd" class="vali">请填写密码</span> 
			 			  </div>
		  			
					
						  <div style="margin-left:450px">
						    	<input class="my_password" type="password"  placeholder="重新输入密码" name="crepwd"/>
						    	<span id="rrepwd" class="vali">请填写确认密码</span>
						    	<span id="rtwice" class="vali">两次密码不一致</span>
					      </div>
					
  	 			</div>
				 <div align="center">
				 	   <button class="my_button" id="regbtn" onclick="return false;">注册</button>
				 	   <input type="button" class="my_button" onclick="history.go(-1);" value="取消">
				 	   
				       <p class="terms">一旦注册，表明您已经阅读并同意 <a href="#">用户协议</a>.</p>
				 </div>
       			<div class="clear"></div>
  			</form>
  			</div>
    </div>
		<div style="position:fixed;left:0px;bottom:0px;width:100%;">
        <div class="footer">
       	  <div class="footer-top">
       		<div class="wrap">
				  <div class="clear"></div>
			 </div>
       	 </div>
       	 <div class="copy">
       	   <div class="wrap">
       	   	  <p>Copyright &copy; 2014.Company name All rights reserved.</p>
       	   </div>
       	 </div>
       </div>
	 </div>
	 
	 
	 
	 
	 
  </body>
</html>
