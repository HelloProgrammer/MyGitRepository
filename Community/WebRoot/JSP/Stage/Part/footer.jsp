<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 页脚 -->
<div class="footer">
	<div class="footer-top">
    	<div class="wrap">
      		<div class="col_1_of_footer-top span_1_of_footer-top">
				<ul class="f_list">
			  		<li><img src="<%=basePath %>images/f_icon.png" alt=""/><span class="delivery">多仓直发 极速配送</span></li>
			  	</ul>
			</div>
			<div class="col_1_of_footer-top span_1_of_footer-top">
			  	<ul class="f_list">
			  	 	<li><img src="<%=basePath %>images/f_icon1.png" alt=""/><span class="delivery">服务热线:<span class="orange"> (800) 000-2587 (freephone)</span></span></li>
			  	 </ul>
			</div>
			<div class="col_1_of_footer-top span_1_of_footer-top">
			  	<ul class="f_list">
			  	 	<li><img src="<%=basePath %>images/f_icon2.png" alt=""/><span class="delivery">正品行货 精致服务</span></li>
			  	 </ul>
			</div>
			<div class="clear"></div>
		 </div>
     </div>
       	    
       	 
     <div class="copy">
     	<div class="wrap">
     		<p>Copyright &copy; 2014.Company name All rights reserved.</p>
     	</div>
	</div>
</div>
       
<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
