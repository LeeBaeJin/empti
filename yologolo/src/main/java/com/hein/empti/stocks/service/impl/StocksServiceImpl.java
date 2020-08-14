package com.hein.empti.stocks.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.stocks.StocksVO;
import com.hein.empti.stocks.mapper.StocksMapper;
import com.hein.empti.stocks.service.StocksService;

@Service
public class StocksServiceImpl implements StocksService {
	
	@Autowired 
	StocksMapper stocksMapper;
	
	//단건조회
	@Override
	public StocksVO getStocks(StocksVO stocksVO) {
		return stocksMapper.getStocks(stocksVO);
	}
	
	//전체조회
	@Override
	public List<StocksVO> getStocksList(StocksVO stocksVO) {
		return stocksMapper.getStocksList(stocksVO);
	}
	
	//등록
	@Override
	public void setInsertStocks(StocksVO stocksVO) {
		stocksVO.setStock_date(stocksVO.getStock_date().replace('T', ' '));
			stocksMapper.setInsertStocks(stocksVO);
	}
	
	//수정
	@Override
	public void setUpdateStocks(StocksVO stocksVO) {
		stocksVO.setStock_date(stocksVO.getStock_date().replace('T', ' '));
			stocksMapper.setUpdateStocks(stocksVO);
	}
	//pdf
	@Override
	public List<Map<String, Object>> getStocksMap(StocksVO vo) {
		return stocksMapper.getStocksMap(vo);
	}

	//0814부터
	//findStockBorderNo, 구매 조회
	@Override
	public StocksVO findStockBorderNo(StocksVO stocksVO) {
		return stocksMapper.findStockBorderNo(stocksVO);
	}
	
	

}