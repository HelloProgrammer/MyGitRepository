<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Stage/refrence.jsp" %>
<%
String path = request.getContextPath();
String picPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>购物大厅</title>
	<script type="text/javascript">
		$(document).ready(function(){
			window.onload=function(){
				$("body").load("catAction_showShop");
			};
		});
	</script>
</head>
  
<body>








	<!-- 页首 -->
    <jsp:include page="Part/header.jsp"></jsp:include>
       <div style="padding-top:15px; margin-bottom:8px; height:72px; width:100%; padding-left:10%;">
       		<div style="float:left; margin-right:10%; height:38px;" >
            	<span style="font-family: 'Microsoft YaHei'; font-size: 25px; line-height:-1;">金海湾社区</span>
                <select name="cars"> 
                <option value="volvo">社区1</option> 
                <option value="saab">社区2</option> 
                <option value="fiat">社区3</option> 
                <option value="audi">社区4</option> 
                </select> 
            </div>
       	    <div class="search-boxes" style="float:left">
            <div class="search-content"><input name="" type="text" value="Search" onfocus="if (this.value =='Search'){this.value ='';}" onblur="if (this.value == '') {this.value = 'Search';}"/></div><!--搜索框-->
            <div class="search-button"><input name="" type="button" value="搜索" /></div><!--搜索按钮-->
            </div>
	   </div>					
       <div class="clear"></div>
       <div style="width:100%; line-height:40px; margin-bottom:-3%">
       		<div style="margin-left:5%; width:150px">
            	<span style="font-size: 25px;font-family: 'microsoft yahei';">休闲鞋</span>
                <hr/>
            </div>
       		
       </div>
       <div class="login">
         	<div class="wrap">
         	<!-- 详细筛选 -->
     	    <jsp:include page="Part/slider.jsp"></jsp:include>
			<div class="cont span_2_of_3">
		  		<div class="mens-toolbar">
              		<div class="sort">
               			<div class="sort-by">
		            		<label>Sort By</label>
		            		<select>
		                            <option value="">Popularity</option>
		                            <option value="">Price : High to Low</option>
		                            <option value="">Price : Low to High</option>
		            		</select>
		            		<a href=""><img src="<%=basePath %>images/arrow2.gif" alt="" class="v-middle"></a>
               			</div>
    				</div>
		          	<div class="pager">
			       		<ul class="dc_pagination dc_paginationA dc_paginationA06">
						    <li><a href="#" class="previous">Pages</a></li>
						    <li><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
					  	</ul>
			   			<div class="clear"></div>
		    		</div>
     	    		<div class="clear"></div>
       			</div>
	       		<s:iterator value="gslist" status="st">
	       			<s:if test="#st.count%3==1">
	       				<%out.println("<div class='box1'>"); %> 
	       			</s:if>
	       				<div class="col_1_of_single1 span_1_of_single1">
							<a href='singleAction_showSingle?goodid=<s:property value="goodId"/>'>
						    	<div class="view1 view-fifth1">
						  	 		<div class="top_box">
								  		<h3 class="m_1"><s:property value="name"/></h3>
								  		<p class="m_2">Lorem ipsum</p>
							         	<div class="grid_img">
									   		<div class="css3"><img src='<%=picPath %><s:property value="picture"/>' width="220px" height="220px" alt=""/></div>
								          	<div class="mask1">
				                       			<div class="info">Quick View</div>
						                  	</div>
				                    	</div>
			                       		<div class="price">¥<s:property value="price"/></div>
							   		</div>
							    </div>
							   	<span class="rating1">销量：<s:property value="saleNum"/></span>
								 	<ul class="list2">
								  		<li>
								  			<img src="<%=basePath %>images/plus.png" alt=""/>
								  			<ul class="icon1 sub-icon1 profile_img">
									  			<li><span class="active-icon c1">详情</span>
									 			</li>
									 		</ul>
								   		</li>
							     	</ul>
					    	    <div class="clear"></div>
					    	</a>
				    	</div>
	       			<s:if test="#st.count%3==1">
	       				<%out.println("</div>"); %> 
	       			</s:if>
	       		</s:iterator>
		  </div>
			  	<div class="clear"></div>
		  </div>
	  </div>
	  <!-- 页脚 -->
	  <jsp:include page="Part/footer.jsp"></jsp:include>
  </body>
</html>