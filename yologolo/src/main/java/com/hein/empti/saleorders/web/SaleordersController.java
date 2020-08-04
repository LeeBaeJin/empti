package com.hein.empti.saleorders.web;

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

	@Autowired
	EmpService empService;

	// for report
	@Autowired
	@Qualifier("dataSourceSpied")
	DataSource datasource;

	// 판매주문번호 조회하여 판매상세정보List 출력
	@RequestMapping("/getSaleorderdetailList")
	public String getSaleorderdetailList(SaleorderdetailsVO vo, Model model) {
		model.addAttribute("details", saleorderdetailsService.getSaleorderdetailList(vo));
		return "saleorderdetails/saleorderdetailList";
	}
	
	//단건조회
	@RequestMapping("/getSaleorders")
	@ResponseBody
	public SaleordersVO getSaleorders(SaleordersVO vo) {
		return saleordersService.getSaleorders(vo);
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
		return "redirect:getSaleordersListMap";
	}

	// 수정처리 (배송상태만)
	@RequestMapping("/setUpdateSaleDel")
	@ResponseBody
	public void setUpdateSaleDel(@RequestBody List<SaleordersVO> sList) {
		saleordersService.setUpdateSaleDel(sList);
	}
	
	// 삭제처리
	@RequestMapping("/setDeleteSaleorders")
	public String setDeleteSaleorders(SaleordersVO sVO,SaleorderdetailsVO sdVO) {
		saleorderdetailsService.setSaleorderdetailDelete(sdVO);
		saleordersService.setDeleteSaleorders(sVO);
		return "redirect:getSaleordersListMap";
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
	
	//반품처리(Insert)
	@RequestMapping("/setInsertSaleordersRetrun")
	public String setInsertSaleordersRetrun(SaleordersVO vo) {
		saleordersService.setInsertSaleordersRetrun(vo);
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

	// excel 출력
	@RequestMapping("sorderexcel.do")
	public ModelAndView saleordersexcel(SaleordersVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("commonExcelView");
		mv.addObject("datas", saleordersService.getSaleOrdersExcelMap(vo));// Map객체를 조회해서 시트를 생성한다.
		mv.addObject("filename", "saleorderlist");// 파일이름을 바꿔준다.
		mv.addObject("headers", new String[] { "판매번호", "판매일자", "품목", "수량", "단가", "판매합계", "거래처", "담당자" }); // 헤더의 값만
																											// 출력된다.
		return mv; // 판매번호, 판매일자, 품목, 수량, 단가, 판매합계, 거래처, 담당자
	}
}