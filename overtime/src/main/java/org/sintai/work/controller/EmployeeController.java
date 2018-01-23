package org.sintai.work.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.sintai.work.bean.Employee;
import org.sintai.work.bean.Msg;
import org.sintai.work.serivce.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("id") String ids){
		if(ids.contains("-")){
			String[] strs = ids.split("-");
			ArrayList<Integer> idList = new ArrayList<Integer>();
			for (String str : strs) {
				idList.add(Integer.parseInt(str));
			}
			employeeService.deleteEmpBatch(idList);
			return Msg.success();
		}else{
			Integer id =Integer.parseInt(ids);
			employeeService.deleteEmp(id);
			return Msg.success();
		}
		
	}
	
	
	
	
	/**
	 * 我们要能直接发送PUT之类的请求还要封装请求体中的数据
	 * 解决方法：
	 * 		配置上Spring提供的HttpPutFormContentFilter过滤器
	 * 		作用：请求体中的数据会被解析成一个Map,request 会被重新包装，request.getParameter()方法被重写
	 * 编辑员工信息
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee,HttpServletRequest request){
		String name = request.getParameter("empTime");
		System.out.println(name);
		int count = employeeService.updateEmpp(employee);
		if(count!=0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	/**
	 * 查询单个员工信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id){
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	
	/**
	 * 查询所有员工信息
	 * @param pn
	 * @return
	 */
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(name="pn",defaultValue="1")Integer pn){
		/*引入分页插件，查询之前调用PageHelper.starPage()*/
		PageHelper.startPage(pn, 10);
		//后面紧跟着的查询，就是分页查询
		List<Employee> list = employeeService.getAll();
		PageInfo pageInfo = new PageInfo(list,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 新增员工加班信息
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg empSave(@Valid Employee employee,BindingResult result){
		if(result.hasErrors()){
			System.out.println(employee.getEmpName());
			Map<String,Object> map =  new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println(fieldError.getField());
				System.out.println(fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}
	
	/**
	 * //后端校验员工信息
	 * @param empName
	 * @return
	 */
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg chekuser(@RequestParam("empName")String empName){
	 boolean b=employeeService.chekuser(empName);
	 if(b){
		 return Msg.success();
	 }else{
		return Msg.fail();
	 }
 }
	
	
	
	
	
	
	
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(name="pn",defaultValue="1")Integer pn,Model model){
		/*引入分页插件，查询之前调用PageHelper.starPage()*/
		PageHelper.startPage(pn, 5);
		//后面紧跟着的查询，就是分页查询
		List<Employee> list = employeeService.getAll();
		PageInfo pageInfo = new PageInfo(list,5);
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}
}
