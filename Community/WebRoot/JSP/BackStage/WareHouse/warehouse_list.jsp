<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		var flag = false;//复选框标志位
   		function deleSelect()
   		{
   			var delValue="";
   			var flag=false; 
    		var de= document.getElementsByName("checkname"); 
    		for(i=0;i<de.length;i++) 
       		{ 
        		if(de[i].checked)
        		{ 
                	delValue+=","+de[i].value; 
                	flag = true; 
       			} 
    		} 
    	    if(flag==false) 
        	{ 
        		alert("至少选择一个待删除记录"); 
        		return false; 
        	} 
        	myform.action="warehouseAction_delSelectWarehouse";
        	myform.submit; 
  		}
  		function selectAll()
  		{  		    
  			var de= document.getElementsByName("checkname"); 
  			if(!flag)//第一次点击全选上
  			{
	  			for(i=0;i<de.length;i++) 
	       		{         			       			
	       			de[i].checked = true;	       			
	    		}
	    		flag = true; 
  			}
  			else//第二次点击全不选
  			{
  				for(i=0;i<de.length;i++) 
	       		{ 	        		       			
	       			de[i].checked = false;       			
	    		}
	    		flag = false;		
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
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                           
                            <td><a href="JSP/BackStage/WareHouse/warehouse_add.jsp"><input class="my_button" value="增加区域分销商" type="button"></input></a></td>
                        </tr>                
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a id="batchDel" ><i class="icon-font"></i><label for="lalala" style="cursor:pointer">批量删除</label></a>
                        <s:submit  name="delselect"  onclick="deleSelect()"  id="lalala" style="display:none" />
                    </div>
                </div>
                <div class="result-content">
    
      
                    <table id="table_page" class="my_result-tab"   >
                        <tr>
						    <th class="tc" width="60px"><input class="allChoose" name="allcheck" type="checkbox" onclick="selectAll()">全选</th>
						    <th width="110px">ID</th>
                            <th width="160px">名称</th>
                            <th width="200px">地址</th>
                            <th width="110px">负责人</th>
                            <th width="130px">联系方式</th>
                            <th width="210px">操作</th>
                        </tr>
                        <tbody id="group_one">
      <s:iterator value="warehouses" id="sid">
        <tr>
         <td class="tc" ><input class="allChoose" name="checkname" type="checkbox" value="${sid.warehouseId}"></td>
          <td><s:property value="warehouseId" /></td>
          <td><s:property value="name"/></td>
          <td>
          <div class="ttt">
              <a><span>
                  <s:property value="address"  />
                  <ul class="my_icon2">
			          <li><a class="active-icon c2" href="javascript:;"> </a>
				      <ul class="sub-my_icon2 list">
					      <li><h3><s:property value="address"  /></h3><a href="javascript:;"></a></li>
				      </ul>
			          </li>
		          </ul>
              </span></a>
          </div>
          
		</td>
          <td><s:property value="managerName"/></td>
          <td><s:property value="tel"/></td>
          <td><a href="warehouseAction_deleteWarehouse?warehouse.warehouseId=${warehouseId}">删除</a>
          <a href="warehouseAction_getOneWarehouse?warehouse.warehouseId=${warehouseId}">修改</a></td>
        </tr>
      </s:iterator>
      </tbody>
                    </table>
                       
                    <div align="center"> 
                     <table>
						<tr>
						<td><a href="javascript:;" onclick="page.firstPage()">首页</a>——</td>
						<td><a href="javascript:;" onclick="page.prePage();">上一页</a>-</td>
						<td><a  id="my_iPageIndex"></a>-</td>
						<td><a href="javascript:;" onclick="page.nextPage();">下一页</a>——</td>
						<td>共-<a href="javascript:;" id="PageCount"></a>-页——</td>
						<td><a  href="javascript:;" onclick="page.aimPage()">转到</a>第<input type="text" id="current_page" style="text-align:center;width:40px;" />页</td>
						<td><span id="pageindex"></span></td></tr></table>
                    </div>
                </div>
            </form>
        </div>
         </div>
    </div>
        
  
 </div>
 
 
 
 

  </body>
</html>
