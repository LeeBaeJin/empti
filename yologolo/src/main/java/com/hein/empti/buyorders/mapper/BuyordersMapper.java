package com.hein.empti.buyorders.mapper;

import java.util.List;

import com.hein.empti.buyorders.BuyordersVO;

public interface BuyordersMapper {
	public List<BuyordersVO> getBuyordersList(BuyordersVO buyordersVO);
	public BuyordersVO getBuyorders(BuyordersVO buyordersVO);
	public void setInsertBuyorders(BuyordersVO buyordersVO);
	public void setUpdateBuyorders(BuyordersVO buyordersVO);
	public void setDeleteBuyorders(BuyordersVO buyordersVO);
	
	//시퀀스 조회
	public String getBuySeq();
}