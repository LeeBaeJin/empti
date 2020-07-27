package com.hein.empti.emp.service;

import java.util.List;

import com.hein.empti.emp.EmpVO;

public interface EmpService {

	public EmpVO getEmp(EmpVO empVO);
	public List<EmpVO> getEmpList(EmpVO empVO);
	public void setInsertEmp(EmpVO empVO);
	public void setUpdateEmp(EmpVO empVO);
	public void setDeleteEmp(EmpVO empVO);
}
