package com.hein.empti.stocks.service;

import java.util.List;
import java.util.Map;


import com.hein.empti.stocks.StocksVO;

public interface StocksService {

	public StocksVO getStocks(StocksVO stocksVO);
	public List<StocksVO> getStocksList(StocksVO stocksVO);
	public void setInsertStocks(StocksVO stocksVO);
	public void setUpdateStocks(StocksVO stocksVO);
	
	//findStockBorderNo, 구매 조회
	public List<StocksVO> findStockBorderNo(StocksVO stocksVO);
	
	//stock_view (Map) 엑셀
	public List<Map<String, Object>> getStocksMap(StocksVO vo);
	
	//다중 Insert
	public void setInsertStockBorders(List<StocksVO> list);
}