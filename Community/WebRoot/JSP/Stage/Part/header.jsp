<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 页首 -->
<div class="header-top">
	<div class="wrap"> 
		<div class="logo">
			<a href="<%=basePath %>/JSP/Stage/cat.jsp"><img src="" alt=""/></a>
	  	</div>
	    <div style="float:left; margin-top:11px; height:22px; margin-left:8%">
	     	<span>环翠区</span>
	         <select>
	         	<option>市区1</option>
	             <option>市区2</option>
	             <option>市区3</option>
	         </select>
	    </div>
	  	<div class="cssmenu" style="float:right;">
	   		<ul>
		 		 <li><a href="<%=basePath %>JSP/Stage/Index/regist.jsp">注册</a></li> 
				 <li><a href="catAction_showShop">购物大厅</a></li> 
				 <li><a href="<%=basePath %>JSP/Stage/Index/login.jsp">重新登录</a></li>
				 <li><a href="<%=basePath %>orderAction_getPersonalOrder">个人中心</a></li> 
				 <li><a href="showAllCartByUserAction">查看购物车</a></li>
<!-- 	            <li><a href="ordercenter.html">我的订单</a></li>  -->
	   		</ul>
		</div>
		<ul class="icon2 sub-icon2 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon2 list">
					<li><h3>许可证</h3><a href=""></a></li>
					<li><p><a href="">营销许可证</a> <a href="">三级食品安全证</a> <a href="">优秀网店证书</a></p></li>
				</ul>
			</li>
		</ul>
		<div class="clear"></div>
	</div>
</div>
<div class="header-bottom">
 	<div class="wrap">
 		<!-- start header menu -->
	<ul class="megamenu skyblue">
	    <li><a class="color1" href="#">Home</a></li>
		<li class="grid"><a class="color2" href="#">Men</a>
			<div class="megapanel">
				<div class="row">
					<div class="col1">
						<div class="h_nav">
							<h4>popular</h4>
							<ul>
								<li><a href="shop.html">new arrivals</a></li>
								<li><a href="shop.html">men</a></li>
								<li><a href="shop.html">women</a></li>
								<li><a href="shop.html">accessories</a></li>
								<li><a href="shop.html">kids</a></li>
								<li><a href="shop.html">login</a></li>
							</ul>	
						</div>
						<div class="h_nav">
							<h4 class="top">men</h4>
							<ul>
								<li><a href="shop.html">new arrivals</a></li>
								<li><a href="shop.html">men</a></li>
								<li><a href="shop.html">women</a></li>
								<li><a href="shop.html">accessories</a></li>
								<li><a href="shop.html">kids</a></li>
								<li><a href="shop.html">style videos</a></li>
							</ul>	
						</div>
					</div>
					<div class="col1">
						<div class="h_nav">
							<h4>style zone</h4>
							<ul>
								<li><a href="shop.html">men</a></li>
								<li><a href="shop.html">women</a></li>
								<li><a href="shop.html">accessories</a></li>
								<li><a href="shop.html">kids</a></li>
								<li><a href="shop.html">brands</a></li>
							</ul>	
						</div>							
					</div>
					<div class="col1"></div>
					<div class="col1"></div>
					<div class="col1"></div>
					<div class="col1"></div>
					<img src="<%=basePath %>images/nav_img.jpg" alt=""/>
			</div>
		</div>
		</li>
			   <li class="active grid"><a class="color4" href="#">Women</a>
		<div class="megapanel">
			<div class="row">
				<div class="col1">
					<div class="h_nav">
						<h4>shop</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">brands</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>help</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>my company</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>												
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>account</h4>
						<ul>
							<li><a href="shop.html">login</a></li>
							<li><a href="shop.html">create an account</a></li>
							<li><a href="shop.html">create wishlist</a></li>
							<li><a href="shop.html">my shopping bag</a></li>
							<li><a href="shop.html">brands</a></li>
							<li><a href="shop.html">create wishlist</a></li>
						</ul>	
					</div>						
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>popular</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
				<div class="col1">
				 <div class="h_nav">
				   <img src="<%=basePath %>images/nav_img1.jpg" alt=""/>
				 </div>
				</div>
			</div>
			<div class="row">
				<div class="col2"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
			</div>
			</div>
	 			</li>				
		<li><a class="color5" href="#">Kids</a>
		<div class="megapanel">
			<div class="row">
				<div class="col1">
					<div class="h_nav">
						<h4>popular</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">login</a></li>
						</ul>	
					</div>
					<div class="h_nav">
						<h4 class="top">man</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>style zone</h4>
						<ul>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">brands</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<img src="<%=basePath %>images/nav_img2.jpg" alt=""/>
			</div>
		</div>
		</li>
		<li><a class="color6" href="#">Sale</a>
		<div class="megapanel">
			<div class="row">
				<div class="col1">
					<div class="h_nav">
						<h4>shop</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">brands</a></li>
						</ul>	
					</div>	
					<div class="h_nav">
						<h4 class="top">my company</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>												
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>man</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>						
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>help</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>account</h4>
						<ul>
							<li><a href="shop.html">login</a></li>
							<li><a href="shop.html">create an account</a></li>
							<li><a href="shop.html">create wishlist</a></li>
							<li><a href="shop.html">my shopping bag</a></li>
							<li><a href="shop.html">brands</a></li>
							<li><a href="shop.html">create wishlist</a></li>
						</ul>	
					</div>						
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>my company</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>popular</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col2"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
			</div>
		</div>
		</li>
		<li><a class="color7" href="#">Customize</a>
		<div class="megapanel">
			<div class="row">
				<div class="col1">
					<div class="h_nav">
						<h4>shop</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">brands</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>help</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>my company</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>												
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>account</h4>
						<ul>
							<li><a href="shop.html">login</a></li>
							<li><a href="shop.html">create an account</a></li>
							<li><a href="shop.html">create wishlist</a></li>
							<li><a href="shop.html">my shopping bag</a></li>
							<li><a href="shop.html">brands</a></li>
							<li><a href="shop.html">create wishlist</a></li>
						</ul>	
					</div>						
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>my company</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>popular</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col2"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
			</div>
	 				</div>
		</li>
		<li><a class="color8" href="#">Shop</a>
		<div class="megapanel">
			<div class="row">
				<div class="col1">
					<div class="h_nav">
						<h4>style zone</h4>
						<ul>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">brands</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>popular</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">login</a></li>
						</ul>	
					</div>
					<div class="h_nav">
						<h4 class="top">man</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
			</div>
		</div>
		</li>
		<li><a class="color9" href="#">Football</a>
		<div class="megapanel">
			<div class="row">
				<div class="col1">
					<div class="h_nav">
						<h4>shop</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">brands</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>help</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>							
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>my company</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>												
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>account</h4>
						<ul>
							<li><a href="shop.html">login</a></li>
							<li><a href="shop.html">create an account</a></li>
							<li><a href="shop.html">create wishlist</a></li>
							<li><a href="shop.html">my shopping bag</a></li>
							<li><a href="shop.html">brands</a></li>
							<li><a href="shop.html">create wishlist</a></li>
						</ul>	
					</div>						
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>my company</h4>
						<ul>
							<li><a href="shop.html">trends</a></li>
							<li><a href="shop.html">sale</a></li>
							<li><a href="shop.html">style videos</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
				<div class="col1">
					<div class="h_nav">
						<h4>popular</h4>
						<ul>
							<li><a href="shop.html">new arrivals</a></li>
							<li><a href="shop.html">men</a></li>
							<li><a href="shop.html">women</a></li>
							<li><a href="shop.html">accessories</a></li>
							<li><a href="shop.html">kids</a></li>
							<li><a href="shop.html">style videos</a></li>
						</ul>	
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col2"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
				<div class="col1"></div>
			</div>
		</div>
		</li>
		<li><a class="color10" href="#">Running</a></li>
		<li><a class="color11" href="#">Originals</a></li>
		<li><a class="color12" href="#">Basketball</a></li>
	  </ul>
  	<div class="clear"></div>
  	</div>
</div>

