package com.hein.empti.emp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.emp.EmpVO;
import com.hein.empti.emp.mapper.EmpMapper;
import com.hein.empti.emp.service.EmpService;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	EmpMapper empMapper;
	
	@Override
	public EmpVO getEmp(EmpVO empVO) {
		return empMapper.getEmp(empVO);
	}

	@Override
	public List<EmpVO> getEmpList(EmpVO empVO) {
		return empMapper.getEmpList(empVO);
	}

	@Override
	public void setInsertEmp(EmpVO empVO) {
		empVO.setHire_date(empVO.getHire_date().replace('T', ' '));
		empMapper.setInsertEmp(empVO);
	}

	@Override
	public void setUpdateEmp(EmpVO empVO) {
		empMapper.setUpdateEmp(empVO);

	}

	@Override
	public void setDeleteEmp(EmpVO empVO) {
		empMapper.setDeleteEmp(empVO);
	}
	
	//차트데이터
	@Override
	public List<Map<String, Object>> getDeptEmpCnt() {
		return empMapper.getDeptEmpCnt();
	}

}
