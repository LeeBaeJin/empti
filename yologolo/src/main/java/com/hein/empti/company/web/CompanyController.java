package com.hein.empti.company.web;

import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;

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

import com.hein.empti.company.CompanyVO;
import com.hein.empti.company.service.CompanyService;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

@Controller // Bean등록, Dispatcher Servlet이 인식할 수 있는 Controller로 변환// @Component상속
public class CompanyController {

	@Autowired
	CompanyService companyService;

	@Autowired
	@Qualifier("dataSourceSpied")
	DataSource datasource;

	// 단건조회
	@RequestMapping("/getCompanyList/{company_no}") // getEmp?employeeId=aaa
	public String getCompany(@PathVariable String company_no) {
		return "admin/company/companyList";
	}

	// 목록조회
	@RequestMapping("/getCompanyList")
	public String getCompanyList(Model model, CompanyVO companyVO) {
		model.addAttribute("companyList", companyService.getCompanyList(companyVO));
		return "admin/company/companyList";
	}
	
	// 회사코드, 회사명만 조회.
	@RequestMapping("/findCompany")
	public String findComapny(Model model, CompanyVO companyVO) {
		model.addAttribute("findCompanyList", companyService.findCompany(companyVO));
		return "common/findCompany";
	}
	
	// 등록폼
	@RequestMapping("/setInsertFormCompany")
	public String setInsertFormCompany(CompanyVO companyVO) {
		return "admin/company/insertCompany";
	}

	// 등록처리
	@RequestMapping("/setInsertCompany")
	private String setInsertCompany(CompanyVO companyVO) {
		companyService.setInsertCompany(companyVO);
		return "redirect:getCompanyList";
	}

	// 수정폼
	@RequestMapping("/setUpdateFormCompany")
	public String setUpdateFormCompany(Model model, CompanyVO companyVO) {
		model.addAttribute("company", companyService.getCompany(companyVO));
		return "admin/company/updateCompany";
	}

	// 수정처리
	@RequestMapping("/setUpdateCompany")
	public String setUpdateCompany(CompanyVO companyVO) {
		companyService.setUpdateCompany(companyVO);
		return "redirect:getCompanyList";
	}

	// 뭔가 크게 의미 없는 삭제처리
	@RequestMapping("/setDeleteCompany")
	public String setDeleteCompany(CompanyVO companyVO) {
		companyService.setDeleteCompany(companyVO);
		return "redirect:getCompanyList";
	}

	/*
	 * // pdf 출력 및 인쇄
	 * 
	 * @RequestMapping("/companyPdf.do") public void report(HttpServletRequest
	 * request, HttpServletResponse response) throws Exception { Connection conn =
	 * datasource.getConnection(); // InputStream stream =
	 * getClass().getResourceAsStream("/reports/companyPdf.jasper"); // JasperReport
	 * jasperReport = (JasperReport) JRLoader.loadObject(stream); InputStream stream
	 * = getClass().getResourceAsStream("/reports/companyPdf.jrxml"); JasperReport
	 * jasperReport = JasperCompileManager.compileReport(stream);
	 * 
	 * HashMap<String, Object> map = new HashMap<>(); map.put("p_company",
	 * request.getParameter("comp"));
	 * 
	 * JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map,
	 * conn); JasperExportManager.exportReportToPdfStream(jasperPrint,
	 * response.getOutputStream()); }
	 */
	
	//view resolver 방식 pdf 출력
	@RequestMapping("companyPdf.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("pdfView");
	mv.addObject("filename", "/reports/companyPdf.jrxml");
	return mv;
	}
	
}
