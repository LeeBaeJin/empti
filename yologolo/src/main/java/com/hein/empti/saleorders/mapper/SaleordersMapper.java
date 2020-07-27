package com.hein.empti.saleorders.mapper;

import java.util.List;

import com.hein.empti.saleorders.SaleordersVO;

public interface SaleordersMapper {
	public SaleordersVO getSaleorders(SaleordersVO saleordersVO);
	public List<SaleordersVO> getSaleordersList(SaleordersVO saleordersVO);	
	public void setInsertSaleorders(SaleordersVO saleordersVO);
	public void setUpdateSaleorders(SaleordersVO saleordersVO);
}
