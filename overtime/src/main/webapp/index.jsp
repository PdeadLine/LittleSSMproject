<%@page import="java.lang.annotation.Target"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/js/jquery1.12.4.js"></script>
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>

	<!-- 编辑加班模态框 -->
	<div class="modal fade" id="empEdtModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="edtModalLabel">编辑加班信息</h4>
				</div>
				<div class="modal-body">
					
					<form class="form-horizontal" >
						<div class="form-group">
							<label class="col-sm-2 control-label">工号:</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="emp_edt_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">加班时间:</label>
							<div class="col-sm-10">
								<input type="text" name="empTime" class="form-control"
									id="edtTime" placeholder="2.5"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">日期:</label>
							<div class="col-sm-10">
								<input type="text" name="empDate" class="form-control"
									id="edtDate" placeholder="示例：yyyy/MM/dd">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门:</label>
							<div class="col-sm-4">
								<select name="dId" class="form-control" >
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="emp_edt_btn" class="btn btn-primary">更改</button>
				</div>
			</div>
		</div>
	</div>





	<!-- 加班时间添加模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增加班信息</h4>
				</div>
				<div class="modal-body">
					<!-- 请求表单 -->
					<form class="form-horizontal" id="test_form">
						<div class="form-group">
							<label class="col-sm-2 control-label">工号:</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="inputName1" placeholder="305130"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">加班时间:</label>
							<div class="col-sm-10">
								<input type="text" name="empTime" class="form-control"
									id="inputTime1" placeholder="2.5"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">日期:</label>
							<div class="col-sm-10">
								<input type="text" name="empDate" class="form-control"
									id="inputDate1" placeholder="示例：yyyy/MM/dd">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">部门:</label>
							<div class="col-sm-4">
								<!--部门提交id即可  -->
								<select name="dId" class="form-control">
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="emp_save_btn" class="btn btn-primary">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-4 ">
				<h1>MYWorkTime</h1>
			</div>
		</div>

		<!--删除和修改  -->
		<div class="row">
			<div class="col-md-2 col-md-offset-10">
				<button class="btn btn-success" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_del_all">删除</button>
			</div>
		</div>
		<!--主体内容  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>ID</th>
							<th>工号</th>
							<th>加班时间</th>
							<th>日期</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
					<%-- 	<c:forEach items="${pageInfo.list }" var="emp" >
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
				</c:forEach> --%>
				</table>
			</div>
		</div>
		<!-- 分页 -->
		<div class="row">
			<div class="col-md-6" id="page_info_area">
				<!-- 文本信息 -->
				<%-- 当前第${pageInfo.pageNum }页，总共${pageInfo.pages }页，总共${pageInfo.total }条记录 --%>
			</div>
			<!--分页组件  -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<!-- ajax -->
	<script type="text/javascript">
						/*加载完成发送ajax请求  */	
					
						var page_info;
						$(function(){
						to_page(1);
						
					});
				/* 解析并显示员工数据 */
				function build_emps_table(result){
					//需要清空旧数据，才可以正常显示新的内容
					$("#emps_table tbody").empty();
					var emps = result.extend.pageInfo.list;
					$.each(emps,function(index,item){
						var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='checkItem'/>");
						var empIdTd = $("<td></td").append(item.empId);
						var empNameTd = $("<td></td>").append(item.empName);
						var empTimeTd =  $("<td></td>").append(item.empTime);
						var empDate = formatDatebox(item.empDate);
						var empDateTd = $("<td></td>").append(empDate);
						var empDeptTd = $("<td></td").append(item.department.deptName);
					/* <button class="btn btn-info">
					<span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</span></button> */
						var editBtn = $("<button></button>")
						.addClass("btn btn-info edt_btn")
						.append($("<span></span>")
						.addClass("glyphicon glyphicon-pencil")
						.append("编辑"));
						//为编辑按钮添加一个自定义属性来保存当前员工ID
						editBtn.attr("edt_id",item.empId);
						var delBtn = $("<button></button>")
						.addClass("btn btn-danger del_btn")
						.append($("<span></span>")
						.addClass("glyphicon glyphicon-trash")
						.append("删除"));
						delBtn.attr("del_id",item.empId);
				var btnTd = $("<td></td>").append(editBtn).append(delBtn);
												
				
						$("<tr></tr>").append(checkBoxTd)
						.append(empIdTd)
						.append(empNameTd)
						.append(empTimeTd)
						.append(empDateTd)
						.append(empDeptTd)
						.append(btnTd)
						.appendTo("#emps_table tbody");
					});
				}
				/* 解析并显示分页数据 */
				//分页信息
				var pageInfo;
				function build_page_info(result){
					$("#page_info_area").empty();
					 page_info = result.extend.pageInfo;
					$("#page_info_area").append("当前第"+page_info.pageNum+"页，总共"+page_info.pages+"页，总共"+page_info.total +"条记录");
				}
				//分页条
				function build_page_nav(result){
					$("#page_nav_area").empty();
					//page_nav_area
				
					var ul = $("<ul></ul>").addClass("pagination");
					var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("herf","#"));
					var prePageLi =	$("<li></li>").append($("<a></a>").append("&laquo;"));
				//判断上一页 首页 是否存在
					if(page_info.hasPreviousPage == false){
						firstPageLi.addClass("disabled");
						prePageLi.addClass("disabled");
					}else{
						
					//实现首页、上一页功能请求
						firstPageLi.click(function(){
							to_page(1);
						});
						prePageLi.click(function(){
							to_page(page_info.pageNum-1);
						});
					}
				
					var lastPageLi =$("<li></li>").append($("<a></a>").append("尾页").attr("herf","#"));
					var nextPageLi =$("<li></li>").append($("<a></a>").append("&raquo;"));
				//判断下一页 末页 是否存在
					if(page_info.hasNextPage == false){
						lastPageLi.addClass("disabled");
						nextPageLi.addClass("disabled");
					}else{
						
					//实现末页、下一页请求
						lastPageLi.click(function(){
							to_page(page_info.pages)
						});
						nextPageLi.click(function(){
							to_page(page_info.pageNum+1)
						});
						
					}
					
					ul.append(firstPageLi).append(prePageLi);
					$.each(page_info.navigatepageNums,function(index,page){
						//1.2.3.4.5
						var numLi = $("<li></li>").append($("<a></a>").append(page));
						if(page_info.pageNum==page){
							numLi.addClass("active");
						}
						numLi.click(function(){
							to_page(page);
					});
							ul.append(numLi);
				});
					ul.append(nextPageLi).append(lastPageLi);
					var navEle = $("<nav></nav>").append(ul);
					navEle.appendTo("#page_nav_area");
			}
				//ajax请求页
				function to_page(pn){
					$.ajax({
						url:"${APP_PATH}/emps",
		   				data:"pn="+pn,
		   				type:"GET",
		   				success:function(result){
		   					
		   					build_emps_table(result);
							//2、解析且显示分页数据
							build_page_info(result);
							//3、分页条
							build_page_nav(result);
		   				}
					});
				}
				//处理json字串返回的时间
				Date.prototype.format = function(format) {
			        var o = {
			            "M+": this.getMonth() + 1, // month
			            "d+": this.getDate(), // day
			            "h+": this.getHours(), // hour
			            "m+": this.getMinutes(), // minute
			            "s+": this.getSeconds(), // second
			            "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
			            "S": this.getMilliseconds()
			            // millisecond
			        }
			        if (/(y+)/.test(format))
			            format = format.replace(RegExp.$1, (this.getFullYear() + "")
			                .substr(4 - RegExp.$1.length));
			        for (var k in o)
			            if (new RegExp("(" + k + ")").test(format))
			                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
			        return format;
			    }
				function formatDatebox(value) {
		            if (value == null || value == '') {
		                return '';
		            }
		            var dt;
		            if (value instanceof Date) {
		                dt = value;
		            } else {

		                dt = new Date(value);

		            }

		            return dt.format("yyyy/MM/dd"); //扩展的Date的format方法(上述插件实现)
		        }
				function reset_add_form(ele){
					$(ele)[0].reset();
					$(ele).find(".span").text("");
					$(ele).find("*").removeClass("has-success has-error");
				}
				
				//>=======================================新增加班信息按钮弹出模态框=============================<
				$("#emp_add_modal_btn").click(function(){
						//清除上一次保留信息，css样式，文本提示信息。
							reset_add_form("#empAddModal form");
					
					//发送ajax请求，获得部门信息，显示在下拉框
							getDepts("#empAddModal select");
						
					//弹出模态框
					$("#empAddModal").modal({
						backdrop:"static"
					});
				});
				//###########################请求部门信息###################
				function getDepts(ele){
					$(ele).empty();
					$.ajax({
						url:"${APP_PATH}/depts",
						type:"GET",
						success:function(result){
							//console.log(result);
							//部门信息添加到下拉列表
							$.each(result.extend.depts,function(){
							var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);//这里忘记了添加属性名称，导致调试失败
								optionEle.appendTo(ele);
							});
						}
					});
				}
			
				//前端输入验证
				function validate_add_form(){
				var empName = $("#inputName1").val();
				var regName = /^[0-9]{6,6}$/;
				if(!regName.test(empName)){
					show_validate_msg("#inputName1", "error", "您输入的工号不符合要求！工号默认为6位数字");
					return false;
				}else{
					show_validate_msg("#inputName1", "success", "");
				}
				var empTime = $("#inputTime1").val();
				var regTime = /(^[1-9]\.[0-9]{1,2}$)|(^[1-9]{0,1}$)/
				if(!regTime.test(empTime)){
					show_validate_msg("#inputTime1", "error", "您输入的加班时间不符合要求！");
					return false;
				}else{
					show_validate_msg("#inputTime1", "success", "");
				}
				return true;
			}
				function show_validate_msg(ele,status,msg){
						
					$(ele).parent().removeClass("has-success has-error");
						$(ele).next("span").text("");
					if("success"==status){
						$(ele).parent().addClass("has-success");
						$(ele).next("span").text(msg);
					}else if("error"==status){
						$(ele).parent().addClass("has-error");
						$(ele).next("span").text(msg);
					}
				}
				
				$("#inputName1").change(function(){
					var empName = $("#inputName1").val();
					$.ajax({
						url:"${APP_PATH}/checkuser",
						type:"POST",
						data:"empName="+empName,
						success:function(result){
							if(result.code==100){
								show_validate_msg("#inputName1", "success", "用户名可使用！");
								//校验完成加一个属性标记
								$("#emp_save_btn").attr("ajax-va","success");
							}else{
								show_validate_msg("#inputName1", "error", "用户名已重复");
								$("#emp_save_btn").attr("ajax-va","error");
							}
						}
					});
					
				});
				
				
			//>=====================================保存emp信息【加班信息】======================================<
			$("#emp_save_btn").click(function(){
				//###############################前端验证（停止）#############################################################
				//发送ajax请求之前验证数据正确性
				/* if(!validate_add_form()){
					return false;
				} */
				//后端验证请求发送
			//###########################验证（停止）##########################################################	
				/* if($(this).attr("ajax-va")=="error"){
					return false;
				} */
				
				//发送ajax请求
				var data = $('#empAddModal form').serialize();
				$.ajax({
					url:"${APP_PATH}/emp",
					type:"POST",
					data:data,
					success:function(result){
						if(result.code==100){
						//alert(result.msg);
						$("#empAddModal").modal("hide");
						to_page(page_info.pages+1);
						
						}else{
						alert(result.errorFields);
						}
					}
				});
			});
			//>=====================================编辑emp【加班信息】==============================================<
			$(document).on("click",".edt_btn",function(){
				//alert("edt_btn");
				//开启模态框
				$("#empEdtModal").modal({
					backdrop:"static"
				});
				//1）查出员工信息，显示员工信息
				var empid=$(this).attr("edt_id");
				getEmp(empid);
				$("#emp_edt_btn").attr("edt_id_btn",empid);
				
				//2）查出部门信息，显示部门信息
				getDepts("#empEdtModal select")
			});
			function getEmp(id){
				$.ajax({
					url:"${APP_PATH}/emp/"+id,
					type:"GET",
					success:function(result){
						var eleEmp = result.extend.emp;
						$("#emp_edt_static").text(eleEmp.empName);
						$("#edtTime").val(eleEmp.empTime);
						$("#edtDate").val(formatDatebox(eleEmp.empDate));
						$("#empEdtModal select").val([eleEmp.dId]);
					}
				});
			}
			$("#emp_edt_btn").click(function(){
				$.ajax({
					url:"${APP_PATH}/emp/"+$(this).attr("edt_id_btn"),
					type:"PUT",
					//类型为POST，请求体中转换成PUT请求。
					data:$("#empEdtModal form").serialize(),
					success:function(result){
						if(result.code==100){
							$("#empEdtModal").modal("hide");
							to_page(page_info.pageNum);
						}else{
							alert("更新失败！")
						}
					}
				});
			});
			
			//>================================================删除&批量删除员工信息========================================================<
			//单个删除ajax
			$(document).on("click",".del_btn",function(){
				var empName =$(this).parents("tr").find("td:eq(2)").text();
				var empId = $(this).attr("del_id");
				if(confirm("确认删除工号【"+empName+"】吗？")){
					$.ajax({
						url:"${APP_PATH}/emp/"+empId,
						type:"DELETE",
						success:function(result){
							to_page(page_info.pageNum);
						}
						
					});
				}
			});
			//全选/反选所有员工条目
			$("#check_all").click(function(){
				$(".checkItem").prop("checked",$(this).prop("checked"));
			});
			//单选
			$(document).on("click",".checkItem",function(){
				//alert($(".checkItem:checked").length);
				var flag = $(".checkItem:checked").length ==$(".checkItem").length
				$("#check_all").prop("checked",flag);
			});
			//点击批量删除$ajax
			$("#emp_del_all").click(function(){
				var empNames = "";
				var empIds = "";
				$.each($(".checkItem:checked"),function(){
					empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
					empIds+=$(this).parents("tr").find("td:eq(1)").text()+"-";
				});
				//去除多余的“，”&"-"号
				empNames=empNames.substring(0,empNames.length-1);
				empIds = empIds.substring(0,empIds.length-1);
				
				if(confirm("您真的要删除【"+empNames+"】这些内容"+empIds+"吗？")){
					$.ajax({
						url:"${APP_PATH}/emp/"+empIds,
						type:"DELETE",
						success:function(result){
							to_page(page_info.pageNum);
						}
					});
				}
			});
			
			
	</script>
</body>
</html>
