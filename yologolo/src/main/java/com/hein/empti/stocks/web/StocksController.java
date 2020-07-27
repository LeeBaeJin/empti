package com.hein.empti.stocks.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.items.ItemsVO;
import com.hein.empti.items.service.ItemsService;
import com.hein.empti.stocks.StocksVO;
import com.hein.empti.stocks.service.StocksService;
import com.hein.empti.storages.StoragesVO;
import com.hein.empti.storages.service.StoragesService;

@Controller
public class StocksController {

	@Autowired	StocksService stocksService;
	
	@Autowired	ItemsService itemsService;
	
	@Autowired	StoragesService storagesService; 
	// report
	@Autowired
	@Qualifier("dataSourceSpied")
	DataSource datasource;

	// 입출고내역 조회
	@RequestMapping("/getStocksList")
	public String getStocksList(Model model, StocksVO vo) {
		model.addAttribute("stocksList", stocksService.getStocksList(null));
		return "admin/stocks/stocksList";
	}
	
	// 단건 조회
	@RequestMapping("/getStocks/{stock_no}") // getEmp?{employeeId}
	public String getStocks(@PathVariable String stock_no) { // @PathVariable 경로(/)에 값을 그대로 넘김
		return "admin/home";
	}
	
	// 등록폼
	@RequestMapping("/setInsertFormStocks")
	public String setInsertFormStocks(Model model, ItemsVO itemsVO, StoragesVO storagesVO) {
		//model.addAttribute("storages",storagesService.getStoragesList(storagesVO));
		model.addAttribute("items", itemsService.getItemsList(itemsVO));
		return "admin/stocks/insertStocks";
	}

	// 등록 처리
	@RequestMapping("/setInsertStocks")
	public String setInsertStocks(StocksVO vo) {
		// 서비스호출
		stocksService.setInsertStocks(vo);
		return "redirect:getStocksList";
	}

	// 수정폼
	@RequestMapping("/setUpdateFormStocks")
	public String setUpdateFormStocks(Model model, StocksVO vo) {
		model.addAttribute("updateList", stocksService.getStocks(vo));
		return "admin/stocks/updateStocks";
	}

	// 수정처리
	@RequestMapping("/setUpdateStocks")
	public String setUpdateStocks(Model model, StocksVO vo) {
		stocksService.setUpdateStocks(vo);
		return "redirect:getStocksList";

	}

	// view resolver 방식
	@RequestMapping("stocks_list.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pdfView");
		mv.addObject("filename", "/reports/stocks_list.jrxml");
		return mv;
	}
}