package com.hein.empti.stocks.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hein.empti.items.ItemsVO;
import com.hein.empti.items.service.ItemsService;
import com.hein.empti.stocks.StocksVO;
import com.hein.empti.stocks.service.StocksService;
import com.hein.empti.storages.StoragesVO;
import com.hein.empti.storages.service.StoragesService;

@Controller
public class StocksController {

	@Autowired StocksService stocksService;
	@Autowired ItemsService itemsService;
	@Autowired StoragesService storagesService;

	// 등록
	@RequestMapping(value = "/adminStocks", method = RequestMethod.POST)
	@ResponseBody
	public Map setInsertStocks(StocksVO stocksVO, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		stocksService.setInsertStocks(stocksVO);
		map.put("result", true);
		map.put("kkk", "ok");
		return map;
	}

	// 수정
	@RequestMapping(value = "/adminStocks", method = RequestMethod.PUT, consumes = "application/json")
	@ResponseBody
	public StocksVO setUpdateStocks(@RequestBody StocksVO stocksVO, Model model) {
		stocksService.setUpdateStocks(stocksVO);
		return stocksVO;
	}

	// 단건조회
	@RequestMapping(value = "/adminStocks/{stock_no}", method = RequestMethod.GET)
	@ResponseBody
	public StocksVO getStocks(@PathVariable String stock_no, StocksVO stocksVO, Model model) {
		stocksVO.setStock_no(stock_no);
		stocksVO = stocksService.getStocks(stocksVO);
		if (stocksVO.getStock_date() != null)
			stocksVO.setStock_date(stocksVO.getStock_date().replace(' ', 'T'));
		stocksVO.setStock_date(stocksVO.getStock_date().substring(0, 16));
		return stocksVO;
	}
	
	
	//0814 부터
	// 입출고내역 조회
	@RequestMapping("/getStocksList")
	public String getStocksList(Model model, StocksVO vo) {
		model.addAttribute("stocks", stocksService.getStocksList(vo));
		return "admin/stocks/stocksList";
	}
	
	// 등록폼
	@RequestMapping("/setInsertStocks")
	public String setInsertFormStocks(Model model, ItemsVO itemsVO, StoragesVO storagesVO) {
		model.addAttribute("storages", storagesService.getStoragesList(storagesVO));
		model.addAttribute("items", itemsService.getItemsList(itemsVO));
		return "admin/stocks/insertStocks";
	}
	
	@RequestMapping("findStockBorderNo")
	public String findStockBorderNo(Model model, StocksVO stocksVO) {
		model.addAttribute("findStcBo", stocksService.findStockBorderNo(stocksVO));
		return "common/findStockBorderNo";
	}
}