package com.hein.empti.saleorders.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.saleorderdetails.mapper.SaleorderdetailsMapper;
import com.hein.empti.saleorders.SaleordersVO;
import com.hein.empti.saleorders.SorderMasterVO;
import com.hein.empti.saleorders.mapper.SaleordersMapper;
import com.hein.empti.saleorders.service.SaleordersService;

@Service
public class SaleordersServiceImpl implements SaleordersService{
	
	@Autowired SaleordersMapper saleordersMapper;
	@Autowired SaleorderdetailsMapper saleorderdetailsMapper;
	
	@Override
	public List<SaleordersVO> getSaleordersList(SaleordersVO saleordersVO) {
		return saleordersMapper.getSaleordersList(saleordersVO);
	}

	@Override
	public SaleordersVO getSaleorders(SaleordersVO saleordersVO) {
		return saleordersMapper.getSaleorders(saleordersVO);
	}

	@Override
	public void setInsertSaleorders(SorderMasterVO sVO) {
		sVO.getVo().setOrder_date(sVO.getVo().getOrder_date().replace('T', ' '));
		saleordersMapper.setInsertSaleorders(sVO.getVo());
		saleorderdetailsMapper.setSaleorderdetailInsert(sVO.getList());
	}
	
	@Override
	public void setUpdateSaleorders(SaleordersVO saleordersVO) {
		saleordersVO.setOrder_date(saleordersVO.getOrder_date().replace('T', ' '));
		saleordersMapper.setUpdateSaleorders(saleordersVO);
	}

	@Override
	public void setDeleteSaleorders(SaleordersVO saleordersVO) {
		saleordersMapper.setDeleteSaleorders(saleordersVO);
	}

	//시퀀스 조회
	@Override
	public String getSaleSeq() {
		return saleordersMapper.getSaleSeq();
	}
	
	//판매주문(JOIN name, company_name) Map 객체에 담아서 조회
	@Override
	public List<Map<String, Object>> getSaleordersListMap(SaleordersVO saleordersVO) {
		return saleordersMapper.getSaleordersListMap(saleordersVO);
	}
}