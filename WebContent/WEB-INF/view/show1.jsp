<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户界面</title>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href= "easyui/themes/icon.css"  >   
</head>

<script type="text/javascript" src= "easyui/jquery-3.4.1.min.js"></script>   
<script type="text/javascript" src=  "easyui/jquery.easyui.min.js" ></script>  
  
  <style type="text/css">
 	.accordion .accordion-header .panel-title{
 		color:#fffffb;
 	}
 	.accordion .accordion-header{
 	background-color:#1a2933; 
 	}
 	.ul{
 	list-style-type:circle;
 	
 	}
 	.a2{
 	font-size:13px;
 	font-family:宋体;
 	color: #C0C0C0;
 	text-decoration:none;
 	}
 	a{
 		text-decoration:none;
 	}
  </style>
<body class="easyui-layout">   
    <div id="cc" data-options="region:'north'" style="height:60px; background:#337ab7;">
    
    <div style="height:30px;width:98%; background:#337ab7;position:absolute ;left:25px;top:23px ;">
       	<span style="color: #C0C0C0;font-family:粗体;font-size:15px;">智游客户关系管理系统</span>
       	
       	<span style="color: #C0C0C0;font-family:粗体;font-size:12px;position:absolute ;left:200px;top:2px">
	       	<a target="iframe_a" href="UserController?service=show">工作台</a>&nbsp;&nbsp;&nbsp;
	       	<a target="iframe_a" href="#">报表</a>&nbsp;&nbsp;&nbsp;
	       	<a target="iframe_a" href="#">客户信息</a>&nbsp;&nbsp;&nbsp;
	       	<a target="iframe_a" href="UserController?service=show">员工信息</a>&nbsp;&nbsp;&nbsp;
	       	<a target="iframe_a" href="NoticeController?service=show">公告信息</a>&nbsp;&nbsp;&nbsp;
	       	<a target="iframe_a" href="NoticeController?service=queryDrafts&addMessage">发件箱</a>
       	</span >
       
       	<a target="iframe_a" href="UserController?service=update&id=${u.user_id}" style="color: #C0C0C0;font-family:粗体;font-size:12px;position:absolute ;right:50px;top:1px;text-decoration:none;">
       	
       	<c:choose>
		<c:when test="${u.getIs_admin()==true }">管理员:</c:when>
		<c:when test="${u.getIs_admin()==false }">用户:</c:when>
		</c:choose>${u.getUsername()}</a>
       	<a href="quit" style="color: #C0C0C0;font-family:粗体;font-size:12px;position:absolute ;right:5px;top:1px;text-decoration:none;">退出</a>
    </div>
 
    </div>   
 
    <div data-options="region:'west'" style="width:215px; background:#1a2933;">
  		<div id="accordion"  style="background:#1a2933; ">   
	   		<div title="客户管理" style="background:#1a2933;">   
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="customerController?service=showCustomer" >
	        				客户信息
	        			</a>
	        		</li>	        		
	        	</ul>
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="#" >
	        				客户分配
	        			</a>
	        		</li>	        		
	        	</ul>
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="#" >
	        				客户关怀
	        			</a>
	        		</li>	        		
	        	</ul>
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="customerController?service=showCustomer&customer" >
	        				客户分类
	        			</a>
	        		</li>	        		
	        	</ul>
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="SourceStateController?service=showCustomer" >
	        				客户状态
	        			</a>
	        		</li>	        		
	        	</ul>
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="SourceStateController?service=showCustomer&customer" >
	        				客户来源
	        			</a>
	        		</li>	        		
	        	</ul>
	    	</div>  
	    	
	    	<div title="内部信息"   style="background:#1a2933;">   
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="InteriorMessageController?service=show" >
	        				公告管理
	        			</a>
	        		</li>	        		
	        	</ul>
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="InteriorMessageController?service=show&department" >
	        				部门管理
	        			</a>
	        		</li>	        		
	        	</ul>
	        	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="InteriorMessageController?service=showRole&user" >
	        				用户管理
	        			</a>
	        		</li>	        		
	        	</ul>  
	    	</div> 
	    	<div title="站内邮件"   style="background:#1a2933;">   
	       	 	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="NoticeController?service=addNotice&addMessage" >
	        				写邮件
	        			</a>
	        		</li>	        		
	        	</ul>
	       		<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="NoticeController?service=show&addMessage" >
	        				收件箱
	        			</a>
	        		</li>	        		
	        	</ul>
	       	 	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="NoticeController?service=queryDrafts&addMessage" >
	        				发件箱
	        			</a>
	        		</li>	        		
	        	</ul>
	       	 	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="NoticeController?service=queryDrafts&addMessage=true" >
	        				草稿箱
	        			</a>
	        		</li>	        		
	        	</ul>
	       	 	<ul class="ul">
	        		<li>
	        			<a target="iframe_a" class="a2" href="NoticeController?service=dustbin" >
	        				垃圾箱
	        			</a>
	        		</li>	        		
	        	</ul>
	    	</div>  
		</div>  
    </div>   
    <div data-options="region:'center'" style="padding:5px;background:#FFFFFF;">

		
		
		<iframe name="iframe_a" src="welcome.jsp"  width="100%" height="100%" style="border:none;frameborder:no;background:#FFFFFF;">
		
		</iframe> 
    </div>
  <div style="width: 86%;height:30px; background:#FFFFFF;position:absolute;bottom:0px;right:0px;">
			<span style="position:absolute;top:30%;right:39%;font-family:宋体;font-size:15px;color:#808080"> 智游育 ©2017 河南智游臻龙教育科技有限公司</span>
		</div>
</body>  
<script type="text/javascript">
$('#accordion').accordion({    
    animate:false,
    fit:true,
    border:false,
    selected: false
   
   
});  

</script>

</html>