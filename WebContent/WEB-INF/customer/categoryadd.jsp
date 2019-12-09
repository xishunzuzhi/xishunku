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
<form action="customerController?service=saveCustomer&customer" method="post">
	<c:choose>
		<c:when test="${user.user_id!=null}">
			<h4>修改客户</h4>
		</c:when>
		<c:otherwise>
			<h4>新增客户</h4>			
		</c:otherwise>
	</c:choose>

	<table border="1" style="border-collapse:collapse; border-color: #DCDCDC">
		<tr>
			<c:choose>
				<c:when test="${category.customer_category_id!=null}">
					<td class="td">客户类型ID</td>
					<td class="td1">&nbsp;<input type="text" name="customer_category_id" readonly value="${category.customer_category_id}"> </td>
				</c:when>
				<c:otherwise>
					<td class="td">客户类型ID</td>
					<td class="td1">&nbsp;<input type="text"  placeholder="请填写客户类型ID"  readonly > </td>			
				</c:otherwise>
			</c:choose>
			<td class="td">分类名称</td>
			<td class="td1" >&nbsp;
				<input type="text" name="customer_category_name" placeholder="请填写分类名称" value="${category.customer_category_name}">
			</td>
		</tr>
		<tr>
			<td class="td">分类描述</td>
			<td class="td1">&nbsp;<input type="text" name="customer_category_desc" placeholder="请填写分类描述" value="${category.customer_category_desc}" style="width:300px;"> </td>
			<td class="td">状态</td>
			<td class="td1">&nbsp;
				<select name="status" style="font-size:12px; height: 25px;">
					<option value="2" selected <c:if test="${category.status==2}">selected</c:if>>正常</option>
					<option value="-2" <c:if test="${category.status==-2}">selected</c:if>>已删除</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="td">添加人</td>
			<td class="td1">&nbsp;<input type="text" name="creater" placeholder="请填写添加人" value="${category.creater}"></td>
			<td class="td">修改人</td>
			<td class="td1">&nbsp;<input type="text" name="updater" placeholder="请填写修改人" value="${category.updater}"></td>
		</tr>
		<tr>
			<td style=" height:100px;border-color: #DCDCDC;" >备注</td>
			<td colspan="3"  style="border-color: #DCDCDC;">
				&nbsp;<input type="text" name="remark" style=" width:98% ;height:90px" placeholder="请填写备注" value="${category.remark}">
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
	location.href="customerController?service=showCustomer&customer"
	}
</script>
</html>