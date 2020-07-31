package com.hein.empti.saleledger.service;

import java.util.List;

import com.hein.empti.saleledger.SaleledgerVO;

public interface SaleledgerService {
	public List<SaleledgerVO> getSaleledgerList(SaleledgerVO saleledgerVO);
	public SaleledgerVO getSaleledger(SaleledgerVO saleledgerVO);
	public void setInsertSaleledger(SaleledgerVO saleledgerVO);
	public void setUpdateSaleledger(SaleledgerVO saleledgerVO);
	public void setDeleteSaleledger(SaleledgerVO saleledgerVO);
}
