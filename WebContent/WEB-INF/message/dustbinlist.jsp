<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href= "easyui/themes/icon.css"  >  
</head>
<script type="text/javascript" src= "easyui/jquery-3.4.1.min.js"></script>   
<script type="text/javascript" src=  "easyui/jquery.easyui.min.js" ></script>  
<style type="text/css">
	.span{
	position:absolute ;
	top:53px;
	left:30px;
	font-family:宋体;
	font-size:12px;
	}


.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 0;
    border-radius: 4px;
}
.pagination>li {
    display: inline;
}

.pagination>li>a, .pagination>li>span {
    position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #888;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, 
.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 3;
    color: #fff;
    cursor: default;
    background-color: #337ab7;
    border-color: #337ab7;
}

</style>
<body >
	<h3>垃圾箱列表</h3><br>
	<form action="RoleController?service=show&department_id" method="post">
		<span class="span">
			搜索内容:<input type="text" name="u_name">&nbsp;&nbsp;&nbsp;
			搜索字段:<select style="font-size:12px; ">
					<option>--请选择--</option>
					<option>用户名1</option>
			</select>&nbsp;&nbsp;
			<input type="submit" value="搜索">
		</span>
	</form>
	<a target="iframe_a" href="RoleController?service=addUser&department_id"  class="easyui-linkbutton" style=" background:#228fbd;color:#C0C0C0;position:absolute ;top:45px;right: 10px">添加部门</a>  
	<table id="dg" class="easyui-datagrid" style="height:500px;" >   
    <thead>   
        <tr >              
           <th data-options="field:'number'" width="80">编号</th>      
            <th data-options="field:'message_id'" width="80">邮件ID</th>     
            <th data-options="field:'subject'" width="100">邮件主题</th>   
            <th data-options="field:'content'" width="140">内容</th>   
            <th data-options="field:'sender'" width="100">发件人</th> 
             <th data-options="field:'receiver'" width="100">接收人</th>     
            <th data-options="field:'send_delete'" width="200">发件人删除</th>   
            <th data-options="field:'send_status'" width="130">发布状态</th>   
            <th data-options="field:'save_time'" width="100">保存草稿时间</th>   
            <th data-options="field:'send_time'" width="130">发送时间</th>   
            <th data-options="field:'send_update_time'" width="100">发送方更新时间</th>   
           
            <th data-options="field:'receive_delete'" width="100">收件人删除</th>   
            <th data-options="field:'receive_status'" width="100">收件状态</th>   
            <th data-options="field:'receive_update_time'" width="100">收件方更新时间</th>   
            <th data-options="field:'操作'" width="100">操作</th>   
           
    </thead>   
    <tbody>   
		<c:forEach begin="0" end="${list.size()-1}" var = "i">
			<tr>
				<td>${i+1}</td>
				<td>${list[i].message_id}</td>
				<td>${list[i].subject}</td>
				<td>${list[i].content}</td>
				<td>${list[i].sender}</td>
				<td>${list[i].receiver}</td>	
				<c:choose>
					<c:when test="${list[i].send_delete==2}"><td>正常</td></c:when>
					<c:when test="${list[i].send_delete==0}"><td>删除到垃圾箱</td></c:when>
					<c:when test="${list[i].send_delete==-2}"><td>彻底删除</td></c:when>
				</c:choose>
				
				<c:choose>
					<c:when test="${list[i].send_status==0 }"><td>草稿</td></c:when>
					<c:when test="${list[i].send_status==2 }"><td>已发送</td></c:when>
				</c:choose>
				
				
				<td><fmt:formatDate value="${list[i].save_time}" /></td>
				<td><fmt:formatDate value="${list[i].send_time}" /></td>		
				<td><fmt:formatDate value="${list[i].send_update_time}" /></td>
			
				<c:choose>
					<c:when test="${list[i].receive_delete==2}"><td>正常</td></c:when>
					<c:when test="${list[i].receive_delete==0}"><td>删除到垃圾箱</td></c:when>
					<c:when test="${list[i].receive_delete==-2}"><td>彻底删除</td></c:when>
				</c:choose>
			
				<c:choose>
					<c:when test="${list[i].receive_status==0 }"><td>未读</td></c:when>
					<c:when test="${list[i].receive_status==2 }"><td>已读</td></c:when>
				</c:choose>
				
				<td><fmt:formatDate value="${list[i].receive_update_time}" /></td>
				<td>
					<a target="iframe_a" href="NoticeController?service=restoreMessage&message_id=${list[i].message_id}" onclick="return update()" ><img src="easyui/themes/icons/Document.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			        <a href="NoticeController?service=restoreMessage&addMessage&message_id=${list[i].message_id}&receiver=${list[i].receiver}" onclick="return deleteUser()"><img src="easyui/themes/icons/delete_file.png"></a>
				</td>
			</tr>
		</c:forEach>
    </tbody>   
</table> 

	
	
	
</body>
<script type="text/javascript">
			$(function(){
				    $(document).ready(function(){
				        fitCoulms();
				    });
				    $(window).resize(function(){
				        fitCoulms();
				    });
				})
				function fitCoulms(){
				    $('#dg').datagrid({
				        fitColumns:false
				    });
				}
			function update(){
				
					if (confirm("是否要接收文件？")) {
						return true;
					}
					return false;
			}
			function deleteUser(i){
				if(i!=-2){
					if (confirm("是否要删除？")) {
						return true;
					}
					return false;
				}else{
					alert("已删除");
					return false;
				}
			}
			function to_page(i){
				if(i){
					alert("已经是最后一页了");
					return;
				}
				alert("已经是第一页了");
			}
</script>
</html>