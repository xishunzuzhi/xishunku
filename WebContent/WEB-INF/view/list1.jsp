<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href= "easyui/themes/icon.css"  >   
</head>
<script type="text/javascript" src= "easyui/jquery-3.4.1.min.js"></script>   
<script type="text/javascript" src=  "easyui/jquery.easyui.min.js" ></script>  
<style type="text/css">
	.span{
	position:absolute ;
	top:53px;
	left:30px;
	font-family:宋体;
	font-size:12px;
	}


.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 0;
    border-radius: 4px;
}
.pagination>li {
    display: inline;
}

.pagination>li>a, .pagination>li>span {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #888;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, 
.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #337ab7;
    border-color: #337ab7;
}

</style>
<body >
<h3>用户列表</h3><br>
	<form action="UserController?service=show" method="post">
		<span class="span">
			搜索内容:<input type="text" name="u_name">&nbsp;&nbsp;&nbsp;
			搜索字段:<select name="fuzzyQuery" style="font-size:12px;">
					<option value="username">姓名</option>
					<option value="address">地址</option>
					<option value="mobile">手机号</option>
					<option value="id_num">身份证号</option>
					
			</select>&nbsp;&nbsp;
			<input type="submit" value="搜索">
		</span>
	</form>
	<a target="iframe_a" href="addUser?service=addUser"  class="easyui-linkbutton" style=" background:#228fbd;color:#C0C0C0;position:absolute ;top:45px;right: 10px">添加用户</a>  
	<table id="dg" class="easyui-datagrid" style="height:500px;" >   
    <thead>   
        <tr >              
           <th data-options="field:'code1'" width="80">编号</th>      
            <th data-options="field:'username'" width="80">姓名</th> 
            <th data-options="field:'role_name'" width="80">角色名</th>     
            <th data-options="field:'department_name'" width="80">部门</th>     
            <th data-options="field:'is_male'" width="40">性别</th>   
            <th data-options="field:'code5'" width="80">手机</th>   
            <th data-options="field:'code7'" width="80">年龄</th>   
            <th data-options="field:'code8'" width="130">地址</th>   
            <th data-options="field:'code9'" width="80">是否管理员</th>   
            <th data-options="field:'code10'" width="80">是否为系统内置</th>   
            <th data-options="field:'code12'" width="90">座机</th>   
            <th data-options="field:'code13'" width="140">身份证号</th>   
            <th data-options="field:'code14'" width="130">E_mail</th>   
            <th data-options="field:'code15'" width="80">爱好</th>   
            <th data-options="field:'code16'" width="60">学历</th>   
            <th data-options="field:'code17'" width="80">工资卡号</th>   
            <th data-options="field:'code18'" width="40">民族</th>   
            <th data-options="field:'code19'" width="60">婚姻状况</th>   
            <th data-options="field:'code20'" width="100">用户状态</th>   
            <th data-options="field:'code21'" width="80">操作备注</th>   
            <th data-options="field:'code22'" width="80">添加时间</th>   
            <th data-options="field:'code23'" width="80">添加人</th>   
            <th data-options="field:'code24'" width="80">修改时间</th>   
            <th data-options="field:'code25'" width="80">修改人</th>   
     
            <th data-options="field:'code26'" width="80">操作</th>   
    </thead>   
   
    <tbody>   
    
   
		<c:forEach begin="0" end="${list.size()-1}" var = "i">
			<tr>
				<td>${i+1}</td>
				
				<td>${list[i].username}</td>
				<c:forEach begin="0" end="8" var = "r">
					<c:if test="${list[i].role_id==roles[r].role_id}">
						<td>${roles[r].role_name}</td>
					</c:if>
				</c:forEach>
				<c:forEach begin="0" end="8" var = "d">
					<c:if test="${list[i].role_id==department[d].department_id}">
						<td>${department[d].department_name}</td>
					</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when test="${list[i].is_male.equals(true)}">
						<td>男</td>
					</c:when>
					<c:otherwise>
						<td>女</td>
					</c:otherwise>
				</c:choose>
				<td>${list[i].mobile}</td>
				<td>${list[i].age}</td>
				<td>${list[i].address}</td>
				<c:choose >
					<c:when test="${list[i].is_admin.equals(true)}">
						<td>是</td>
					</c:when>
					<c:otherwise>
						<td>否</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${list[i].is_system.equals(true)}">
						<td>是</td>
					</c:when>
					<c:otherwise>
						<td>否</td>
					</c:otherwise>
				</c:choose>
				<td>${list[i].tel}</td>
				<td>${list[i].id_num}</td>
				<td>${list[i].email}</td>
				<td>${list[i].hobby}</td>
				<c:choose>
	    			<c:when test="${list[i].education==1}">
	             		<td>小学 </td>
	       			</c:when>
	       			<c:when test="${list[i].education==2}">
	             		<td>初中 </td>
	       			</c:when>
	    			<c:when test="${list[i].education==3}">
	             		<td>高中 </td>
	       			</c:when>
	       			<c:when test="${list[i].education==4}">
	             		<td>专科 </td>
	       			</c:when>
	    			<c:when test="${list[i].education==5}">
	             		<td>本科 </td>
	       			</c:when>
	       			<c:when test="${list[i].education==6}">
	             		<td>硕士 </td>
	       			</c:when>
	    			<c:when test="${list[i].education==7}">
	             		<td>博士 </td>
	      		 	</c:when>
				</c:choose>
				
					<td>${list[i].card_num}</td>
					<td>${list[i].nation}</td>
				<c:choose>
	    			<c:when test="${list[i].marry==0}">
	             		<td>未婚 </td>
	       			</c:when>
	       			<c:when test="${list[i].education==1}">
	           	  		<td>已婚 </td>
	       			</c:when>
	       			<c:when test="${list[i].education==-1}">
	             		<td>离异 </td>
	       			</c:when>
				</c:choose>
				<c:choose>
	    			<c:when test="${list[i].status==1}">
	    		
	             		<td>已创建(未激活,不能登录) </td>
	       			</c:when>
	    			<c:when test="${list[i].status==2}">
	    			
	             		<td>正常(已激活)</td>
	      		 	</c:when>
	       			<c:when test="${list[i].status==-1}">
	       			
	            	 	<td>已禁用(不能登录)</td>
	       			</c:when>
	       			<c:when test="${list[i].status==-2}">
	       		
	            	 	<td id="l">已删除</td>
	       			</c:when>
				</c:choose>
					<td>${list[i].remark}</td>
					<td><fmt:formatDate value="${list[i].update_time}"/></td>
					<td>${list[i].creater}</td>
					<td><fmt:formatDate value="${list[i].update_time}"/></td>
					<td>${list[i].updater}</td>
					
				
				
				<td>
					<input id="user_id"type="hidden" value="${user_id}">
					<a target="iframe_a"href="UserController?service=update&id=${list[i].user_id}" onclick="return update(${list[i].user_id})" >
					<img src="easyui/themes/icons/pencil.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>	
				
			</tr>
		</c:forEach>
    </tbody>   
</table> 

	<div  style="height:9%; width:102%;position: fixed;bottom:0; background: #FFFFFF;">
		<fmt:parseNumber value="${Math.ceil(totalCount/10)}" var="Count" integerOnly="true"/>
		<div>共有${totalCount}条记录，
	
		${Count} 页 </div>
		<div style="background:#FFFFFF;height:100px; width:20%;position:absolute ;top:0%;right: 0%; ">
			<ul class="pagination">
			<li>
				<c:choose>
					<c:when test="${page!=1}">
						<a href="UserController?service=show&page=${page-1}">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:to_page()">上一页</a>
					</c:otherwise>
				</c:choose>
				</li>
				<li class="paginate_button active">
					<a  href="#">${page}</a>
				</li>	
				<li>
				<c:choose>
					<c:when test="${page!=Count}">
					<a href="UserController?service=show&page=${page+1}">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:to_page(true)">下一页</a>
					</c:otherwise>
				</c:choose>
					
			</li>
		</ul>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
	fitCoulms();
	});
	$(window).resize(function(){
	fitCoulms();
	});
})
function fitCoulms(){
	$('#dg').datagrid({
	fitColumns:false
	});
}
function update(i){
	if($("#user_id").val()==i){
		return true;
	}else{
		alert("抱歉你没有权限");
		return false;
	}	
}	
function to_page(i){
	if(i){
		alert("已经是最后一页了");
		return;
	}
		alert("已经是第一页了");
}
</script>
</html>