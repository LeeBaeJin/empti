package com.hein.empti.saleorders.service;

import java.util.List;

import com.hein.empti.saleorders.SaleordersVO;
import com.hein.empti.saleorders.web.SorderMasterVO;

public interface SaleordersService {
	public List<SaleordersVO> getSaleordersList(SaleordersVO saleordersVO);	
	public SaleordersVO getSaleorders(SaleordersVO saleordersVO);
	public void setInsertSaleorders(SorderMasterVO sorderMasterVO);
	public void setUpdateSaleorders(SaleordersVO saleordersVO);
	public void setDeleteSaleorders(SaleordersVO saleordersVO);
	
	//시퀀스 조회
	public String getSeq();
}