package com.hein.empti.saleledger.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.saleledger.SaleledgerVO;
import com.hein.empti.saleledger.service.SaleledgerService;

@Controller
public class SaleledgerController {

	@Autowired
	SaleledgerService saleledgerService;

	// 목록조회
	@RequestMapping("/getSaleledgerList")
	public String getSaleledgerList(Model model, SaleledgerVO saleledgerVO) {
		model.addAttribute("saleledgerList", saleledgerService.getSaleledgerList(saleledgerVO));
		return "admin/saleledger/saleledgerList";
	}

	// 단건조회
	@RequestMapping("/getSaleledgerList/{ldgr_no}") // getEmp?employeeId=aaa
	public String getSaleledger(@PathVariable String ldgr_no) {
		return "admin/saleledger/saleledgerList";
	}

	// 등록폼
	@RequestMapping("/setInsertFormSaleledger")
	public String setInsertFormSaleledger(SaleledgerVO saleledgerVO) {
		return "admin/saleledger/insertSaleledger";
	}

	// 등록처리
	@RequestMapping("/setInsertSaleledger")
	private String setInsertSaleledger(SaleledgerVO saleledgerVO) {
		saleledgerService.setInsertSaleledger(saleledgerVO);
		return "redirect:getSaleledgerList";
	}

	// 수정폼
	@RequestMapping("/setUpdateFormSaleledger")
	public String setUpdateFormSaleledger(Model model, SaleledgerVO saleledgerVO) {
		model.addAttribute("saleledger", saleledgerService.getSaleledger(saleledgerVO));
		return "admin/saleledger/updateSaleledger";
	}

	// 수정처리
	@RequestMapping("/setUpdateSaleledger")
	public String setUpdateSaleledger(SaleledgerVO saleledgerVO) {
		saleledgerService.setUpdateSaleledger(saleledgerVO);
		return "redirect:getSaleledgerList";
	}

	// 뭔가 크게 의미 없는 삭제처리
	//@RequestMapping("/setDeleteSaleledger")
	public String setDeleteSaleledger(SaleledgerVO saleledgerVO) {
		saleledgerService.setDeleteSaleledger(saleledgerVO);
		return "redirect:getSaleledgerList";
	}
	
	//view resolver 방식
		@RequestMapping("saleledger_list.do")
		public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception
		{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pdfView");
		mv.addObject("filename", "/reports/saleledger_list.jrxml");
		return mv;
		}
}
