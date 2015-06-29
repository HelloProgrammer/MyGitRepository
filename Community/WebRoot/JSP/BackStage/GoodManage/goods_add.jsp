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
	<script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="<%=path%>/JS/js/libs/modernizr.min.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/uploadpic.js"></script>
	
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
    	}
    	selectKind.onchange=function (){
	 
	 		document.getElementById("kindId").value = $("#selectKind option:selected").val();
	 	}
    });
    
	 
	 
    function submitfun()
    {
    	
    	goodaddForm.action = "goodAction_addGood";
    	goodaddForm.submit();
    }
     function backfun()
    {
   		goodaddForm.action = "goodAction_getAllGood";
    	goodaddForm.submit();
    }
    </script>
  </head>
  
  <body>
          <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>         
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>  
        <div class="result-wrap">
            <div class="result-content">
                <form  method="post"  name="goodaddForm" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>类别：</th>
                            <td>
                                <select name="colId" id="selectPkind" class="required">
                                   <!--  <option value="">请选择</option>
                                    <option value="19">生活用品</option><option value="20">母婴</option> -->
                                </select>
								<select name="colId" id="selectKind" class="required">
                                   <!--  <option value="">请选择</option>
                                    <option value="19">尿不湿</option><option value="20">尿不湿大号</option> -->
                                </select>
                                <input id="kindId" name="good.kind.kindId" type="text" hidden="hidden">
                                <!-- <input id="kindId" name="good.kind.kindId" type="text" hidden="hidden"> -->
                            </td>
                        </tr>
                          <tr>
								
									<th><i class="require-red"></i>编号：</th>	
								
								<td>
									 <input class="common-text required" id="title" name="good.goodId"  size="50"  type="text">
								</td>
			
								</tr>
                            <tr>
                                <th><i class="require-red">*</i>商品名称：</th>
                                <td>
                                    <input class="common-text required" id="title" name="good.name"  size="50"  type="text">
                                </td>
                            </tr>
                            
                              <tr>
                                <th><i class="require-red">*</i>商品描述：</th>
                                <td>
                                    <input class="common-text required" id="title" name="good.des"  size="50"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>单价：</th>
                                <td><input class="common-text" name="good.price"  type="text"></td>
                            </tr>
							<tr>
                                <th><i class="require-red">*</i>库存：</th>
                                <td><input class="common-text"  name="good.stock"  type="text"></td>
                            </tr>
							
                            <tr>
                                <th><i class="require-red">*</i>图片：</th>
                                <td>
                                <img id="preview" width="150" height="180" style="display: block; width: 150px; height: 180px;" /> <br/>
								<input type="file" name="upload" id="doc" style="width:150px;" onchange="javascript:setImagePreview();">
								
								</td>
                            </tr>
                            <tr>
                                <th>是否促销：</th>
                                <td>
                                	<s:radio list="#{'是':'是','否':'否'}" name="good.ishot" />
                                </td>
                            </tr>
                            <tr>
                                <th>折扣：</th>
                                <td>
                                <input class="common-text"  name="good.discount"  size="50"  type="text">
                                </td>
                                
                             </tr>
                              <!-- <tr>
                                <th>选择类别：</th>
                                <td>
                                <input class="common-text"  name="good.kind.kindId"  size="50"  type="text">
                                </td>
                                
                             </tr> -->
                             <tr> 
                             <th></th>
                                <td>
                                
                                    <input class="my_button" type="button" value="添加" onclick="submitfun()">
									<input class="my_button" type="button" value="返回列表" onclick="backfun()">
                                </td>
                            </tr>
                        </tbody></table>
               </form> 
            </div>
        </div>
        
   </div>
 </div>
    
  </body>
</html>
