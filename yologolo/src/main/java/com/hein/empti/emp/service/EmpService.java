package com.hein.empti.emp.service;

import java.util.List;
import java.util.Map;

import com.hein.empti.emp.EmpVO;

public interface EmpService {

	public EmpVO getEmp(EmpVO empVO);
	public List<EmpVO> getEmpList(EmpVO empVO);
	public void setInsertEmp(EmpVO empVO);
	public void setUpdateEmp(EmpVO empVO);
	public void setDeleteEmp(EmpVO empVO);
	public List<Map<String,Object>> getDeptEmpCnt();
	
	//emp (Map) 엑셀
	public List<Map<String, Object>> getEmpMap(EmpVO vo);

}
