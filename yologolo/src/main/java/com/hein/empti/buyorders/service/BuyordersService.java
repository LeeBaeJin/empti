package com.hein.empti.buyorders.service;

import java.util.List;
import java.util.Map;

import com.hein.empti.buyorders.BuyordersVO;
import com.hein.empti.buyorders.OrderMasterVO;

public interface BuyordersService {
	public List<BuyordersVO> getBuyordersList(BuyordersVO buyordersVO);
	public BuyordersVO getBuyorders(BuyordersVO buyordersVO);
	public void setInsertBuyorders(OrderMasterVO mVO);
	public void setUpdateBuyorders(BuyordersVO buyordersVO);
	public void setDeleteBuyorders(BuyordersVO buyordersVO);
	public void setReturnBuyorders(BuyordersVO buyordersVO);
	
	public List<Map<String, Object>> getBuyordersListMap(BuyordersVO buyordersVO);

	//시퀀스 조회
	public String getBuySeq();
}