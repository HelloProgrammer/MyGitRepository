<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="<%=path%>/CSS/css/css_l.css"/>
    <script type="text/javascript" src="<%=path%>/JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>
		<script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
    <script type="text/javascript">
    
     $(document).ready( function() {
	 		
    	var selectPkind=document.getElementById("selectPkind");
        var selectKind = document.getElementById("selectKind"); 
    	$.post("listAllPkindAction",null,function(data){
    	
    		selectPkind.options.add(new Option("请选择","0"));
    		var member = eval(data);
    		
    		
    		for(var i=0;i<member.length;i++){
    			var admin=member[i];
				var tr=$("<option></option>");
				tr.attr("width","auto");
				tr.attr("value",admin.pkindId);
				tr.text(admin.pkindName);
				$("#selectPkind").append(tr);
    		}
    	});
    	
    	selectPkind.onchange=function (){ 
    		selectKind.options.length=0;
    		selectKind.options.add(new Option("请选择","0"));
    		/* alert($("#selectwarehouse option:selected").val()); */
    		
    		$.post("findKindAction",{pkindId:$("#selectPkind option:selected").val()},function(data){
    	/* 	alert(data); */
    		var member = eval(data);
    		
    		for(var i=0;i<member.length;i++){
    			var admin=member[i];
				var tr=$("<option></option>");
				tr.attr("width","auto");
				tr.attr("value",admin.kindId);
				tr.text(admin.kindName);
				$("#selectKind").append(tr);
    		}
    	});
    	};
    	selectKind.onchange=function (){
	 
	 	
    		 window.location.href="getKindGoodAction?good.kind.kindId="+
                            		 encodeURI(encodeURI($("#selectKind option:selected").val()));
	 	};
    });
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
        	myform.action="goodAction_delSelectGoods";
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
                <form action="goodAction_getOneGood" method="post" enctype="multipart/form-data">
                    <table class="search-tab">
                        <tr>
                            
                            
                              
                             <th width="70">商品编号:</th>
  								<td><input class="common-text" placeholder="商品编号" value="" id="" type="text" name="searchId"></td>
  								<td><input class="my_button" name="sub" type="submit" value="查询"> </td>
 								   <th width="70">类别查询:</th>
                            <td> <select name="colId" id="selectPkind" class="required">
                                   <!--  <option value="">请选择</option>
                                    <option value="19">生活用品</option><option value="20">母婴</option> -->
                                </select></td>
                            <td><select name="colId" id="selectKind" class="required">
                                    <option value="">请选择</option>
                                 
                                </select></td>
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
                    <table id="table_page" class="my_result-tab" >
                    
                        <tr>
						    <th class="tc" width="60px"><input class="allChoose" name="allcheck" type="checkbox" onclick="selectAll()">全选</th>
						    <th width="100px">编号</th>
						    <th width="103px">缩略图</th>
                            <th width="100px">名称</th>
                            <th width="200px">描述</th>
                            <th width="60px">进价</th>
                            <th width="60px">单价</th>
                            <th width="60px">库存</th>
                            <th width="60px">销量</th>
                            <th width="60px">促销</th>
                            <th width="60px">折扣</th>
							<th width="80px">操作</th>
                        </tr>
                        <tbody id="group_one">  
                         <s:iterator value="goodlist" id="sid" status="status">
        				<tr>
        				      <td class="tc" ><input class="allChoose" name="checkname" type="checkbox" value="${sid.goodId}"></td>
					          <td><a href="goodAction_toUpdateGood?good.goodId=${goodId}"><s:property value="goodId"/></a></td>
					          
					          
					          <td><img id="#status.index" width="100" height="100" style=" width: 100px; height: 100px;"  src="<s:property value='picture'/>"></td> 
					        
					          <td><s:property value="name"/></td>
					          <td>
							  <div class="ttt">
					              <a><span>
					                  <s:property value="des"  />
					                  <ul class="my_icon2">
								          <li><a class="active-icon c2" href="javascript:;"> </a>
									      <ul class="sub-my_icon2 list">
										      <li><s:property value="des"  /></li>
									      </ul>
								          </li>
							          </ul>
					              </span></a>
					          </div>
					          </td>
					           <td><s:property value="buyPrice"/></td>
					          <td><s:property value="price"/></td>
					          <td><s:property value="stock"/></td>
					          <td><s:property value="saleNum"/></td>
					          <td><s:property value="ishot"/></td>					          
					          <td><s:property value="discount"/></td>
					         
         
          					<td><a href="goodAction_toUpdateGood?good.goodId=${goodId}">修改</a>
          					<a href="goodAction_deleteGood?good.goodId=${goodId}">删除</a></td>
         
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
						<td><span id="pageindex"></span></td></tr>
					</table>
                    </div>
                </div>
               
            </form>
        </div>
    </div>
   </div>    
  
 </div>
    
  </body>
</html>
