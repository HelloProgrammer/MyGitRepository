<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path_menu_p = request.getContextPath();
String basePath_menu_p = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_menu_p+"/";
%>
<base href="<%=basePath_menu_p%>">


    <div class="sidebar-wrap">

        <div class="sidebar-content">
            <ul id="faq" class="sidebar-list">
			
			
				
					<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe001;</i>订单处理</a></dt>
				   
                       
                       <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu_p%>orderAction_getPersonUnsolveOrder" ><i class="icon-font">&#xe005;</i>商家未处理订单</a></div>
					   </dd>
					    <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu_p%>orderAction_getPersonAcceptOrder" ><i class="icon-font">&#xe005;</i>商家接受订单</a></div>
					   </dd>
					    <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu_p%>orderAction_getPersonRefuseOrder" ><i class="icon-font">&#xe005;</i>已拒绝订单</a></div>
					   </dd>
					   <dd>
					       <div align="center" class="my_right_bar_div"><a href="<%=basePath_menu_p%>orderAction_getPersonFinishOrder" ><i class="icon-font">&#xe005;</i>已完成订单</a></div>
					   </dd>
				  		
				</dl>
                </li>
				
				<li>
				<dl>
                   <dt> <a href="javascript:;"><i class="icon-font">&#xe003;</i>个人信息管理</a></dt>
				   
                       <dd>
                         <div align="center"  class="my_right_bar_div" ><a href="javascript:;" ><i class="icon-font">&#xe005;</i>查看个人信息</a></div>
                       </dd>
                       <dd>
					       <div align="center" class="my_right_bar_div"><a href="javascript:;" ><i class="icon-font">&#xe005;</i>修改密码</a></div>
					   </dd>
				   
				</dl>
                </li>
				
				
				
            </ul>
        </div>
    </div>