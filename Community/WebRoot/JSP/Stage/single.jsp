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
  	<title>商品详情</title>
  	<script type="text/javascript">
  	  $(document).ready(function(){
  		$("#addcartbtn").click(function(){
  			alert("购物车添加成功,您可以浏览其他商品");
  			$("#cgNum").val($("#dynamnum").val());
  			cartaddform.action="addCartAction";
  			cartaddform.submit();
  		});
  	  });
  	</script>
  </head>
  
  <body>
    <jsp:include page="Part/header.jsp"></jsp:include>
    
    <div class="single">
         <div class="wrap">
     	    <jsp:include page="Part/slider.jsp"></jsp:include>
			<div class="cont span_2_of_3">
			  <div class="labout span_1_of_a1">
				<!-- start product_slider -->
				     <ul id="etalage">
						<li>
							<img class="etalage_thumb_image" src='<%=picPath %><s:property value="singleGood.picture"/>'/>
							<img class="etalage_source_image" src='<%=picPath %><s:property value="singleGood.picture"/>'/>
						</li>
						<li>
							<img class="etalage_thumb_image" src="<%=basePath %>images/t1.jpg" />
							<img class="etalage_source_image" src="<%=basePath %>images/t1.jpg" />
						</li>
					</ul>
			<!-- end product_slider -->
			</div>
			<div class="cont1 span_2_of_a1">
				<h3 class="m_3"><s:property value="singleGood.name"/></h3>
				<p class="m_desc"><s:property value="singleGood.des"/></p>
				<div class="price_single">
<!-- 							  <span class="reducedfrom">$66.00</span> -->
							  <span class="actual">¥<s:property value="singleGood.price"/> </span>
							</div>
				<ul class="options">
					<h4 class="m_9">尺码</h4>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<div class="clear"></div>
				</ul>
                <br/>
                <ul class="options">
					<h4 class="m_9">颜色</h4>
					<li><a href="#">红</a></li>
					<li><a href="#">黄</a></li>
					<li><a href="#">蓝</a></li>
					<li><a href="#">白</a></li>
					<div class="clear"></div>
				</ul>
                <br/>
                <ul class="options">
					<h4 class="m_9">预留</h4>
                    <li><a href="#">空</a></li>
					<div class="clear"></div>
				</ul>
                <br/>
                <ul class="options">
					<h4 class="m_9">数量</h4>
					<li><a id="redulink" href="javascript:;">-</a></li>
					<li><input id="dynamnum" type="text" value="1" style="width:33px; text-align:center"/></li>
					<li><a id="addlink" href="javascript:;">+</a></li>
					<div class="clear"></div>
				</ul>
				<div class="btn_form">
                    <form action="findGoodByIdAction" method="post" style="float:left;margin-right:9px">
                    	<input type="text" hidden="hidden" name="good.goodId" value='<s:property value="singleGood.goodId"/>'/>
                    	<input id="gsNum" type="text" hidden="hidden" name="goodNum" value="1"/>
                        <input type="submit" value="立即购买" />
                    </form>
                	<form name="cartaddform" method="post" style="float:left;margin-right:9px">
                	    <input id="agId" type="text" hidden="hidden" name="cart.good.goodId" value='<s:property value="singleGood.goodId"/>'/>
                    	<input id="cgNum" type="text" hidden="hidden" name="cart.num"/>
                    	<input id="addcartbtn" type="submit" value="加入购物车"/>
                    </form>
				</div>
    			
    			
			</div>
			<div class="clear"></div>
     
     
         <ul id="flexiselDemo3">
			<li><img src="<%=basePath %>images/pic11.jpg" /><div class="grid-flex"><a href="#">Bloch</a><p>Rs 850</p></div></li>
			<li><img src="<%=basePath %>images/pic10.jpg" /><div class="grid-flex"><a href="#">Capzio</a><p>Rs 850</p></div></li>
			<li><img src="<%=basePath %>images/pic9.jpg" /><div class="grid-flex"><a href="#">Zumba</a><p>Rs 850</p></div></li>
			<li><img src="<%=basePath %>images/pic8.jpg" /><div class="grid-flex"><a href="#">Bloch</a><p>Rs 850</p></div></li>
			<li><img src="<%=basePath %>images/pic7.jpg" /><div class="grid-flex"><a href="#">Capzio</a><p>Rs 850</p></div></li>
		 </ul>
	    
	 <div class="toogle">
     	<div>
        	<a id="cbtn" href="javascript:;"><div class="sinmenu"><h3 class="m_3">商品简介</h3></div></a>
            <a id="ebtn" href="javascript:;"><div class="sinmenu"><h3 class="m_3">评价</h3></div></a>
        </div>
     	<div class="clear"></div>
     </div>				
     	
	 <div id="Commodity_introduction" class="toogle">
     	<div class="com_in">
            <div>
                <div>品牌名称：Peak/匹克</div>
                <div>
                    <p>产品参数：</p>
                    <ul class="ginfo">
                        <li title="Peak/匹克 E42005E">产品名称：Peak/匹克 E42005E</li>
                        <li title="&nbsp;和平绿&nbsp;浅灰/中灰&nbsp;磁石灰/酸绿">颜色分类:&nbsp;和平绿&nbsp;浅灰/中灰</li>
                        <li title="&nbsp;E42005E">款号:&nbsp;E42005E</li>
                        <li id="J_attrBrandName" title="&nbsp;Peak/匹克">品牌:&nbsp;Peak/匹克</li>
                        <li title="&nbsp;2014年夏季">上市时间:&nbsp;2014年夏季</li>
                        <li title="&nbsp;239">吊牌价:&nbsp;239</li>
                        <li title="&nbsp;男子">性别:&nbsp;男子</li>
                        <li title="&nbsp;低帮">鞋帮高度:&nbsp;低帮</li>
                        <li title="&nbsp;网布">帮面材质:&nbsp;网布</li>
                        
                    </ul>
                    <div style="clear:both"></div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <br/>
        <div class="com_pic">
     	<p class="m_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>
     </div>
     </div>
     <div class="clear"></div>
     <!--Commodity_introduction end-->
     <div id="Evaluation" class="toogle">
     	<div>
        	<div>
            	<ul>
                	<li style="width:59%"><div>评价心得</div></li>
                    <li style="width:22%"><div>购买时间</div></li>
                    <li style="width:15%"><div>评论者</div></li>
                </ul>
            </div>
            <div class="clear"></div>
        	<div>
            	<table>
            		<s:iterator value="commentList" id="comme" status="stu">
            			<tr>
	                    	<td width="60%">
	                        	<div><s:property value="#comme.comment"/></div>
	                        </td>
	                        <td width="25%">
	                        	<div>
	                            	<s:property value="%{commentatorList[#stu.index].date}"/>
	                            </div>
	                        </td>
	                        <td width="15%">
	                        	<div><s:property value="%{commentatorList[#stu.index].customer.userId}"/></div>
	                        </td>
	                    </tr>
            		</s:iterator>
                </table>
            </div>
        </div>
        
        </div>
        <!--Evaluation end-->
     </div>
     </div>
     <div class="clear"></div>
	 </div>
    
    <jsp:include page="Part/footer.jsp"></jsp:include>
    <s:debug></s:debug>
  </body>
</html>
