package org.sintai.work.serivce;

import java.util.ArrayList;
import java.util.List;

import org.sintai.work.bean.Employee;
import org.sintai.work.bean.EmployeeExample;
import org.sintai.work.bean.EmployeeExample.Criteria;
import org.sintai.work.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<Employee> getAll(){
		return employeeMapper.selectByExampleWithDept(null);
	}

	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}

	public boolean chekuser(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count==0;
	}

	public Employee getEmp(Integer id) {
		return employeeMapper.selectByPrimaryKey(id);
	}

	public int updateEmpp(Employee employee) {
		return employeeMapper.updateByPrimaryKeySelective(employee);
	}

	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}

	public void deleteEmpBatch(ArrayList<Integer> idList) {
		EmployeeExample example = new EmployeeExample(); 
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(idList);
		employeeMapper.deleteByExample(example);
	}
	

}
