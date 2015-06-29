<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/JSP/Common/common.jsp" %>
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
        	myform.action="delSelectpKindsAction";
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
                    <table class="search-tab">
                        <tr>
                           
                            <td><a href="<%=basePath%>JSP/BackStage/GoodKind/pkind_add.jsp"><input class="my_button" value="添加一级种类" type="button"></input></a></td>
                        </tr>                
                    </table>
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
						    <!-- <th width="110px">种类ID</th> -->
                            <th width="200px">种类名称</th>
                            <th width="210px">操作</th>
                        </tr>
                        <tbody id="group_one">
      <s:iterator value="pkinds" id="sid">
        <tr>
           <td class="tc" ><input class="allChoose" name="checkname" type="checkbox" value="${sid.pkindId}"></td>
         <%--  <td><a href="listKindByPkindIdAction?kind.pkind.pkindId=<s:property value="pkindId"/>"><s:property value="pkindId"/></a></td> --%>
          <td><a href="listKindByPkindIdAction?kind.pkind.pkindId=<s:property value="pkindId"/>"><s:property value="pkindName"/></a></td>
          <td><a href="deletePkindAction?pkind.pkindId=${pkindId}">删除</a>
          <a href="onePkindAction?pkind.pkindId=${pkindId}">修改</a></td>
        </tr>
      </s:iterator>
      </tbody>
                    </table>
                       
                    <div align="left"> 
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
