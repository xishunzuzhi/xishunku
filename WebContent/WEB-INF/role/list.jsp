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
<h3>角色列表</h3><br>
	<form action="RoleController?service=show" method="post">
		<span class="span">
			搜索内容:<input type="text" name="u_name">&nbsp;&nbsp;&nbsp;
			搜索字段:<select name="fuzzyQuery" style="font-size:12px; ">
					<option value="role_name">角色名</option>
					<option value="remark">操作备注</option>
			</select>&nbsp;&nbsp;
			<input type="submit" value="搜索">
		</span>
	</form>
	<a target="iframe_a" href="RoleController?service=addUser"  class="easyui-linkbutton" style=" background:#228fbd;color:#C0C0C0;position:absolute ;top:45px;right: 10px">添加角色</a>  
	<table id="dg" class="easyui-datagrid" style="height:500px;" >   
    <thead>   
        <tr >              
           <th data-options="field:'number'" width="80">编号</th>      
            <th data-options="field:'role_id'" width="80">角色ID</th>     
            <th data-options="field:'role_name'" width="100">角色名</th>   
            <th data-options="field:'role_permission'" width="140">权限等级</th>   
            <th data-options="field:'status'" width="100">部门状态</th>   
            <th data-options="field:'remark'" width="200">操作备注</th>   
            <th data-options="field:'create_time'" width="130">添加时间</th>   
            <th data-options="field:'creater'" width="100">添加人</th>   
            <th data-options="field:'update_time'" width="130">修改时间</th>   
            <th data-options="field:'updater'" width="100">修改人</th>   
            <th data-options="field:'code'" width="100">操作</th>   
    </thead>   
    <tbody>   
		<c:forEach begin="0" end="${list.size()-1}" var = "i">
			<tr>
				<td>${i+1}</td>
				<td>${list[i].role_id}</td>
				<td>${list[i].role_name}</td>
			
				<c:choose>
					<c:when test="${list[i].role_permission==1}">
						<td>员工</td>
					</c:when>
					<c:when test="${list[i].role_permission==2}">
						<td>普通管理员</td>
					</c:when>
					<c:when test="${list[i].role_permission==3}">
						<td>VIP管理员</td>
					</c:when>
					<c:when test="${list[i].role_permission==4}">
						<td>超级VIP管理员</td>
					</c:when>
					<c:when test="${list[i].role_permission==5}">
						<td>系统管理员</td>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${list[i].status==2}">
						<td>正常</td>
					</c:when>
					<c:when test="${list[i].status==-2}">
						<td>已删除</td>
					</c:when>
				</c:choose>
				<td>${list[i].remark}</td>
				<td><fmt:formatDate value="${list[i].create_time}" /></td>
				<td>${list[i].creater}</td>
				<td><fmt:formatDate value="${list[i].update_time}" /></td>
				<td>${list[i].updater}</td>
				<td>
				<a target="iframe_a" href="RoleController?service=update&id=${list[i].role_id}" onclick="return update(${list[i].status})" ><img src="easyui/themes/icons/pencil.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			    <a  href="RoleController?service=delete&id=${list[i].role_id}" onclick="return deleteUser(${list[i].status})"><img src="easyui/themes/icons/cancel.png"></a>
				<input type="hidden" id="hi" value="${msg}">	
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
						<a href="RoleController?service=show&page=${page-1}">上一页</a>
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
					<a href="RoleController?service=show&page=${page+1}">下一页</a>
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
				if($("#hi").val()!=""){
					alert($("#hi").val());
				}
			})
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
				if(i!=-2){
					if (confirm("是否要修改？")) {
						return true;
					}
					return false;
				}else{
					alert("抱歉，数据不存在");
					return false;
				}
			}
			function deleteUser(i){
				if(i!=-2){
					if (confirm("是否要删除？")) {
						return true;
					}
					return false;
				}else{
					alert("已删除");
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