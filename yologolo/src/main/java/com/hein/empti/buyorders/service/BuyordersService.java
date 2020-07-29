package com.hein.empti.buyorders.service;

import java.util.List;
import java.util.Map;

import com.hein.empti.buyorders.BuyordersVO;
import com.hein.empti.buyorders.OrderMasterVO;

public interface BuyordersService {
	//public List<BuyordersVO> getBuyordersList(BuyordersVO buyordersVO);
	public BuyordersVO getBuyorders(BuyordersVO buyordersVO);
	public void setInsertBuyorders(OrderMasterVO mVO);
	public void setUpdateBuyorders(BuyordersVO buyordersVO);
	public void setDeleteBuyorders(BuyordersVO buyordersVO);
	
	public List<Map<String, Object>> getBuyordersListMap(BuyordersVO buyordersVO);

	//반품 조회
	public List<BuyordersVO> getReturnBuyordersList(BuyordersVO buyordersVO);
	//반품 업데이트
	public void setUpdateBuyordersRetrun(BuyordersVO buyordersVO);
	
	//시퀀스 조회
	public String getBuySeq();
}