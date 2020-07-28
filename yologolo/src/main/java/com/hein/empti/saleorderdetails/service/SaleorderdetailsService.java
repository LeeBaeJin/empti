package com.hein.empti.saleorderdetails.service;

import java.util.List;

import com.hein.empti.saleorderdetails.SaleorderdetailsVO;

public interface SaleorderdetailsService {
	//전체조회 Where:주문번호
	public List<SaleorderdetailsVO> getSaleorderdetailList(SaleorderdetailsVO vo);
	
	//다중 Insert
	public void setSaleorderdetailInsert(List<SaleorderdetailsVO> list);
	
	
}
