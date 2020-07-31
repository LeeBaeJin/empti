package com.hein.empti.stocks.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.items.ItemsVO;
import com.hein.empti.items.service.ItemsService;
import com.hein.empti.stocks.StocksVO;
import com.hein.empti.stocks.service.StocksService;
import com.hein.empti.storages.StoragesVO;
import com.hein.empti.storages.service.StoragesService;

@Controller
public class StocksControllerAjax {

	@Autowired
	StocksService stocksService;
	@Autowired
	ItemsService itemsService;
	@Autowired
	StoragesService storagesService;

	// 등록폼
	@RequestMapping("/setStocksForm")
	public String setInsertFormStocks(Model model, ItemsVO itemsVO, StoragesVO storagesVO) {
		model.addAttribute("storages", storagesService.getStoragesList(storagesVO));
		model.addAttribute("items", itemsService.getItemsList(itemsVO));
		return "admin/stocks/insertStocksAjax";
	}

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
	// ,headers = {"Content-type=application/json"})
	// 요청헤더
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

	// 전체조회
	@RequestMapping(value = "/adminStocks", method = RequestMethod.GET)
	@ResponseBody
	public List<StocksVO> getWorkerList(Model model, StocksVO stocksVO) {
		return stocksService.getStocksList(stocksVO);
	}

	// 입출고내역 조회
	@RequestMapping("/getStocksList")
	public String getStocksList(Model model, StocksVO vo) {
		model.addAttribute("stocksList", stocksService.getStocksList(null));
		return "admin/stocks/stocksList";
	}

	/*
	 * // excel 출력
	 * 
	 * @RequestMapping("stocks_excel.do.do") public ModelAndView stocksExcel(ItemsVO
	 * vo) { ModelAndView mv = new ModelAndView();
	 * mv.setViewName("commonExcelView"); mv.addObject("datas",
	 * stocksService.getStocksMap(vo));// Map객체를 조회해서 시트를 생성한다.
	 * mv.addObject("filename", "stockslist");// 파일이름을 바꿔준다. mv.addObject("headers",
	 * new String[] { "품목명", "재고량", "창고번호" }); // 헤더의 값만 출력된다. return mv; }
	 */

}