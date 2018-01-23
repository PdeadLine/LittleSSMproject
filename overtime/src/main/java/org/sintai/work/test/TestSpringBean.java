package org.sintai.work.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sintai.work.bean.Employee;
import org.sintai.work.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/applicationContext.xml")
@Configuration
public class TestSpringBean {
	@Autowired
	EmployeeMapper employeeMapper;
	
	
	
	@Test
	public void testBean(){
		List<Employee> list = employeeMapper.selectByExample(null);
		for (Employee employee : list) {
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			
			System.out.println(format.format(employee.getEmpDate()));
		}
	}
}
