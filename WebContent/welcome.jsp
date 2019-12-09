<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>欢迎页面</title>
<script type="text/javascript">
		/*---------- 动态获取系统当前日期方法start ------*/
		setInterval(
				"document.getElementById('sysDate').value=new Date().toLocaleString()+'  星期'+'日一二三四五六'.charAt(new Date().getDay());",
				1000);
		setInterval(
				"document.getElementById('sysSysDate').value=new Date().toLocaleString();",
				1000);
 
		/*---------- 动态获取系统当前日期方法end ------*/
</script>

<style type="text/css">
.div1{
	font-size: 30px;
}

</style>
</head>
<body>

<input id="sysDate" readonly style="width: 400px;text-align: center;border:none;font-size: 20px " />

<h1 align="center">欢迎
	<c:choose>
		<c:when test="${u.getIs_admin()==true }">
			管理员
		</c:when>
		<c:when test="${u.getIs_admin()==false }">
			用户
		</c:when>
		
	</c:choose>

,${u.getUsername()}进入CRM管理系统
<c:choose>
<c:when test="${u.getIs_admin()==false }">
			,请你尽快完善信息
		</c:when>
</c:choose>
</h1>
</body>
</html>