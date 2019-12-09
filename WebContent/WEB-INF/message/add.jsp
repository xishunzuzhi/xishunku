<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>写邮件</title>
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
<form action="NoticeController?service=showMessage" method="post">
<h4>写邮件</h4>			
	<table border="1" style="border-collapse:collapse; border-color: #DCDCDC">
		<tr>
		<td class="td">邮件主题 </td>
			<td class="td1" colspan="3">&nbsp;<input type="text" id="subject1" name="subject" value="${message.subject}" placeholder="请填写公告主题 " > </td>
			
		</tr>
		<tr>
		<tr>
			<td class="td">发件人 </td>
			<td class="td1">&nbsp;
			<input type="hidden"  name="sender" value="${u.getUser_id()}" >
			<input type="text" id="sender1"  value="${u.getUsername()}" readonly placeholder="请填写添加人 "  > </td>
			<td class="td">接收人 </td>
			<td class="td1">&nbsp;
			<select id="receiver1" id="receiver1" name="receiver"style="font-size:12px; height: 25px; width: 70px;">
			</select> 
			</td>
		</tr>
		
		<tr>
			<td style=" height:100px;border-color: #DCDCDC;">发送内容</td>
			<td colspan="3"  style="border-color: #DCDCDC;">
				&nbsp;<input type="text" id="content1" name="content" value="${message.content}" style=" width:98% ;height:90px" placeholder="请填写发送内容" >
			</td>
		</tr>
		
		<tr>
		
			<td colspan="4" align="center" style=" height:50px">
			
				<input type="submit" value="发送" style="height:28px ; width:55px;color:#FFFFFF;background-color:#228fbd;border:none;border-radius: 4px; ">
				&nbsp;&nbsp;
				<input type="button" value="保存" onclick="on()" style="height:28px ; width:55px;color:#000000;background-color:#C0C0C0;border:none;border-radius: 4px; ">
			</td>
			
		</tr>
	</table>
</form> 
</body>
<script type="text/javascript">

	function on(){
		
		$.post("NoticeController?service=showMessage&addMessage",
			{"subject":$("#subject1").val(),"sender":$("#sender1").val(),"receiver":$("#receiver1").val(),"content":$("#content1").val()},
			function(){
				location.href="NoticeController?service=queryDrafts&addMessage=true"
			}
		)
	}
	$(function(){
		$.post("UserController?service=findByUserId",
		function(data){
			for(var i=0;i< data.length-1;i++ ){
				$("#receiver1").append("<option value='"+JSON.parse(data)[i].user_id+"'>"+JSON.parse(data)[i].username+"</option>");
			}
		})
		
	})

</script>
</html>