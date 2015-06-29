<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>åå°ç®¡ç_ç»å½</title>
	<link href="../CSS/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

  </head>
  
  <body>
    <div >
    	      <h4 align="center"  class="my_title">ä¿®æ¹å¯ç </h4>
    		   <form>
    			 
		   			 
		   			   <div align="center" >
		   			     <input type="text"  class="my_password" placeholder="å§å">
	   			       </div>
		   			 
		    			<div>
		    			  <div align="center">
		    			    <input type="text"  class="my_password" placeholder="çµè¯">
	    			      </div>
		    			</div>
		    			<div>
		    			  <div align="center">
		    			    <input type="password"  class="my_password" placeholder="å¯ç " > 
	    			      </div>
		    			</div>
						<div>
						  <div align="center">
						    <input TYPE="password" class="my_password" placeholder="éæ°è¾å¥å¯ç " >
					      </div>
						</div>
		    	
				 <div align="center">
		         <button  class="grey">ä¿å­</button>   
		         <button  class="grey" onClick="history.go(-1)">è¿å</button>
		         <p class="terms">ä¸æ¦æ³¨åï¼è¡¨ææ¨å·²ç»éè¯»å¹¶åæ <a href="#">ç¨æ·åè®®</a>.</p>
				 </div>
		         <div class="clear"></div>
		    </form>
    	  </div> 

  </body>
</html>
