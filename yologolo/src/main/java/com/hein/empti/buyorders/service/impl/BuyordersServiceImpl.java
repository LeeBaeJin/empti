package com.hein.empti.buyorders.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.buyorderdetails.mapper.BuyorderdetailsMapper;
import com.hein.empti.buyorders.BuyordersVO;
import com.hein.empti.buyorders.OrderMasterVO;
import com.hein.empti.buyorders.mapper.BuyordersMapper;
import com.hein.empti.buyorders.service.BuyordersService;

@Service
public class BuyordersServiceImpl implements BuyordersService{
	
	@Autowired BuyordersMapper buyordersMapper;
	@Autowired BuyorderdetailsMapper buyorderdetailsMapper;
	
	@Override
	public List<BuyordersVO> getBuyordersList(BuyordersVO buyordersVO) {
		return buyordersMapper.getBuyordersList(buyordersVO);
	}

	@Override
	public BuyordersVO getBuyorders(BuyordersVO buyordersVO) {
		return buyordersMapper.getBuyorders(buyordersVO);
	}

	@Override
	public void setInsertBuyorders(OrderMasterVO mVO) {
		//mVO.setVo(mVO.getVo().getOrder_date().replace('T', ' '));
		buyordersMapper.setInsertBuyorders(mVO.getVo());
		buyorderdetailsMapper.setBuyorderdetailInsert(mVO.getList());
	}
	@Override
	public void setUpdateBuyorders(BuyordersVO buyordersVO) {
		buyordersVO.setOrder_date(buyordersVO.getOrder_date().replace('T', ' '));
		buyordersMapper.setUpdateBuyorders(buyordersVO);
	}
	@Override
	public void setDeleteBuyorders(BuyordersVO buyordersVO) {
		buyordersMapper.setDeleteBuyorders(buyordersVO);
	}
	
	//시퀀스 조회
	@Override
	public String getSeq() {
		return buyordersMapper.getSeq();
	}
}
