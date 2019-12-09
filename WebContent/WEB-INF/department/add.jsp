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
<form action="RoleController?service=department_save" method="post">
	<c:choose>
		<c:when test="${department.department_id!=null}">
			<h4>修改部门</h4>
		</c:when>
		<c:otherwise>
			<h4>新增部门</h4>			
		</c:otherwise>
	</c:choose>
	<table border="1" style="border-collapse:collapse; border-color: #DCDCDC">
		<tr>
			<c:choose>
				<c:when test="${department.department_id!=null}">
					<td class="td">部门ID</td>
					<td class="td1">&nbsp;<input type="text" name="department_id" readonly value="${department.department_id}"> </td>
				</c:when>
				<c:otherwise>
					<td class="td">部门ID</td>
					<td class="td1">&nbsp;<input type="text"  readonly placeholder="请填写部门ID" > </td>
				</c:otherwise>
			</c:choose>
			<td class="td">部门名称</td>
			<td class="td1">&nbsp;<input type="text" name="department_name" placeholder="请填写部门名称"  value="${department.department_name }"> </td>
		</tr>
		<tr>
		<td class="td">部门描述</td>
		<td class="td1">&nbsp;<input type="text" name="department_desc" placeholder="请填写部门描述"  value="${department.department_desc }"> </td>
			<td class="td">部门状态</td>
			<td class="td1">&nbsp;
				<select name="status" style="font-size:12px; height: 25px;">
					<option value="2" selected <c:if test="${department.status==2}">selected</c:if>>正常</option>			
					<option value="-2" <c:if test="${department.status==-2}">selected</c:if>>已删除</option>			
				</select> 
			</td>
		<tr>
			<td style=" height:100px;border-color: #DCDCDC;">操作备注</td>
			<td colspan="3"  style="border-color: #DCDCDC;">
				&nbsp;<input type="text" name="remark" style=" width:98% ;height:90px" placeholder="请填写备注" value="${department.remark }">
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
	location.href="RoleController?service=show&department_id"
	}

</script>
</html>