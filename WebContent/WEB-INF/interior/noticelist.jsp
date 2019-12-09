<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公告列表</title>
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
<h3>公告列表</h3><br>
	<form action="NoticeController?service=show" method="post">
		<span class="span">
			搜索公告主题:<input type="text" name="u_name">&nbsp;&nbsp;&nbsp;
			搜索字段:<select name="fuzzyQuery" style="font-size:12px; ">
					<option value="subject">公告主题</option>
					<option value="text">公告内容</option>
			</select>&nbsp;&nbsp;
			<input type="submit" value="搜索">
		</span>
	</form>
	<a target="iframe_a" href="NoticeController?service=addNotice"  class="easyui-linkbutton" style=" background:#228fbd;color:#C0C0C0;position:absolute ;top:45px;right: 10px">发布公告</a>  
	<table id="dg" class="easyui-datagrid" style="height:500px;" >   
    <thead>   
        <tr >              
           <th data-options="field:'number'" width="80">编号</th>      
            <th data-options="field:'notice_id'" width="80">公告信息ID</th>     
            <th data-options="field:'receive_id'" width="100">接收部门Id</th>   
            <th data-options="field:'subject'" width="100">公告主题</th>   
            <th data-options="field:'text'" width="100">公告内容</th>   
            <th data-options="field:'pub_time'" width="140">发布时间</th>   
            <th data-options="field:'expire_time'" width="100">过期时间</th>   
            <th data-options="field:'status'" width="200">公告状态</th>   
            <th data-options="field:'remark'" width="130">备注</th>   
            <th data-options="field:'create_time'" width="100">添加时间</th>   
            <th data-options="field:'creater'" width="130">添加人</th>   
            <th data-options="field:'update_time'" width="100">修改时间</th>   
            <th data-options="field:'updater'" width="100">修改人</th>   

    </thead>   
    <tbody>   
		<c:forEach begin="0" end="${list.size()-1}" var = "i">
			<tr>
				<td>${i+1}</td>
				<td>${list[i].notice_id}</td>
				<td>${list[i].receive_id}</td>
				<td>${list[i].subject}</td>
				<td>${list[i].text}</td>
		
				<td><fmt:formatDate value="${list[i].pub_time}" /></td>
				<td><fmt:formatDate value="${list[i].expire_time}" /></td>
				
				
				<td>${list[i].status}</td>
				<td>${list[i].remark}</td>
				<td><fmt:formatDate value="${list[i].create_time}" /></td>
				<td>${list[i].creater}</td>
				<td><fmt:formatDate value="${list[i].update_time}" /></td>
				<td>${list[i].updater}</td>
				<td>
				<a target="iframe_a" href="NoticeController?service=update&id=${list[i].notice_id}&receive_id=${list[i].receive_id}" onclick="return update(${list[i].status})" ><img src="easyui/themes/icons/pencil.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
			    <a  href="NoticeController?service=delete&id=${list[i].notice_id}" onclick="return deleteUser(${list[i].status})"><img src="easyui/themes/icons/cancel.png"></a>
					
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
						<a href="NoticeController?service=show&page=${page-1}">上一页</a>
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
					<a href="NoticeController?service=show&page=${page+1}">下一页</a>
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
			
			function to_page(i){
				if(i){
					alert("已经是最后一页了");
					return;
				}
				alert("已经是第一页了");
			}
</script>
</html>