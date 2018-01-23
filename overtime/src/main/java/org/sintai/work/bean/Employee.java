package org.sintai.work.bean;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
    private Integer empId;
    
    //JSR303后端验证[注意这里的正则表达式不需要加两边斜杠]
    @Pattern(regexp="^[0-9]{6,6}$",message="您输入的工号不符合要求！工号默认为6位数字!")
    private String empName;
    
  //  @Pattern(regexp="(^[1-9]\\.[0-9]{1,2}$)|(^[1-9]{0,1}$)",message="您输入的加班时间不符合要求[后]！")
    private BigDecimal empTime;

    @DateTimeFormat(pattern="yyyy/MM/dd")
    private Date empDate;

    @Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", empTime=" + empTime + ", empDate=" + empDate
				+ ", dId=" + dId + ", department=" + department + "]";
	}

	private Integer dId;
    
    private Department department;

    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public BigDecimal getEmpTime() {
        return empTime;
    }

    public void setEmpTime(BigDecimal empTime) {
        this.empTime = empTime;
    }

    public Date getEmpDate() {
        return empDate;
    }

    public void setEmpDate(Date empDate) {
        this.empDate = empDate;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}