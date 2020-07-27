package com.hein.empti.stocks.mapper;

import java.util.List;

import com.hein.empti.stocks.StocksVO;

public interface StocksMapper {
	
	public StocksVO getStocks(StocksVO stocksVO);
	public List<StocksVO> getStocksList(StocksVO stocksVO);
	public void setInsertStocks(StocksVO stocksVO);
	public void setUpdateStocks(StocksVO stocksVO);
}
