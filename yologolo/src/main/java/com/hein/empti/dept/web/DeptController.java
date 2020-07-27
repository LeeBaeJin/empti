package com.hein.empti.dept.web;

import java.io.InputStream;
import java.sql.Connection;

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

import com.hein.empti.dept.DeptVO;
import com.hein.empti.dept.service.DeptService;
import com.hein.empti.emp.EmpVO;
import com.hein.empti.emp.service.EmpService;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
public class DeptController {
	
	@Autowired
	DeptService deptService;
	
	@Autowired
	EmpService empService;
	
	//report
		@Autowired
		@Qualifier("dataSourceSpied") 
		DataSource datasource; 	
	
	//단건조회
	@RequestMapping("/getDeptList/{dept_id}")
	public String getDept(@PathVariable String dept_id) {
		return "admin/dept/deptList";
	}
	
	//전체조회
	@RequestMapping("/getDeptList")
	public String getDeptList(Model model, DeptVO deptVO) {
		model.addAttribute("deptList", deptService.getDeptList(deptVO));
		return "admin/dept/deptList";
	}
	
	//등록폼 필요
	@RequestMapping("/setInsertFormDept")
	public String setInsertFormDept(DeptVO deopVO, Model model, EmpVO empVO) {
		model.addAttribute("emp", empService.getEmpList(empVO));
		return "admin/dept/insertDept";
	}
	
	//등록처리
	@RequestMapping("/setInsertDept")
	public String setInsertDept(Model model, DeptVO deptVO) {
		deptService.setInsertDept(deptVO);
		return "redirect:getDeptList";
	}
	
	//수정폼
	@RequestMapping("/setUpdateFormDept")
	public String setUpdateFormDept(DeptVO deptVO, Model model) {
		model.addAttribute("deptUp", deptService.getDept(deptVO));
		return "admin/dept/updateDept";
	}
	
	//수정처리
	@RequestMapping("/setUpdateDept")
	public String setUpdateDept(Model model, DeptVO deptVO) {
		deptService.setUpdateDept(deptVO);
		return "redirect:getDeptList";
	}
	
	//삭제처리
	@RequestMapping("/setDeleteDept")
	public String setDeleteDept(DeptVO deptVO) {
		deptService.setDeleteDept(deptVO);
		return "redirect:getDeptList";
	}
	

	
	//view resolver 방식
	@RequestMapping("departments_list.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("pdfView");
	mv.addObject("filename", "/reports/departments_list.jrxml");
	return mv;
	}

}
