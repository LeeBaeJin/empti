package com.hein.empti.saleorders.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.saleorders.SaleordersVO;
import com.hein.empti.saleorders.mapper.SaleordersMapper;
import com.hein.empti.saleorders.service.SaleordersService;

@Service
public class SaleordersImpl implements SaleordersService{
	
	@Autowired
	SaleordersMapper saleordersMapper;
	
	@Override
	public List<SaleordersVO> getSaleordersList(SaleordersVO saleordersVO) {
		return saleordersMapper.getSaleordersList(saleordersVO);
	}

	@Override
	public SaleordersVO getSaleorders(SaleordersVO saleordersVO) {
		return saleordersMapper.getSaleorders(saleordersVO);
	}

	@Override
	public void setInsertSaleorders(SaleordersVO saleordersVO) {
		saleordersVO.setOrder_date(saleordersVO.getOrder_date().replace('T', ' '));
		saleordersMapper.setInsertSaleorders(saleordersVO);
	}
	
	@Override
	public void setUpdateSaleorders(SaleordersVO saleordersVO) {
		saleordersMapper.setUpdateSaleorders(saleordersVO);
	}

}
