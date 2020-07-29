package com.hein.empti.buyorders.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.buyorderdetails.BuyorderdetailsVO;
import com.hein.empti.buyorderdetails.service.BuyorderdetailsService;
import com.hein.empti.buyorders.BuyordersVO;
import com.hein.empti.buyorders.OrderMasterVO;
import com.hein.empti.buyorders.service.BuyordersService;

@Controller
public class BuyordersController {
	@Autowired BuyordersService buyordersService;
	@Autowired BuyorderdetailsService buyorderdetailsService;

	@Autowired
	@Qualifier("dataSourceSpied")
	DataSource datasource;

	// 상세조회를 뺀 구매주문 내역 전체 조회
	@RequestMapping("/getBuyordersListForm")
	public String getBuyordersList(BuyordersVO buyordersVO, Model model) {
		return "admin/buyorders/buyordersList";
	}
	
	//join문 map 전체 조회.
	@RequestMapping(value= "/getBuyordersListMap", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getBuyordersListMap(BuyordersVO buyordersVO, Model model) {
		return buyordersService.getBuyordersListMap(buyordersVO);
	}
	

	// 구매주문 단건조회
	@RequestMapping("/getBuyorders")
	public String getBuyorders(BuyordersVO buyordersVO, Model model) {
		model.addAttribute("buyorders", buyordersService.getBuyorders(buyordersVO));
		return "buyorders/buyorderdetails";
	}
	
	//상세정보 새창
	@RequestMapping("/getBuyorderdetailList")
	public String getBuyorderdetailList(BuyorderdetailsVO buyorderdetailsVO, Model model) {
		model.addAttribute("buyDetails", buyorderdetailsService.getBuyorderdetailList(buyorderdetailsVO));
		return "buyorderdetails/buyorderdetailList";
	}
	
	
	// 구매주문 시퀀스
	@RequestMapping("/getBuySeq")
	@ResponseBody
	public String getBuySeq(String seq) {
		return buyordersService.getBuySeq();
	}
	// 등록폼
	@RequestMapping("/setInsertFormBuyorders")
	public String setInsertFormBuyorders(BuyordersVO buyordersVO) {
		return "admin/buyorders/insertBuyorders";
	}

	// 등록처리(구매주문)
	@RequestMapping("/setInsertBuyorders")
	@ResponseBody
	public String setInsertBuyorders(@RequestBody OrderMasterVO mVO) {
		buyordersService.setInsertBuyorders(mVO);
		return "redirect:getBuyordersList";
	}

	// 수정처리(구매주문)
	@RequestMapping("/setUpdateBuyorders")
	public String setUpdateBuyorders(BuyordersVO buyordersVO) {
		buyordersService.setUpdateBuyorders(buyordersVO);
		return "redirect:getBuyordersList";
	}

	//삭제처리(구매주문)
	@RequestMapping(value = "/setDeleteBuyorders/{order_no}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map setDeleteBuyorders(@PathVariable String order_no,BuyordersVO buyordersVO,BuyorderdetailsVO buyorderdetailsVO) {
		buyorderdetailsVO.setOrder_no(order_no);
		buyordersVO.setOrder_no(order_no);	
		buyorderdetailsService.setBuyorderdetailDelete(buyorderdetailsVO);
		buyordersService.setDeleteBuyorders(buyordersVO);
		Map map = new HashMap<String, Object>();
		map.put("result", Boolean.TRUE);
		return map;
	}
	
	//반품리스트(구매주문)
	@RequestMapping(value = "/getReturnBuyordersList", method=RequestMethod.GET)
	@ResponseBody
	public List<BuyordersVO> getReturnBuyordersList(BuyordersVO buyordersVO) {
		return buyordersService.getReturnBuyordersList(buyordersVO);
	}
	
	//반품
	@RequestMapping(value= "/setUpdateBuyordersRetrun/{order_no}", method=RequestMethod.PUT)
	@ResponseBody
	public BuyordersVO setUpdateBuyordersRetrun(@PathVariable String order_no, BuyordersVO buyordersVO, Model model) {
		buyordersVO.setOrder_no(order_no);
		buyordersService.setUpdateBuyordersRetrun(buyordersVO);
		return buyordersVO;
	}
	
	
	/*
	 * // pdf 출력 및 인쇄
	 * 
	 * @RequestMapping("/buyordersPdf.do") public void report(HttpServletRequest
	 * request, HttpServletResponse response) throws Exception { Connection conn =
	 * datasource.getConnection(); // InputStream stream =
	 * getClass().getResourceAsStream("/reports/companyPdf.jasper"); // JasperReport
	 * jasperReport = (JasperReport) JRLoader.loadObject(stream); InputStream stream
	 * = getClass().getResourceAsStream("/reports/buyorders_list_pdf.jrxml");
	 * JasperReport jasperReport = JasperCompileManager.compileReport(stream);
	 * 
	 * HashMap<String, Object> map = new HashMap<>(); map.put("p_buyorder",
	 * request.getParameter("buyo"));
	 * 
	 * JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map,
	 * conn); JasperExportManager.exportReportToPdfStream(jasperPrint,
	 * response.getOutputStream()); }
	 */
	
	// view resolver 방식 pdf 출력
	@RequestMapping("buyorders_list_pdf.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pdfView");
		mv.addObject("filename", "/reports/buyorders_list_pdf.jrxml");
		return mv;
	}
}