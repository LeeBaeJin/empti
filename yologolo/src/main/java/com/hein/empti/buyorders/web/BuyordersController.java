package com.hein.empti.buyorders.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping("/getBuyordersList")
	public String getBuyordersList(BuyordersVO buyordersVO, Model model) {
		model.addAttribute("buyordersList", buyordersService.getBuyordersList(buyordersVO));
		return "admin/buyorders/buyordersList";
	}

	// 구매주문 단건조회
	@RequestMapping("/getBuyorders")
	public String getBuyorders(BuyordersVO buyordersVO, Model model) {
		model.addAttribute("buyorders", buyordersService.getBuyorders(buyordersVO));
		return "buyorders/buyorderdetails";
	}
	// 구매주문 시퀀스
	@RequestMapping("/getSeq")
	@ResponseBody
	public String getSeq(String seq) {
		return buyordersService.getSeq();
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