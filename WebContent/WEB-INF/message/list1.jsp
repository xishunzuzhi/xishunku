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
<h3>无邮件</h3><br>
	<table id="dg" class="easyui-datagrid" style="height:500px;" >   
    <thead>   
        <tr >              
           <th data-options="field:'number'" width="80">编号</th>      
            <th data-options="field:'message_id'" width="80">邮件ID</th>     
            <th data-options="field:'subject'" width="100">邮件主题</th>   
            <th data-options="field:'content'" width="140">内容</th>   
            <th data-options="field:'sender'" width="100">发件人</th>   
            <th data-options="field:'send_delete'" width="200">发件人删除</th>   
            <th data-options="field:'send_status'" width="130">发布状态</th>   
            <th data-options="field:'save_time'" width="100">保存草稿时间</th>   
            <th data-options="field:'send_time'" width="130">发送时间</th>   
            <th data-options="field:'send_update_time'" width="100">发送方更新时间</th>   
            <th data-options="field:'receiver'" width="100">接收人</th>   
            <th data-options="field:'receive_delete'" width="100">收件人删除</th>   
            <th data-options="field:'receive_status'" width="100">收件状态</th>   
            <th data-options="field:'receive_update_time'" width="100">收件方更新时间</th>   
           
    </thead>   
    <tbody>   
    </tbody>   
</table> 
</body>
</html>