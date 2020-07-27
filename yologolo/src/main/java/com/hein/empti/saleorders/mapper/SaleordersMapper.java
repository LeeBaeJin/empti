package com.hein.empti.saleorders.mapper;

import java.util.List;

import com.hein.empti.saleorders.SaleordersVO;

public interface SaleordersMapper {
	public List<SaleordersVO> getSaleordersList(SaleordersVO saleordersVO);	
	public SaleordersVO getSaleorders(SaleordersVO saleordersVO);
	public void setInsertSaleorders(SaleordersVO saleordersVO);
	public void setUpdateSaleorders(SaleordersVO saleordersVO);
	public void setDeleteSaleorders(SaleordersVO saleordersVO);
	
	//시퀀스 조회
	public String getSeq();
}