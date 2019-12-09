<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户修改页面</title>
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
 function  Form(){
	var id_num = $("#id_num").val();
	var username = $("#username").val();
	var password = $("#password").val();
	var pass = $("#pass").val();
	var mobile = $("#mobile").val();
	var email = $("#email").val();
	var age = $("#age").val();
	var tel = $("#tel").val();
	var card_num = $("#card_num").val();
	var address = $("#address").val();
	
	var  reg = /^[\u4E00-\u9FA5]{2,4}$/;
	var pw =/^[a-zA-Z0-9]{4,8}$/;
	var mailbox = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
	var age1 = /^(?:[1-9][0-9]?|1[01][0-9]|110)$/;
	var telephone = /^0\d{2,3}-?\d{7,8}$/;
	var salary = /^([1-9]{1})(\d{14}|\d{18})$/;
	if ( (( password != "") && (pass == "")) || ((password=="") && (pass!="")) ){
	alert("如需修改密码需要上次登录密码验证");
	return false;
	}
	if(!reg.test(username) || username.length==0){
		
		$("#i").html('<i style="color: red"><i style="color:red">* </i>用户名必填</i>')
		$("#username").val(username);
		return false;
	}else if(!pw.test(password) && username.length==0){
		alert("df");
		$("#ii").html('<i style="color: red"><i style="color:red">* </i>密码格式不对,密码由4～8数字字母组成</i>')
		$("#password").val(password);
		return false;
	}else if( mobile.length==0){
		$("#i3").html('<i style="color: red"><i style="color:red">* </i>手机号必填</i>')
		$("#mobile").val(mobile);
		return false;
	}else if(!mailbox.test(email) || email.length==0){
		$("#i7").html('<i style="color: red"><i style="color:red">* </i>邮箱必填 格式为123456@qq.com</i>')
		$("#email").val(email);
		return false;
	}else if(id_num.length==0){
		$("#i4").html('<i style="color: red"><i style="color:red">* </i>身份证号必填</i>')
		$("#id_num").val(id_num);
		return false;
	}else if(!age1.test(age) || age.length==0){
		$("#age1").html('<i style="color: red"><i style="color:red">* </i>年龄不符合标准</i>')
		$("#age").val(age);
		return false;
	}else if(!telephone.test(tel) || tel.length==0){
		$("#i5").html('<i style="color: red"><i style="color:red">* </i>固定电话必填,格式为010-12345678</i>')
		$("#tel").val(tel);
		return false;
	}else if(!salary.test(card_num) || card_num.length==0){
		$("#i6").html('<i style="color: red"><i style="color:red">* </i>工资卡必填</i>')
		$("#card_num").val(card_num);
		return false;
	}else if( address.length==0){
		$("#i8").html('<i style="color: red"><i style="color:red">* </i>地址必填</i>')
		$("#address").val(address);
		return false;
	}
	return true;
}
</script>
<body>

<form action="save?service=save" method="post" id="from" onsubmit="return Form()">
	<c:choose>
		<c:when test="${user.user_id!=null}">
			<h4>修改用户</h4>
		</c:when>
		<c:otherwise>
			<h4>新增用户</h4>			
		</c:otherwise>
	</c:choose>

	<table border="1" style="border-collapse:collapse; border-color: #DCDCDC">
		<tr>
			<c:choose>
					<c:when test="${user.user_id!=null}">
						<td class="td">员工ID</td>
						<td class="td1">&nbsp;<input type="text" name="user_id" readonly value="${user.user_id}"> </td>
					</c:when>
					<c:otherwise>
						<td class="td">员工ID</td>
						<td class="td1">&nbsp;<input type="hidden"  readonly > </td>
					</c:otherwise>
				</c:choose>
				<td class="td">用户名</td>
				<td class="td1">&nbsp;<input type="text" id="username" name="username" placeholder="请填写用户名" value="${user.username}" >
				 <i id="i"><i style="color: red;">* </i> 请输入用户名只能为汉字2～4</i></td>
			</tr>
			<tr>
				
				<td class="td">请输入旧密码</td>
				<td class="td1">&nbsp;<input type="text" id="pass" name="pass"  placeholder="请填写旧密码" >
					<i id="i1">请输入上次登入密码</i>
				</td>	
				<td class="td">请输入新密码</td>
				<td class="td1">
					<div id="id1" style="width:419px ; float:right;">
						<input type="text" id="password" name="password"  placeholder="请填写新密码" >
						<i id="i2">密码由4～8数字字母组成</i>
					</div>
				</td>	
			
		</tr>
		
		<tr>
			<td class="td">性别</td>
			<td class="td1" >&nbsp;
				<input type="radio" value="true" name="is_male" checked <c:if test="${user.is_male==true}">checked</c:if>>男
				<input type="radio" value="false" name="is_male" <c:if test="${user.is_male==false}">checked</c:if>>女
			</td>
			<td class="td">手机号</td>
			<td class="td1">&nbsp;<input type="text" id="mobile" name="mobile" placeholder="请填写手机号" value="${user.mobile }">
				<i id="i3"><i style="color: red;">* </i> 请输入11位的手机号</i>
			</td>
		</tr>
		<tr>
			<td class="td">身份证号</td>
			<td class="td1">&nbsp;<input type="text" id="id_num"  name="id_num"  placeholder="请填写身份证号" value="${user.id_num }" style="width:200px;">
				<i id="i4"><i style="color: red;">* </i> 请输入15～18位的身份证号</i>
			</td>
			<td class="td">年龄</td>
			<td class="td1">&nbsp;<input type="text" id="age" name="age" placeholder="请填写年龄" value="${user.age }">
				<i id="age1"><i style="color: red;">* </i></i>
			</td>
		</tr>
		<tr>
			<td class="td">固定电话</td>
			<td class="td1">&nbsp;<input type="text" id="tel" name="tel" placeholder="请填写固定电话" value="${user.tel }">
				<i id="i5"><i style="color: red;">* </i> 请输入固定电话格式为:010-12345678</i>
			 </td>
			<td class="td">爱好</td>
			<td class="td1">&nbsp;<input type="text" name="hobby" placeholder="请填写爱好" value="${user.hobby }"> </td>
		</tr>
		<tr>
			<td class="td">电子邮箱</td>
			<td class="td1">&nbsp;<input type="text" id="email" name="email" placeholder="请填写电子邮箱" value="${user.email }" style="width:200px;"> 
				<i id="i7"><i style="color: red;">* </i> 请输入电子邮箱格式为123456@qq.com</i>
			</td>
			<td class="td">工资卡号</td>
			<td class="td1">&nbsp;<input type="text" id="card_num" name="card_num" placeholder="请填写工资卡号" value="${user.card_num }"> 
				<i id="i6"><i style="color: red;">* </i> 请输入工资卡号以银行卡为准</i>
			</td>
		</tr>
		<tr>
			<td class="td">民族</td>
			<td class="td1">&nbsp;<input type="text" name="nation" placeholder="请填写民族" value="${user.nation }"></td>
			<td class="td">地址</td>
			<td class="td1">&nbsp;<input  type="text" id="address" name="address" value="${user.address }" placeholder="请填写地址" style="width:240px;">
				<i id="i8"><i style="color: red;">* </i> 请输入填写详情住址(大街)</i>
			</td>
		</tr>
		<tr>
			<td class="td">学历</td>
				<td class="td1">&nbsp;
					<select name="education" style="font-size:12px; height: 25px;">
						<option value="1" <c:if test="${user.education==1}">selected</c:if>>小学</option>			
						<option value="2" <c:if test="${user.education==2}">selected</c:if>>初中</option>			
						<option value="3" <c:if test="${user.education==3}">selected</c:if>>高中</option>			
						<option value="4" <c:if test="${user.education==4}">selected</c:if>>专科</option>			
						<option value="5" <c:if test="${user.education==5}">selected</c:if>>本科</option>			
						<option value="6" <c:if test="${user.education==6}">selected</c:if>>硕士</option>			
						<option value="7" <c:if test="${user.education==7}">selected</c:if>>博士</option>						
					</select> 
				</td>
			<td class="td">婚姻状况</td>
			<td class="td1">&nbsp;<select name="marry" style="font-size:12px; height: 25px;">
					<option value="0" selected <c:if test="${user.marry==0}">selected</c:if>>未婚</option>			
					<option value="1" <c:if test="${user.marry==1}">selected</c:if>>已婚</option>			
					<option value="-1" <c:if test="${user.marry==-1}">selected</c:if>>离异</option>			
				</select>  
			</td>
		</tr>
		<tr>
			<td style=" height:100px;border-color: #DCDCDC;" >备注</td>
			<td colspan="3"  style="border-color: #DCDCDC;">
				&nbsp;<input type="text" name="remark" style=" width:98% ;height:90px" placeholder="请填写备注" value="${user.remark }">
			</td>
		</tr>
		<tr>
		
			<td colspan="4" align="center" style=" height:50px">
			
			<input type="hidden" id="hid" value="${u.user_id}"/>
			<input type="hidden" id="hid3" value="${user.mobile }">
			<input type="hidden" id="hid4" value="${user.id_num }">
				<input type="submit" id="subi" onclick="sub()" value="保存" style="height:28px ; width:55px;color:#FFFFFF;background-color:#228fbd;border:none;border-radius: 4px; ">
				&nbsp;&nbsp;
				<input type="button" onclick="goback()" value="返回" style="height:28px ; width:55px;color:#000000;background-color:#C0C0C0;border:none;border-radius: 4px; ">
			</td>
			
		</tr>
	</table>
</form> 
</body>
<script type="text/javascript">
$(function(){
	$("#id1").hide();
})
	$().ready(function(){
		var name= $("#username").val();
		$("#username").blur(function(){
			var flag = false;
			$.post("UserController?service=findByUserId",function(data){
				for(var i=0;i< data.length-1;i++ ){	
				 if($("#username").val() == JSON.parse(data)[i].username){
					flag = true;
					break;
				 }
				}
				 if(flag){
					 $("#i").text("用户名已存在,请重新输入");
					 $("#username").val(name);
				 }
			})
			if(!flag){
				 $("#i").text("");
			}
		})
		$("#pass").blur(function(){
			var flag = false;
			$.post("UserController?service=findByUserId",function(data){
				for(var i=0;i< data.length-1;i++ ){	
					
					if($("#pass").val()==JSON.parse(data)[i].password){
						flag = true;break;
					}
				}
				if(flag){
					 $("#i1").text("密码一致");
					 $("#id1").show(); 
				 }
			})
			if(!flag){
				 $("#i1").text("两次密码不一致,请重新输入");
				 $("#id1").hide();
				 $("#password").val("");
			}
		})
		$("#mobile").blur(function(){
			var mobile = $("#mobile").val();
			var phone = /^1[3456789]\d{9}$/;
			if(!phone.test(mobile) && $("#mobile").val()==""){
				$("#i3").html('<i><i style="color:red">* </i>请输入11位的手机号</i>')
				$("#mobile").val("");
			}else{
				$.post("UserController?service=findByUserId",function(data){
					for(var i=0;i< data.length-1;i++ ){
					 if($("#mobile").val() == JSON.parse(data)[i].mobile && $("#mobile").val()!=""){
						 $("#i3").html('<i style="color: red">手机号已存在</i>')
						
						 $("#mobile").val($("#hid3").val())
						break;
					 }else{
						 $("#i3").html('<i style="color: red"></i>')
					 }
					}
				})
			}
		})
		
		$("#id_num").blur(function(){
			var id_num = $("#id_num").val();
			var number = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			if(!number.test(id_num) && $("#id_num").val()==""){
				$("#i4").html('<i><i style="color:red">* </i>请输入15～18位的身份证号</i>')
				$("#id_num").val("");
			}else{
				$.post("UserController?service=findByUserId",function(data){
					for(var i=0;i< data.length-1;i++ ){
					 if($("#id_num").val() == JSON.parse(data)[i].id_num && $("#id_num").val()!=""){
						 $("#i4").html('<i style="color: red">身份证号不能重复</i>')
						 $("#id_num").val($("#hid4").val());
						break;
					 }else{
						 $("#i4").html('<i style="color: red"></i>')
					 }
					}
				})
			}
			
			
		
		})
		
		
		
			
	})
	
	function goback(){
	location.href="welcome.jsp";
	}

		 
</script>
</html>