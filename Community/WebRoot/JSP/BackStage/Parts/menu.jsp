<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path_menu = request.getContextPath();
String basePath_menu = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_menu+"/";
%>
<base href="<%=basePath_menu%>">

	

<form name="indexForm" method="post" enctype="multipart/form-data">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul id="faq" class="sidebar-list">
			
			
				
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe001;</i>订单处理</a></dt>
				   
                       <dd>
                         <div align="center"  class="my_right_bar_div" ><a href="<%=basePath_menu%>orderAction_getUnsolveOrder?STATE=1" ><i class="icon-font">&#xe005;</i>待处理订单</a></div>
                       </dd>
                       <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>orderAction_getAcceptOrder?STATE=2"><i class="icon-font">&#xe005;</i>已接受订单</a></div>
					   </dd>
					    <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>orderAction_getRefuseOrder?STATE=3"><i class="icon-font">&#xe005;</i>已拒绝订单</a></div>
					   </dd>
					    <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>orderAction_getFinishOrder?STATE=4"><i class="icon-font">&#xe005;</i>已完成订单</a></div>
					   </dd>
				  		
				</dl>
                </li>
                
                <li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe001;</i>销量统计</a></dt>
				   
                       <dd>
                         <div align="center"  class="my_right_bar_div" ><a href="<%=basePath_menu%>goodcountAction_getAllGood" ><i class="icon-font">&#xe005;</i>查看统计</a></div>
                       </dd>
				  		
				</dl>
                </li>
				
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe003;</i>商品管理</a></dt>
				   
                       <dd>
                         <div align="center"  class="my_right_bar_div" ><a href="<%=basePath_menu%>goodAction_getAllGood" ><i class="icon-font">&#xe005;</i>商品列表</a></div>
                       </dd>
                       <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>JSP/BackStage/GoodManage/goods_add.jsp" ><i class="icon-font">&#xe005;</i>添加商品</a></div>
					   </dd>
				   
				</dl>
                </li>
				
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe003;</i>商品类别管理</a></dt>
				   
                       <dd>
                         <div align="center"  class="my_right_bar_div" ><a href="<%=basePath_menu%>listPkindAction" ><i class="icon-font" >&#xe008;</i>查看一级商品类别</a></div>
                       </dd>
                       <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>JSP/BackStage/GoodKind/pkind_add.jsp"><i class="icon-font">&#xe005;</i>增加一级商品类别</a></div>
					   </dd>
					   
				   
				</dl>
                </li>
				
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe003;</i>区域分销商管理</a></dt>
                       <dd>
                          <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>warehouseAction_getAllWarehouse"><i class="icon-font">&#xe008;</i>查看分销商</a></div>
                       </dd>
                       <dd>
					      <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>JSP/BackStage/WareHouse/warehouse_add.jsp"><i class="icon-font">&#xe005;</i>增加分销商</a></div>
					   </dd>
				   
				</dl>
                </li>
				
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe003;</i>社区管理</a></dt>
				  
                       <dd>
                         <div align="center"  class="my_right_bar_div" ><a href="<%=basePath_menu%>shopAction_getAllShop"><i class="icon-font" >&#xe008;</i>查看社区</a></div>
                       </dd>
                       <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>JSP/BackStage/Shop/shop_add.jsp"><i class="icon-font">&#xe005;</i>增加社区</a></div>
					   </dd>
				  
				</dl>
                </li>
				
				
		
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe006;</i>系统管理</a></dt>
				   
                       <dd>
                         <div align="center"  class="my_right_bar_div" ><a href="<%=basePath_menu%>JSP/BackStage/system.html"><i class="icon-font">&#xe017;</i>系统设置</a></div>
                       </dd>
                       <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>JSP/BackStage/system.html"><i class="icon-font">&#xe037;</i>清理缓存</a></div>
					   </dd>
					   <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>JSP/BackStage/system.html"><i class="icon-font">&#xe046;</i>数据备份</a></div>
					   </dd>
					   <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu%>JSP/BackStage/system.html"><i class="icon-font">&#xe045;</i>数据还原</a></div>
					   </dd>
				   
				</dl>
                </li>
				
            </ul>
        </div>
    </div>
</form>
