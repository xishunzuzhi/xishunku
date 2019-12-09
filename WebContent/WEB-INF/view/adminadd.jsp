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
 function  Form(){
	
	var username = $("#username").val();
	var password = $("#password").val();


	
	var  reg = /^[\u4E00-\u9FA5]{2,4}$/;
	var pw =/^[a-zA-Z0-9]{4,8}$/;
	
	if(!reg.test(username) || username.length==0){
		$("#i").html("<i style='color:red';>* 用户名必填</i>")
		return false;
	}else if(!pw.test(password) || password.length==0){
		$("#ii").html("<i style='color:red';>密码必填</i>")
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
						<i id="i1"></i>
					</c:otherwise>
				</c:choose>
			
			<td class="td">部门ID</td>
			<td class="td1">&nbsp;
				<select id="department_id1" name="department_id"  style="font-size:12px; height: 25px; width: 70px;">		
				
				</select> 
			 </td>
		</tr>
		<tr>
		
		<td class="td">角色ID</td>
			<td class="td1">&nbsp;
			<select id="role_id1" name="role_id"  style="font-size:12px; height: 25px; width: 70px;">
							
			</select> 
			</td>
			<td class="td">用户名</td>
				<td class="td1">&nbsp;<input type="text" id="username" name="username"  placeholder="请填写用户名" value="${user.username}" >
				 <i id="i"><i style="color: red;">* </i>请输入用户名只能为汉子2～4</i></td>
				 
	
		</tr>
		<tr>
			<td class="td">是否管理员</td>
			<td class="td1" >&nbsp;
				<input type="radio" value="false" name="is_admin"  checked<c:if test="${user.is_admin==false}">checked</c:if>>否
				<input type="radio" value="true" name="is_admin"  <c:if test="${user.is_admin==true}">checked</c:if>>是
			</td>
			<td class="td">密码</td>
			<td class="td1">&nbsp;<input type="text" id="password" name="password" placeholder="请填写密码" value="${user.password }">
				 <i id="ii"><i style="color: red;">* </i>密码由4～8数字字母组成</i>
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
				<i id="i3"></i>
			</td>
		</tr>
		<tr>
			<td class="td">是否为系统内置(不能删除)</td>
			<td class="td1" >&nbsp;
				<input type="radio" value="true" name="is_system" <c:if test="${user.is_system==true}">checked</c:if>>是
				<input type="radio" value="false" name="is_system" checked <c:if test="${user.is_system==false}">checked</c:if>>否
			</td>	
			<td class="td">年龄</td>
			<td class="td1">&nbsp;<input type="text" id="age" name="age" placeholder="请填写年龄" value="${user.age }"></td>
		</tr>
		<tr>
			<td class="td">固定电话</td>
			<td class="td1">&nbsp;<input type="text" id="tel" name="tel" placeholder="请填写固定电话" value="${user.tel }"> </td>
			<td class="td">身份证号</td>
			<td class="td1">&nbsp;<input type="text" id="id_num"  name="id_num"  placeholder="请填写身份证号" value="${user.id_num }" style="width:200px;">
				<i id="i4"></i>
			</td>
		</tr>
		<tr>
			<td class="td">电子邮箱</td>
			<td class="td1">&nbsp;<input type="text" id="email" name="email" placeholder="请填写电子邮箱" value="${user.email }" style="width:300px;"> </td>
			<td class="td">工资卡号</td>
			<td class="td1">&nbsp;<input type="text" id="card_num" name="card_num" placeholder="请填写工资卡号" value="${user.card_num }"> </td>
		</tr>
		
		<tr>
			<td class="td">爱好</td>
			<td class="td1">&nbsp;<input type="text" name="hobby" placeholder="请填写爱好" value="${user.hobby }"> </td>
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
		</tr>
		<tr>
			<td class="td">民族</td>
			<td class="td1">&nbsp;<input type="text" name="nation" placeholder="请填写民族" value="${user.nation }"></td>
			<td class="td">地址</td>
			<td class="td1">&nbsp;<input  type="text" name="address" value="${user.address }" placeholder="请填写地址" style="width:350px;"></td>
		</tr>
		<tr>
			<td class="td">婚姻状况</td>
			<td class="td1">&nbsp;<select name="marry" style="font-size:12px; height: 25px;">
					<option value="0" selected <c:if test="${user.marry==0}">selected</c:if>>未婚</option>			
					<option value="1" <c:if test="${user.marry==1}">selected</c:if>>已婚</option>			
					<option value="-1" <c:if test="${user.marry==-1}">selected</c:if>>离异</option>			
				</select>  
			</td>
			<td class="td">用户状态</td>
			<td class="td1">&nbsp;<select name="status" style="font-size:12px; height: 25px;">
					<option value="1" <c:if test="${user.status==1}">selected</c:if>>已创建(未激活,不能登录)</option>			
					<option value="2" selected <c:if test="${user.status==2}">selected</c:if>>正常(已激活)</option>			
					<option value="-1" <c:if test="${user.status==-1}">selected</c:if>>已禁用(不能登录)</option>			
					<option value="-2" <c:if test="${user.status==-2}" >selected</c:if>>已删除</option>			
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
			
			<input type="hidden" id="hid" value="${user.role_id}"/>
			<input type="hidden" id="hid1" value="${user.department_id}"/>
			<input type="hidden" id="hid2" value="${user.username }">
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
var flag = false;
	$().ready(function(){
		
		$("#username").blur(function(){
			$.post("UserController?service=findByUserId",function(data){
				for(var i=0;i< data.length-1;i++ ){
					
				 if($("#username").val() == JSON.parse(data)[i].username  ){
					 flag = true;
					break;
				 }else{
					 if($("#username").val()!=""){
						 $("#i").html("<i style='color:red';>✔</i>")
					 }else{
						 $("#i").html("<i style='color:red';>*</i>")
					 }
				 }
				}
				 if(flag){
				 		if($("#hid2").val()!=""){
						$("#username").val($("#hid2").val())
					}else{
						$("#username").val("")
					}
						$("#i").html("<i style='color:red';>用户名已存在,请重新输入</i>")
				}
			})
		})
		$("#mobile").blur(function(){
			var mobile = $("#mobile").val();
			var phone = /^1[3456789]\d{9}$/;
			if(!phone.test(mobile) && $("#mobile").val()!=""){
				$("#i3").html('<i>请输入11位的手机号</i>')
				$("#mobile").val("");
			}else{
				$.post("UserController?service=findByUserId",function(data){
					for(var i=0;i< data.length-1;i++ ){
					 if($("#mobile").val() == JSON.parse(data)[i].mobile && $("#mobile").val()!=""){
						 $("#i3").html('<i style="color: red">手机号已存在</i>')
						
						 $("#mobile").val($("#hid3").val())
						break;
					 }
					}
				})
			}
		})
		$("#id_num").blur(function(){
			var id_num = $("#id_num").val();
			var number = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			if(!number.test(id_num) && $("#id_num").val()!=""){
				$("#i4").html('<i>请输入15～18位的身份证号</i>')
				$("#id_num").val("");
			}else{
				$.post("UserController?service=findByUserId",function(data){
					for(var i=0;i< data.length-1;i++ ){
					 if($("#id_num").val() == JSON.parse(data)[i].id_num && $("#id_num").val()!=""){
						 $("#i4").html('<i style="color: red">身份证号无效</i>')
						 $("#id_num").val($("#hid4").val());
						break;
					 }
					}
				})
			}
			
			
		
		})
		
		
	})
	function goback(){
	location.href="UserController?service=show"
	}

	$(function(){
		$.post("UserController?service=findByRoleId",
		function(data){
			if($("#hid").val()!=""){
				$("#role_id1").append("<option value="+JSON.parse(data)[$("#hid").val()-4].role_id+">"+JSON.parse(data)[$("#hid").val()-4].role_name+"</option>");
			}else{
				$("#role_id1").append("<option value=4>"+JSON.parse(data)[0].role_name+"</option>");
			}
			for(var i=0;i< data.length-1;i++ ){
				
					$("#role_id1").append("<option value='"+JSON.parse(data)[i].role_id+"'>"+JSON.parse(data)[i].role_name+"</option>" );
			};	
		})
		
		$.post("UserController?service=findByDepartmentId",
		function(data){
			if($("#hid1").val()!=""){
				$("#department_id1").append("<option value="+JSON.parse(data)[$("#hid1").val()-4].department_id+">"+JSON.parse(data)[$("#hid1").val()-4].department_name+"</option>");
			}else{
				$("#department_id1").append("<option value=4>"+JSON.parse(data)[0].department_name+"</option>");
			}
			for(var i=0;i< data.length-1;i++ ){
					$("#department_id1").append("<option value='"+JSON.parse(data)[i].department_id+"'>"+JSON.parse(data)[i].department_name+"</option>" );
			};	
		})
	})

		 
</script>
</html>