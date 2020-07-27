package com.hein.empti.company.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.company.CompanyVO;
import com.hein.empti.company.mapper.CompanyMapper;
import com.hein.empti.company.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

   @Autowired CompanyMapper companyMapper;
   
   @Override
   public List<CompanyVO> getCompanyList(CompanyVO companyVO) {
      return companyMapper.getCompanyList(companyVO);
   }

   @Override
   public List<CompanyVO> findCompany(CompanyVO companyVO) {
	return companyMapper.findCompany(companyVO);
}

@Override
   public CompanyVO getCompany(CompanyVO companyVO) {
      return companyMapper.getCompany(companyVO);
   }

   @Override
   public void setInsertCompany(CompanyVO companyVO) {
      companyMapper.setInsertCompany(companyVO);
   }

   @Override
   public void setUpdateCompany(CompanyVO companyVO) {
      companyMapper.setUpdateCompany(companyVO);
   }

   @Override
   public void setDeleteCompany(CompanyVO companyVO) {
      companyMapper.setDeleteCompany(companyVO);
   }
   
   
}