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
    <script type="text/javascript" src="<%=path%>/JS/js/libs/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/js/libs/js_l.js"></script>
	<script type="text/javascript" src="<%=path%>/JS/uploadpic.js"></script>
	<script type="text/javascript">
	
	 $(document).ready( function() {
    	var selectPkind=document.getElementById("selectPkind");
        var selectKind = document.getElementById("selectKind");
       	/*var shopmanId = document.getElementById("shopmanId").innerText;  */
       	var pkindName=null; 
        $.post("showOnePkindAction",{kindName:$("#exit").val()},function(data){
    	 	
    		var member = eval("("+data+")");
    		pkindName = member.pkindName;
    		
			var tr=$("<option></option>");
			tr.attr("width","auto");
			tr.attr("value",member.pkindId);
			tr.text(member.pkindName);
			$("#selectPkind").append(tr);
    	}); 
    	
    	$.post("listAllPkindAction",null,function(data){
    		var member = eval(data);
    		
    		for(var i=0;i<member.length;i++){
    			var admin=member[i];
    			if(admin.pkindName!=pkindName){
					var tr=$("<option></option>");
					tr.attr("width","auto");
					tr.attr("value",admin.pkindId);
					tr.text(admin.pkindName);
					$("#selectPkind").append(tr);
				}
    		}
    	}); 
    	   	
    	$.post("listKindsAction",{kindName:$("#exit").val()},function(data){
    		
    		var member = eval(data);
    		for(var i=0;i<member.length;i++){
    			var admin=member[i];
				if(admin.kindName!=$("#exit").val()){
    				var tr=$("<option></option>");
    				tr.attr("width","auto");
    				tr.attr("value",admin.kindId);
    				tr.text(admin.kindName);
    				$("#selectKind").append(tr);
    			}
    			else{
    				
    				document.getElementById("kindId").value =admin.kindId;
    			}
    		}
    	});
    	
    	 selectPkind.onchange=function (){ 
    		selectKind.options.length=0;
    		selectKind.options.add(new Option("请选择","0"));
    		
    		$.post("findKindAction",{pkindId:$("#selectPkind option:selected").val()},function(data){
    
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
    	goodupdateForm.action = "goodAction_updateGood";
    	goodupdateForm.submit();
    }
   
   
    </script>

  </head>
  
  <body>
    <%@ include file="../Parts/header.jsp" %>
 <div class="container clearfix">
          <%@ include file="../Parts/menu.jsp" %>         
          <div class="main-wrap">
        <%@ include file="../Parts/header_path.jsp" %>  
       

            <div class="result-content">
                <form  method="post"  name="goodupdateForm" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="selectPkind">*</i>类别：</th>
                            <td>
                                <select name="colId" id="selectPkind" class="required">
                                   <!--  <option value="">请选择</option>
                                    <option value="19">生活用品</option><option value="20">母婴</option> -->
                                </select>
								<select name="colId" id="selectKind" class="required">
								 	<option id="exit" value="<s:property value="good.kind.kindId"/>">
				      					<s:property value="good.kind.kindId"/>
				    				</option>
                                   <!--  <option value="">请选择</option>
                                    <option value="19">尿不湿</option><option value="20">尿不湿大号</option> -->
                                </select>
                                <input id="kindId" name="good.kind.kindId" type="text" hidden="hidden"/>
                            </td>
                        </tr>
                        	<tr>
								
									<th><i class="require-red"></i>编号：</th>	
								
								<td>
									<s:property value='good.goodId'/>
								</td>
			
								</tr>
                            <tr>
                                <th><i class="require-red">*</i>商品名称：</th>
                                <td>
                                    <input class="common-text required" id="title" name="good.name" value="<s:property value='good.name'/>" size="50"  type="text">
                                </td>
                            </tr>
                            
                              <tr>
                                <th><i class="require-red">*</i>商品描述：</th>
                                <td>
                                    <input class="common-text required" id="title" name="good.des" value="<s:property value='good.des'/>" size="50"  type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>进价：</th>
                                <td><input class="common-text" name="good.buyPrice" value="<s:property value='good.buyPrice'/>" size="50" type="text"></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>单价：</th>
                                <td><input class="common-text" name="good.price" value="<s:property value='good.price'/>" size="50" type="text"></td>
                            </tr>
							<tr>
                                <th><i class="require-red">*</i>库存：</th>
                                <td><input class="common-text"  name="good.stock" value="<s:property value='good.stock'/>" size="50"  type="text"></td>
                            </tr>
							
                            <tr>
                                <th><i class="require-red">*</i>图片：</th>
                                <td>
                                <img id="preview" width="150" height="180" style="display: block; width: 150px; height: 180px;"  src="<s:property value='good.picture'/>"><br/>
			<input type="file" name="upload" id="doc" style="width:150px;" onchange="javascript:setImagePreview();">
								</td>
                            </tr>
                            <tr>
                                <th>是否促销：</th>
                                <td>
                                <s:radio list="#{'是':'是','否':'否'}" name="good.ishot" value="#{good.ishot}"/>
								</td>
                            </tr>
                            <tr>
                                <th>折扣：</th>
                                <td>
                                <input class="common-text"  name="good.discount" value="<s:property value='good.discount'/>" size="50"  type="text">
                                </td>
                                
                             </tr>
                              <%-- <tr>
                                <th>选择类别：</th>
                                <td>
                                <input class="common-text"  name="good.kind.kindId" value="<s:property value='good.kind.kindId'/>" size="50"  type="text">
                                </td>
                                
                             </tr> --%>
                             <tr> 
                                <th></th>
                                <td>
                                   <!--  <input class="my_button" value="保存" type="submit">
                                    <input class="my_button" onClick="history.go(-1)" value="返回" type="button"> -->
                                    <input class="my_button" type="button" value="修改" onclick="submitfun()">
									<input class="my_button" type="button" value="返回列表" onclick="window.history.back()">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
</div>

  </body>
</html>
