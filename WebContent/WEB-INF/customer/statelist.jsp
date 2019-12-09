<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户状态列表</title>
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
<h3>客户状态列表</h3><br>
	<form action="UserController?service=show" method="post">
		<span class="span">
			年龄:<input type="text" name="age"  style="width: 40px">-->
			<input type="text" name="age1" style="width: 40px">&nbsp;&nbsp;&nbsp;
			
			搜索内容:<input type="text" name="u_name">&nbsp;&nbsp;&nbsp;
			根据内容选择字段:<select name="fuzzyQuery" style="font-size:12px;">
					<option value="username">姓名</option>
					<option value="address">地址</option>
					<option value="mobile">手机号</option>
					<option value="id_num">身份证号</option>
					
			</select>&nbsp;&nbsp;
			<input type="submit" value="搜索">
		</span>
	</form>
	<a target="iframe_a" href="SourceStateController?service=addCustomer"  class="easyui-linkbutton" style=" background:#228fbd;color:#C0C0C0;position:absolute ;top:45px;right: 10px">添加客户</a>  
	<table id="dg" class="easyui-datagrid" style="height:500px;" >   
    <thead>   
        <tr >              
           <th data-options="field:'code1'" width="80">编号</th>      
            <th data-options="field:'customer_state_id'" width="80">状态ID</th> 
            <th data-options="field:'customer_state_name'" width="80">状态名称</th>   
            <th data-options="field:'customer_state_desc'" width="150">状态描述</th>   
            <th data-options="field:'status'" width="60">状态</th>   
            <th data-options="field:'remark'" width="130">备注</th>   
            <th data-options="field:'create_time'" width="80">添加时间</th>   
            <th data-options="field:'creater'" width="60">添加人</th>   
            <th data-options="field:'update_time'" width="80">修改时间</th>   
            <th data-options="field:'updater'" width="60">修改人</th>     
            <th data-options="field:'code26'" width="80">操作</th>   
    </thead>   
    <tbody>   
		<c:forEach begin="0" end="${list.size()-1}" var = "i">
					<tr>
						<td>${i+1}</td>
						<td>${list[i].customer_state_id}</td>
						<td>${list[i].customer_state_name}</td>
						<td>${list[i].customer_state_desc}</td>
						<c:choose>
							<c:when test="${list[i].status==2}"><td>正常</td></c:when>
							<c:when test="${list[i].status==-2}"><td>已删除</td></c:when>
						</c:choose>
						<td>${list[i].remark}</td>
						<td><fmt:formatDate value="${list[i].create_time}"/></td>
						<td>${list[i].creater}</td>
						<td><fmt:formatDate value="${list[i].update_time}"/></td>
						<td>${list[i].updater}</td>
						<td>
							<a target="iframe_a" href="SourceStateController?service=updateCustomer&customer_id=${list[i].customer_state_id}" onclick="return update(${list[i].status})" ><img src="easyui/themes/icons/pencil.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
					        <a  href="SourceStateController?service=deleteCustomer&customer_id=${list[i].customer_state_id}" onclick="return deleteCustomer(${list[i].status})"><img src="easyui/themes/icons/cancel.png"></a>
						</td>			
					</tr>
		
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
						<a href="SourceStateController?service=showCustomer&page=${page-1}">上一页</a>
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
					<a href="SourceStateController?service=showCustomer&page=${page+1}">下一页</a>
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
			
			function update(i){
			
					if(i!=-2){
						if(confirm("是否要修改？")){
							return true;
						}
					}else{
						alert("已删除");
					}
				
				return false;	
			}
			function deleteCustomer(i){
			
					if(i!=-2){
						if(confirm("是否要删除？")){
							return true;
						}
					}else{
						alert("已删除");
					}
				
				return false;	
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