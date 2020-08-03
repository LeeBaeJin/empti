package com.hein.empti.buyorders.service.impl;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> getBuyordersListMap(BuyordersVO buyordersVO) {
		return buyordersMapper.getBuyordersListMap(buyordersVO);
	}

//	@Override
//	public List<BuyordersVO> getBuyordersList(BuyordersVO buyordersVO) {
//		return buyordersMapper.getBuyordersList(buyordersVO);
//	}

	@Override
	public BuyordersVO getBuyorders(BuyordersVO buyordersVO) {
		return buyordersMapper.getBuyorders(buyordersVO);
	}

	@Override
	public void setInsertBuyorders(OrderMasterVO mVO) {
		mVO.getVo().setBorder_date(mVO.getVo().getBorder_date().replace('T', ' '));
		buyordersMapper.setInsertBuyorders(mVO.getVo());
		buyorderdetailsMapper.setBuyorderdetailInsert(mVO.getList());
	}
	@Override
	public void setUpdateBuyorders(BuyordersVO buyordersVO) {
		buyordersVO.setBorder_date(buyordersVO.getBorder_date().replace('T', ' '));
		buyordersMapper.setUpdateBuyorders(buyordersVO);
	}
	@Override
	public void setDeleteBuyorders(BuyordersVO buyordersVO) {
		buyordersMapper.setDeleteBuyorders(buyordersVO);
	}
	
	
	
	//반품
	@Override
	public List<BuyordersVO> getReturnBuyordersList(BuyordersVO buyordersVO) {
		return buyordersMapper.getReturnBuyordersList(buyordersVO);
	}

	@Override
	public void setUpdateBuyordersRetrun(BuyordersVO buyordersVO) {
		buyordersMapper.setUpdateBuyordersRetrun(buyordersVO);
	}

	//시퀀스 조회
	@Override
	public String getBuySeq() {
		return buyordersMapper.getBuySeq();
	}

	@Override
	public List<Map<String, Object>> getBuyordersexcelMap(BuyordersVO vo) {
		// TODO Auto-generated method stub
		return buyordersMapper.getBuyordersexcelMap(vo);
	}
}
