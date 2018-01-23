<%@page import="java.lang.annotation.Target"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	 <script src="${APP_PATH }/static/js/jquery1.12.4.js"></script>
  	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div class="row">
   <div class="col-md-4 col-md-offset-4">
   		<button type="button" class="btn btn-info" id="test_btn">
   		sendRequest
   </button>
	   <form class="form-inline" id="test_form">
		  <div class="form-group">
		    <label >Name</label>
		    <input type="text" class="form-control" id="exampleInputName2" name="empName" placeholder="305130">
		  </div>
		  <div class="form-group">
		    <label >time</label>
		    <input type="text" class="form-control" id="exampleInputtime2" name="empTime"  placeholder="2.5">
		  </div>
		    <div class="form-group">
		    <label >date</label>
		    <input type="date" class="form-control" id="exampleInputtime2"   placeholder="yyyy-MM-dd">
		  </div>
		</form>
   </div>
   </div>
   <script type="text/javascript">
   		$("#test_btn").click(function(){
   			console.log($("#test_form").serialize());
   			$.ajax({
   				url:"${APP_PATH}/emp",
   				data:$("#test_form").serialize(),
   				type:"POST",
   				success:function(result){
   					
   					alert(result.msg);
   				}
   			});
   		});
   </script>
  </body>
</html>
