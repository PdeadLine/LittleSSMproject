package org.sintai.work.controller;

import java.util.List;

import org.sintai.work.bean.Department;
import org.sintai.work.bean.Msg;
import org.sintai.work.serivce.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DepartermentController {
	
	@Autowired
	private DepartmentService departermentService;
	
	/*请求获取所有部门信息*/
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts(){
		List<Department> list = departermentService.getAll();
		return Msg.success().add("depts", list);
	}
}
