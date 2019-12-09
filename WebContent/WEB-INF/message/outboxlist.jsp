<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发件箱</title>
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
<body>
	<h3>发件箱列表</h3><br>
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
		
			<c:choose>
				<c:when test="${list[i].send_delete==0}"></c:when>
				<c:otherwise>
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
				     	<a href="NoticeController?service=delete&addMessage=true&message_id=${list[i].message_id}" onclick="return deleteUser()"><img src="easyui/themes/icons/delete_folder.png"></a>
					</td>	
					
				</tr>
				</c:otherwise>
			</c:choose>
			
		</c:forEach>
    </tbody>   
</table> 
	<div  style="height:9%; width:102%;position: fixed;bottom:0; background: #FFFFFF;">
		<fmt:parseNumber value="${Math.ceil(totalCount/10)}" var="Count" integerOnly="true"/>
		<div>共有${totalCount}条记录，
	
		${Count} 页 </div>
		<div style="background:#FFFFFF;height:100px; width:20%;position:absolute ;top:0%;right: 0%; ">
			<ul class="pagination">
			<li>
				<c:choose>
					<c:when test="${page!=1}">
						<a href="NoticeController?service=queryDrafts&addMessage&page=${page-1}">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:to_page()">上一页</a>
					</c:otherwise>
				</c:choose>
				</li>
				<li class="paginate_button active">
					<a  href="#">${page}</a>
				</li>	
				<li>
				<c:choose>
					<c:when test="${page!=Count}">
					<a href="NoticeController?service=queryDrafts&addMessage&page=${page+1}">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:to_page(true)">下一页</a>
					</c:otherwise>
				</c:choose>
					
			</li>
		</ul>
		</div>
	</div>
	
	
	
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