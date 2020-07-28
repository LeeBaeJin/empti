package com.hein.empti.saleorders.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.emp.EmpVO;
import com.hein.empti.emp.service.EmpService;
import com.hein.empti.saleorderdetails.service.SaleorderdetailsService;
import com.hein.empti.saleorders.SaleordersVO;
import com.hein.empti.saleorders.SorderMasterVO;
import com.hein.empti.saleorders.service.SaleordersService;
import com.hein.empti.storages.StoragesVO;

@Controller
public class SaleordersController {

	@Autowired SaleordersService saleordersService;
	@Autowired SaleorderdetailsService saleorderdetailsService;

	@Autowired EmpService empService;

	// for report
	@Autowired
	@Qualifier("dataSourceSpied")
	DataSource datasource;

	// 단건조회
	@RequestMapping("/getSaleordersList/{order_no}")
	public String getSaleorders(@PathVariable String order_no) {
		return "admin/saleorders/saleordersList";
	}

	// 상세조회를 뺀 판매주문 내역 전체 조회
//	@RequestMapping("/getSaleordersList")
//	public String getSaleordersList(Model model, SaleordersVO saleordersVO) {
//		model.addAttribute("saleordersList", saleordersService.getSaleordersList(saleordersVO));
//		return "admin/saleorders/saleordersList";
//	}
	
	// 판매주문 전체조회 Map
	@RequestMapping("/getSaleordersListMap")
	public String getSaleordersListMap(Model model, SaleordersVO saleordersVO) {
		model.addAttribute("saleordersMap", saleordersService.getSaleordersListMap(saleordersVO));
		return "admin/saleorders/saleordersList"; 
	}

	// 판매주문 시퀀스
	@RequestMapping("/getSaleSeq")
	@ResponseBody
	public String getSaleSeq(String seq) {
		return saleordersService.getSaleSeq();
	}

	// 판매주문 등록폼
	@RequestMapping("/setInsertFormSaleorders")
	public String setInsertFormSaleorders(SaleordersVO vo, Model model, EmpVO empVO) {
		model.addAttribute("emps", empService.getEmpList(empVO));
		return "admin/saleorders/insertSaleorders";
	}

	// 판매주문 등록 처리
	@RequestMapping("/setInsertSaleorders")
	@ResponseBody
	public String setInsertSaleorders(@RequestBody SorderMasterVO sVO) {
		saleordersService.setInsertSaleorders(sVO);
		return "redirect:getSaleordersList";
	}

	// 수정폼
	@RequestMapping("/setUpdateFormSaleorders")
	public String setUpdateFormSaleorders(SaleordersVO saleordersVO) {
		return "admin/saleorders/UpdateSaleorders";
	}

	// 수정처리
	@RequestMapping("/setUpdateSaleorders")
	public String setUpdateFormSaleorders(Model model, SaleordersVO saleordersVO) {
		return "redirect:getSaleordersList";
	}

	/*
	 * //판매주문 단건조회
	 * 
	 * @RequestMapping() public String getSaleorders("/getSaleorders/{orders_no}")
	 * return "admin/home";
	 * 
	 * //서비스 호출
	 */

	// view resolver 방식
	@RequestMapping("saleorders_list.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pdfView");
		mv.addObject("filename", "/reports/saleorders_list.jrxml");
		return mv;
	}
}