package com.hein.empti.saleorders.service;

import java.util.List;

import com.hein.empti.saleorders.SaleordersVO;

public interface SaleordersService {
	public SaleordersVO getSaleorders(SaleordersVO saleordersVO);
	public List<SaleordersVO> getSaleordersList(SaleordersVO saleordersVO);	
	public void setInsertSaleorders(SaleordersVO saleordersVO) ;
	public void setUpdateSaleorders(SaleordersVO saleordersVO) ;

}
