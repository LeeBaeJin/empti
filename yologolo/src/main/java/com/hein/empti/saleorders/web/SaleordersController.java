package com.hein.empti.saleorders.web;

import java.util.List;

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

import com.hein.empti.buyorders.BuyordersVO;
import com.hein.empti.emp.EmpVO;
import com.hein.empti.emp.service.EmpService;
import com.hein.empti.saleorderdetails.SaleorderdetailsVO;
import com.hein.empti.saleorderdetails.service.SaleorderdetailsService;
import com.hein.empti.saleorders.SaleordersVO;
import com.hein.empti.saleorders.SorderMasterVO;
import com.hein.empti.saleorders.service.SaleordersService;

@Controller
public class SaleordersController {

	@Autowired SaleordersService saleordersService;
	@Autowired SaleorderdetailsService saleorderdetailsService;

	@Autowired EmpService empService;

	// for report
	@Autowired
	@Qualifier("dataSourceSpied")
	DataSource datasource;

	// 판매주문번호 조회하여 판매상세정보List 출력
	@RequestMapping("/getSaleorderdetailList")
	public String getSaleorders(SaleorderdetailsVO vo, Model model) {
		model.addAttribute("details",saleorderdetailsService.getSaleorderdetailList(vo));
		return "saleorderdetails/saleorderdetailList";
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

	// 수정처리 (배송상태만)
	@RequestMapping("/setUpdateSaleDel")
	@ResponseBody
	public String setUpdateSaleDel(@RequestBody List<SaleordersVO> sList) {
		saleordersService.setUpdateSaleDel(sList);
		return "redirect:getSaleordersList";
	}
	
	// 주문번호조회
	@RequestMapping("/findSaleorderNo")
	public String findSaleorderNo(SaleordersVO saleordersVO, Model model) {
		model.addAttribute("findSaleorderNo", saleordersService.getSaleordersListMap(saleordersVO));
		return "common/findSaleorderNo";
	}
	
	// 반품목록 조회
	@RequestMapping("/getReturnSaleordersList")
	public String getReturnSaleordersList(SaleordersVO vo, Model model) {
		model.addAttribute("returnSorders", saleordersService.getReturnSaleordersList(vo));
		return "admin/saleorders/returnSaleLordersList";
	}

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