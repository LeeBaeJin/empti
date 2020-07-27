package com.hein.empti.buyledger.web;

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

import com.hein.empti.buyledger.BuyledgerVO;
import com.hein.empti.buyledger.service.BuyledgerService;

@Controller
public class BuyledgerController {

	@Autowired BuyledgerService buyledgerService;

	@Autowired
	@Qualifier("dataSourceSpied") 
	DataSource datasource; 	
	
	
	// 전체 조회
	@RequestMapping("/getBuyledgerList")
	public String getBuyledgerList(Model model, BuyledgerVO buyledgerVO) {
		model.addAttribute("buyledgerList", buyledgerService.getBuyledgerList(null));
		return "admin/buyledger/buyledgerList";
	}

	// 단건조회
	@RequestMapping("/getBuyledgerList/{ldgr_no}") // getEmp?employeeId=aaa
	public String getBuyledger(@PathVariable String ldgr_no) {
		return "admin/buyledger/buyledgerList";
	}
	
	// 등록폼
	@RequestMapping("/setInsertFormBuyledger")
	public String setInsertFormBuyledger(BuyledgerVO buyledgerVO) {
		return "admin/buyledger/insertBuyledger";
	}

	// 등록처리
	@RequestMapping("/setInsertBuyledger")
	private String setInsertBuyledger(BuyledgerVO buyledgerVO) {
		buyledgerService.setInsertBuyledger(buyledgerVO);
		return "redirect:getBuyledgerList";
	}

	// 수정폼
	@RequestMapping("/setUpdateFormBuyledger")
	public String setUpdateFormBuyledger(Model model, BuyledgerVO buyledgerVO) {
		model.addAttribute("buyledger", buyledgerService.getBuyledger(buyledgerVO));
		return "admin/buyledger/updateBuyledger";
	}

	// 수정처리
	@RequestMapping("/setUpdateBuyledger")
	public String setUpdateBuyledger( BuyledgerVO buyledgerVO) {
		buyledgerService.setUpdateBuyledger(buyledgerVO);
		return "redirect:getBuyledgerList";
	}

	// 뭔가 크게 의미 없는 삭제처리
	//@RequestMapping("/setDeleteSaleledger")
	public String setDeleteBuyledger(BuyledgerVO buyledgerVO) {
		buyledgerService.setDeleteBuyledger(buyledgerVO);
		return "redirect:getBuyledgerList";
	}
	
	
	
	
	//view resolver 방식
	@RequestMapping("getLedgerListReport")
	public ModelAndView getLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("pdfView");
	mv.addObject("filename", "/reports/ledgers_list.jrxml");
	return mv;
	}
	
	//view resolver 방식
	@RequestMapping("buyledger_list.do")
	public ModelAndView getBuyLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("pdfView");
	mv.addObject("filename", "/reports/buyledger_list.jrxml");
	return mv;
	}
}



