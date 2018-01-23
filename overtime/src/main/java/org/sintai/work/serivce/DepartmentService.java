package org.sintai.work.serivce;

import java.util.List;

import org.sintai.work.bean.Department;
import org.sintai.work.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentMapper deptDao;
	
	public List<Department> getAll() {
		return deptDao.selectByExample(null);
	}

}
