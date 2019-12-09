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
<form action="customerController?service=saveCustomer" method="post">
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
				<c:when test="${customer.customer_id!=null}">
					<td class="td">客户ID</td>
					<td class="td1">&nbsp;<input type="text" name="customer_id" readonly value="${customer.customer_id}"> </td>
				</c:when>
				<c:otherwise>
					<td class="td">客户ID</td>
					<td class="td1">&nbsp;<input type="text"  placeholder="请填写客户手机"  readonly > </td>			
				</c:otherwise>
			</c:choose>
			<td class="td">客户状态ID</td>
			<td class="td1">&nbsp;
				<select id="customer_state_id1" name="customer"  style="font-size:12px; height: 25px; width: 70px;"></select> 
			</td>
		</tr>
		<tr>		
			
			<td class="td">客户来源ID</td>
			<td class="td1">&nbsp;
				<select id="customer_source_id1" name="customer"  style="font-size:12px; height: 25px; width: 70px;"></select> 
			 </td>
			<td class="td">责任员工ID</td>
			<td class="td1">&nbsp;
				<select id="user_id1" name="customer"  style="font-size:12px; height: 25px; width: 70px;">
				</select> 
			 </td>
		</tr>
		<tr>
		
		<td class="td">客户类型ID</td>
			<td class="td1">&nbsp;
			<select id="customer_category_id1" name="customer"  style="font-size:12px; height: 25px; width: 70px;">				
			</select> 
			</td>
			<td class="td">客户姓名</td>
				<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写用户名" value="${customer.customer_name}"></td>
		</tr>
		<tr>
			<td class="td">客户性别</td>
			<td class="td1" >&nbsp;
				<input type="radio" value="true" name="customer" checked <c:if test="${customer.customer_is_male==true}">checked</c:if>>男
				<input type="radio" value="false" name="customer"<c:if test="${customer.customer_is_male==false}">checked</c:if>>女
			</td>
			<td class="td">客户手机</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写客户手机" value="${customer.customer_mobile}"></td>
		</tr>
		<tr>
			<td class="td">客户QQ</td>
			<td class="td1" >&nbsp;
				<input type="text" name="customer" placeholder="请填写客户QQ" value="${customer.customer_qq}">
			</td>
			<td class="td">客户地址</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写客户地址" value="${customer.customer_address}"></td>
		</tr>
		<tr>
			<td class="td">客户邮箱</td>
			<td class="td1" >&nbsp;
				<input type="text" name="customer" placeholder="请填写客户邮箱" value="${customer.customer_email}">
			</td>	
			<td class="td">客户备注</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写客户备注" value="${customer.customer_remark}"></td>
		</tr>
		<tr>
			<td class="td">客户职位</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写客户职位" value="${customer.customer_position}"> </td>
			<td class="td">客户微博</td>
			<td class="td1">&nbsp;<input type="text" name="customer"  placeholder="请填写客户微博" value="${customer.customer_blog}" style="width:350px;"></td>
		</tr>
		<tr>
			<td class="td">客户座机</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写客户座机 " value="${customer.customer_tel}" style="width:300px;"> </td>
			<td class="td">出生日期</td>
			<td class="td1">&nbsp;<input type="date" name="customer" value="${customer.customer_birth}"> </td>
		</tr>
			<tr>
			<td class="td">客户公司</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写客户公司" value="${customer.customer_company}" style="width:300px;"> </td>
			<td class="td">状态</td>
			<td class="td1">&nbsp;
				<select name="customer" style="font-size:12px; height: 25px;">
					<option value="2" selected <c:if test="${customer.status==2}">selected</c:if>>正常</option>
					<option value="-2" <c:if test="${customer.status==-2}">selected</c:if>>已删除</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="td">添加人</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写添加人" value="${customer.creater}"></td>
			<td class="td">修改人</td>
			<td class="td1">&nbsp;<input type="text" name="customer" placeholder="请填写修改人" value="${customer.updater}"></td>
		</tr>
		<tr>
			<td style=" height:100px;border-color: #DCDCDC;" >备注</td>
			<td colspan="3"  style="border-color: #DCDCDC;">
				&nbsp;<input type="text" name="customer" style=" width:98% ;height:90px" placeholder="请填写备注" value="${customer.remark}">
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
	location.href="customerController?service=showCustomer"
	}
		$(function(){
			$.post("UserController?service=findByUserId",
			function(data){
				for(var i=0;i< data.length-1;i++ ){
					$("#user_id1").append("<option value='"+JSON.parse(data)[i].user_id+"' >"+JSON.parse(data)[i].username+"</option>");
				}
			})
			$.post("customerController?service=findByCustomer_stateId",
			function(data){
				for(var i=0;i< data.length-1;i++ ){
					$("#customer_state_id1").append("<option value='"+JSON.parse(data)[i].customer_state_id+"'>"+JSON.parse(data)[i].customer_state_name+"</option>");
				}
			})
			$.post("customerController?service=findByCustomer_categoryId",
			function(data){
				for(var i=0;i< data.length-1;i++ ){
					$("#customer_category_id1").append("<option value='"+JSON.parse(data)[i].customer_category_id+"'>"+JSON.parse(data)[i].customer_category_name+"</option>");
				}
			})
			$.post("customerController?service=findByCustomer_sourceId",
			function(data){
				for(var i=0;i< data.length-1;i++ ){
					$("#customer_source_id1").append("<option value='"+JSON.parse(data)[i].customer_source_id+"'>"+JSON.parse(data)[i].customer_source_name+"</option>");
				}
			})
			
		});
	

		 
</script>
</html>