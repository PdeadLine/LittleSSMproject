<%@page import="java.lang.annotation.Target"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	 <script src="${APP_PATH }/static/js/jquery1.12.4.js"></script>
  	<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  <div class="container">
  	<!-- 标题 -->
	<div class="row">
  			<div class="col-md-4 "><h1>MYWorkTime</h1></div>
  		</div>
  
  <!--删除和修改  -->
	<div class="row">
		  		<div class="col-md-2 col-md-offset-10">
		  			<button class="btn btn-success">新增</button>
		  			<button class="btn btn-danger">删除</button>
		  		</div>
		  	</div>
	<!--主体内容  -->	  	
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-hover">
				<tr>
					<th>ID</th>
					<th>工号</th>
					<th>加班时间</th>
					<th>日期</th>
					<th>部门</th>
					<th>操作</th>
				</tr>
			
				<c:forEach items="${pageInfo.list }" var="emp" >
					<tr>
						<td>${ emp.empId}</td>
						<td>${emp.empName }</td>
						<td>${emp.empTime }</td>
						<td>
						<fmt:formatDate value="${emp.empDate }" pattern="yyyy-MM-dd"/>
						</td>
						<td>${emp.department.deptName }</td>
						<td>
							<button class="btn btn-info"><span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</span></button>
							<button class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span></button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- 分页 --> 
	<div class="row">
		<div class="col-md-6">
			<!-- 文本信息 -->
			<p class="text-muted">当前第${pageInfo.pageNum }页，总共${pageInfo.pages }页，总共${pageInfo.total }条记录</p>
		</div>
			<!--分页组件  -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  <li ><a href="${APP_PATH }/emps?pn=1">首页</a></li>
			  <c:if test="${pageInfo.hasPreviousPage }">
			  
			    <li>
			      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
				      </a>
					    </li>
			  </c:if>
				      <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
				      	<c:if test="${page_Num == pageInfo.pageNum }">
					   			 <li class="active"><a href="#">${page_Num }</a></li>
				      	</c:if>
				      	<c:if test="${page_Num != pageInfo.pageNum }">
					   			 <li ><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
				      	</c:if>
				      </c:forEach>
					   <c:if test="${pageInfo.hasNextPage }">
					   
					    <li>
				      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
					   </c:if>
			    <li ><a href="${APP_PATH }/emps?pn=${pageInfo.pages }">尾页</a></li>
			  </ul>
			</nav>
		</div>
	</div>
	 
	  </div>
  </body>
</html>
