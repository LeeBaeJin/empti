package com.hein.empti.saleledger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.saleledger.SaleledgerVO;
import com.hein.empti.saleledger.mapper.SaleledgerMapper;
import com.hein.empti.saleledger.service.SaleledgerService;

@Service
public class SaleledgerServiceImpl implements SaleledgerService {
	
	@Autowired SaleledgerMapper saleledgerMapper;
	
	@Override
	public List<SaleledgerVO> getSaleledgerList(SaleledgerVO saleledgerVO) {
		return saleledgerMapper.getSaleledgerList(saleledgerVO);
	}

	@Override
	public SaleledgerVO getSaleledger(SaleledgerVO saleledgerVO) {
		return saleledgerMapper.getSaleledger(saleledgerVO);
	}

	@Override
	public void setInsertSaleledger(SaleledgerVO saleledgerVO) {
		saleledgerVO.setLdgr_date(saleledgerVO.getLdgr_date().replace('T', ' '));
		saleledgerMapper.setInsertSaleledger(saleledgerVO);
	}

	@Override
	public void setUpdateSaleledger(SaleledgerVO saleledgerVO) {
		saleledgerMapper.setUpdateSaleledger(saleledgerVO);
	}

	@Override
	public void setDeleteSaleledger(SaleledgerVO saleledgerVO) {
		saleledgerMapper.setDeleteSaleledger(saleledgerVO);
	}
	
}
