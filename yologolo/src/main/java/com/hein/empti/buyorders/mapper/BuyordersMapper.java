package com.hein.empti.buyorders.mapper;

import java.util.List;
import java.util.Map;

import com.hein.empti.buyorders.BuyordersVO;

public interface BuyordersMapper {
	//public List<BuyordersVO> getBuyordersList(BuyordersVO buyordersVO);
	public BuyordersVO getBuyorders(BuyordersVO buyordersVO);
	public void setInsertBuyorders(BuyordersVO buyordersVO);
	public void setUpdateBuyorders(BuyordersVO buyordersVO);
	public void setDeleteBuyorders(BuyordersVO buyordersVO);
	
	//시퀀스 조회
	public String getBuySeq();
	
	//엑셀
	public List<Map<String, Object>> getBuyordersexcelMap(BuyordersVO vo);
	
	//pdf
	//public List<>
	
	//구매주문 map담기
	public List<Map<String, Object>> getBuyordersListMap(BuyordersVO buyordersVO);

	//반품 조회
	public List<BuyordersVO> getReturnBuyordersList(BuyordersVO buyordersVO);
	
	//반품 처리(insert)
	public void setInsertBuyordersRetrun(BuyordersVO buyordersVO);

	//수정처리(배송상태만)
	public void setUpdateBuyDel(List<BuyordersVO> bList);
	
}