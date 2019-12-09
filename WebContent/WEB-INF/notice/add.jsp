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
<form action="NoticeController?service=save" method="post">
	<c:choose>
		<c:when test="${notice.notice_id!=null}">
			<h4>修改公告</h4>
		</c:when>
		<c:otherwise>
			<h4>新增公告</h4>			
		</c:otherwise>
	</c:choose>
	
	<table border="1" style="border-collapse:collapse; border-color: #DCDCDC">
		<tr>
			<c:choose>
					<c:when test="${notice.notice_id!=null}">
						<td class="td">公告信息ID</td>
						<td class="td1">&nbsp;<input type="text" name="notice_id" readonly value="${notice.notice_id}"> </td>
					</c:when>
					<c:otherwise>
						<td class="td">公告信息ID</td>
						<td class="td1">&nbsp;<input type="text"  readonly placeholder="请填写公告信息ID" > </td>
					</c:otherwise>
				</c:choose>
			<td class="td">接收部门ID</td>
			<td class="td1">&nbsp;
				<select id="department_id1" name="receive_id"  style="font-size:12px; height: 25px; width: 70px;" ></select>
		</tr>
		<tr>
		<td class="td">公告主题 </td>
			<td class="td1">&nbsp;<input type="text" name="subject" placeholder="请填写公告主题 "  value="${notice.subject }"> </td>
		<td class="td">公告内容 </td>
			<td class="td1">&nbsp;<input type="text" name="text" placeholder="请填写公告内容"  value="${notice.text }"> </td>
		</tr>
		<tr>
		<td class="td">公告状态</td>
			<td class="td1">&nbsp;
				<select name="status" style="font-size:12px; height: 25px;">
					<option value="2" selected <c:if test="${notice.status==2}">selected</c:if>>正常</option>			
					<option value="-2" <c:if test="${notice.status==-2}">selected</c:if>>已删除</option>			
				</select> 
			</td>
		<td class="td">过期时间 </td>
			<td class="td1">&nbsp;<input type="Date" name="expire_time" placeholder="请填写过期时间"  value="${notice.expire_time }"> </td>
		</tr>
		<tr>
		<tr>
		<td class="td">添加人 </td>
			<td class="td1">&nbsp;<input type="text" name="creater" placeholder="请填写添加人 "  value="${notice.creater }"> </td>
		<td class="td">修改人 </td>
			<td class="td1">&nbsp;<input type="text" name="updater" placeholder="请填写修改人"  value="${notice.updater }"> </td>
		</tr>
		<tr>
			<td style=" height:100px;border-color: #DCDCDC;">操作备注</td>
			<td colspan="3"  style="border-color: #DCDCDC;">
				&nbsp;<input type="text" name="remark" style=" width:98% ;height:90px" placeholder="请填写备注" value="${notice.remark }">
			</td>
		</tr>
		
		<tr>
		
			<td colspan="4" align="center" style=" height:50px">
			<input type="hidden" id="hid" value="${receive_id}"/>
			
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
	location.href="NoticeController?service=show"
	}
	$(function(){
		
		$.post("UserController?service=findByDepartmentId",
				function(data){
					if($("#hid").val()!=""){
						$("#department_id1").append("<option>"+JSON.parse(data)[$("#hid").val()-4].department_name+"</option>");
					}else{
						$("#department_id1").append("<option>"+JSON.parse(data)[0].department_name+"</option>");
					}
					for(var i=0;i< data.length-1;i++ ){
							$("#department_id1").append("<option value='"+JSON.parse(data)[i].department_id+"'>"+JSON.parse(data)[i].department_name+"</option>" );
					};	
				})
	})
</script>
</html>