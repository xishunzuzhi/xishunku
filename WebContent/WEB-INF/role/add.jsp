<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src= "easyui/jquery-3.4.1.min.js"></script>   
<script type="text/javascript" src=  "easyui/jquery.easyui.min.js" ></script>  
<style type="text/css">

.td{
border-color: #DCDCDC;
	text-align: center;
	font-family:宋体;
	font-size:13px;
	width:155px; 
	height:35px;
	padding: 0;
}
.td1{
border-color: #DCDCDC;
font-family:宋体;
	font-size:11px;
	width:430px; 
	height:35px;
	padding: 0;
}

input::placeholder{
color:#585c89;
font-size: 10px;
}

</style>
<script type="text/javascript">

</script>
<body>
<form action="RoleController?service=save" method="post">
	<c:choose>
		<c:when test="${role.role_id!=null}">
			<h4>修改角色</h4>
		</c:when>
		<c:otherwise>
			<h4>新增角色</h4>			
		</c:otherwise>
	</c:choose>
	
	<table border="1" style="border-collapse:collapse; border-color: #DCDCDC">
		<tr>
			<c:choose>
					<c:when test="${role.role_id!=null}">
						<td class="td">角色ID</td>
						<td class="td1">&nbsp;<input type="text" name="role_id" readonly value="${role.role_id}"> </td>
					</c:when>
					<c:otherwise>
						<td class="td">角色ID</td>
						<td class="td1">&nbsp;<input type="text"  readonly placeholder="请填写角色ID" > </td>
					</c:otherwise>
				</c:choose>
			<td class="td">姓名</td>
			<td class="td1">&nbsp;<input type="text" name="role_name" placeholder="请填写姓名"  value="${role.role_name }"> </td>
		</tr>
		<tr>
		<td class="td">权限等级 </td>
			<td class="td1">&nbsp;
			<select  name="role_permission"  style="font-size:12px; height: 25px; width: 100px;">
				<option value="1" selected <c:if test="${role.role_permission==1}">selected</c:if>>员工</option>			
				<option value="2" <c:if test="${role.role_permission==2}">selected</c:if>>普通管理员</option>			
				<option value="3" <c:if test="${role.role_permission==3}">selected</c:if>>VIP管理员</option>			
				<option value="4" <c:if test="${role.role_permission==4}">selected</c:if>>超级VIP管理员</option>			
				<option value="5" <c:if test="${role.role_permission==5}">selected</c:if>>系统管理员</option>			
			</select>
			<td class="td">部门状态</td>
			<td class="td1">&nbsp;
				<select name="status" style="font-size:12px; height: 25px;">
					<option value="2" selected <c:if test="${role.status==2}">selected</c:if>>正常</option>			
					<option value="-2" <c:if test="${role.status==-2}">selected</c:if>>已删除</option>			
				</select> 
			</td>
		<tr>
			<td style=" height:100px;border-color: #DCDCDC;">操作备注</td>
			<td colspan="3"  style="border-color: #DCDCDC;">
				&nbsp;<input type="text" name="remark" style=" width:98% ;height:90px" placeholder="请填写备注" value="${role.remark }">
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center" style=" height:50px">
				<input type="submit" value="保存" style="height:28px ; width:55px;color:#FFFFFF;background-color:#228fbd;border:none;border-radius: 4px; ">
				&nbsp;&nbsp;
				<input type="button" onclick="goback()" value="返回" style="height:28px ; width:55px;color:#000000;background-color:#C0C0C0;border:none;border-radius: 4px; ">
			</td>
			
		</tr>
	</table>
</form> 
</body>
<script type="text/javascript">
	function goback(){
	location.href="RoleController?service=show"
	}

</script>
</html>