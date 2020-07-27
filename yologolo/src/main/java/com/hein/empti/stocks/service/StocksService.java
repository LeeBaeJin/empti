package com.hein.empti.stocks.service;

import java.util.List;

import com.hein.empti.stocks.StocksVO;

public interface StocksService {

	public StocksVO getStocks(StocksVO stocksVO);
	public List<StocksVO> getStocksList(StocksVO stocksVO);
	public void setInsertStocks(StocksVO stocksVO);
	public void setUpdateStocks(StocksVO stocksVO);
}
