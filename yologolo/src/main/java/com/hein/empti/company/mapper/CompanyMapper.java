package com.hein.empti.company.mapper;

import java.util.List;

import com.hein.empti.company.CompanyVO;

public interface CompanyMapper {
	public List<CompanyVO> getCompanyList(CompanyVO companyVO);
	public CompanyVO getCompany(CompanyVO companyVO);
	public void setInsertCompany(CompanyVO companyVO);
	public void setUpdateCompany(CompanyVO companyVO);
	public void setDeleteCompany(CompanyVO companyVO);
	public List<CompanyVO> findCompany(CompanyVO companyVO);
}
