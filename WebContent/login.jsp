<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/easyui/themes/icon.css"  >   
</head>

<script type="text/javascript" src= "${pageContext.request.contextPath}/easyui/jquery-3.4.1.js"></script>   
<script type="text/javascript" src= "${pageContext.request.contextPath}/easyui/jquery.easyui.min.js" ></script>  

<style type="text/css">
.a{
height: 330px; 
width: 410px; 
background: #FFFFFF; 
position:absolute ;
left:560px;
bottom:200px;
}
.b{
position:absolute ;
left:102px;
bottom:230px;
color: #C0C0C0;
font-family: 楷体;
font-size: 20px;
}
.c{
height: 50px; 
width: 350px;
position:absolute ;
left:55px;
bottom:160px;
background: #FFFFFF;
}
</style>

<body style="background:#DCDCDC">
<form action="LoginController" method="post" id="from1" onsubmit="return check()">
	<div class="a">
	<img style=" height: 50px; width: 195px ; right: 10px;position:absolute ;left:105px;top:20px ;" src="${pageContext.request.contextPath}/image/logo.png" >
	<div class="b">智游客户关系管理系统</div>
		<div class="c">
		<input id="tb" name="username" type="text" style="color:red; width:300px;height: 35px">
		</div>
		<div style="height: 50px; width: 350px;position:absolute ;left:55px; bottom:100px;background: #FFFFFF;">
		<input id="tb1" name="password" type="text" style="width:300px;height: 35px">
		</div>
		<div style="height: 50px; width: 350px;position:absolute ;left:55px; bottom:50px;background: #FFFFFF;">
			
		</div>
		
			<input id="msg" type="hidden" value="${msg}"  >
		<div style="height: 40px; width: 300px;position:absolute ;left:55px; bottom:25px;background:#DC143C;">
			<input id="tb3" type="submit"  value="登录" style="height: 40px; width: 300px;border:none;  background-color:#DC143C	;font-family: 宋体;font-size:15px;color:#FFFFFF">
		</div>
	
	
	</div>
</form>
</body>

<script type="text/javascript">
$('#tb').textbox({    
    iconCls:'icon-man', 
    iconAlign:'right'       
}) 
$('#tb1').textbox({    
    iconCls:'icon-lock', 
    iconAlign:'right'       
}) 
	function on(){	
	document.getElementById("img1").src="<%=request.getContextPath() %>/image?="+Math.random();
	}
$(function(){
	if($("#msg").val()!=""){
		alert($("#msg").val());
	}
})



</script>

</html>