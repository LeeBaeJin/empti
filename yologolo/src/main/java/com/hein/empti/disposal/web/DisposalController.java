package com.hein.empti.disposal.web;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.disposal.DisposalVO;
import com.hein.empti.disposal.service.DisposalService;
import com.hein.empti.storages.StoragesVO;
import com.hein.empti.storages.service.StoragesService;

@Controller
public class DisposalController {
	
	@Autowired
	DisposalService disposalService;
	
	@Autowired
	StoragesService storeageService;
	
	// for report
			@Autowired
			@Qualifier("dataSourceSpied") 
			DataSource datasource; 	
	
	//등록폼
	@RequestMapping("/setInsertFormDisposal")
	public String setInsertFormDisposal(DisposalVO vo, Model model, StoragesVO storagesVO) {
		model.addAttribute("storages", storeageService.getStoragesList(storagesVO));
		return "admin/disposal/insertDisposal";
	}
	
	//등록처리
	@RequestMapping("/setInsertDisposal")
	public String setInsertDisopsal(DisposalVO vo){
		disposalService.setInsertDisposal(vo);
		return "redirect:getDisposalList";
	}
	
	//전체조회
	@RequestMapping("/getDisposalList")
	public String getDisposalList(Model model, DisposalVO vo) {
		model.addAttribute("disposalList", disposalService.getDisposalList(vo));
		return "admin/disposal/disposalList";
	}
	
	//단건조회
	@RequestMapping("/getDisposal/{disposal_no}")
	public String getDisposal(@PathVariable String disposal_no) {
		return "admin/home";
	}
	
	//수정폼
	@RequestMapping("/setUpdateFormDisposal")
	public String setUpdateFormDisposal(Model model, DisposalVO vo) {
		model.addAttribute("updateList", disposalService.getDisposal(vo));
		return "admin/disposal/updateDisposal";
		
	}
	
	//수정처리
	@RequestMapping("/setUpdateDisposal")
	public String setUpdateDisposal(Model model, DisposalVO vo) {
		disposalService.setUpdateDisposal(vo);
		return "redirect:getDisposalList";
	}
	
	
	
	/*//레포트 출력
		@RequestMapping("getDisposalListReport")
		public void report(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = datasource.getConnection();
		//InputStream jasperStream = getClass().getResourceAsStream("/reports/emplist.jasper");
		//JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		
		//바로 컴파일 해버리는 방법
		 InputStream stream = getClass().getResourceAsStream("/reports/disposal_list.jrxml");
		 JasperReport jasperReport = JasperCompileManager.compileReport(stream);
			 
	    //파라미터 맵
		HashMap<String, Object> map = new HashMap<>();
		map.put("p_departmentId", request.getParameter("dept"));
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
		
		}*/
		
	//view resolver 방식
	@RequestMapping("disposal_list.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	ModelAndView mv = new ModelAndView();
	mv.setViewName("pdfView");
	mv.addObject("filename", "/reports/disposal_list.jrxml");
	return mv;
	}
	
	// excel 출력
	@RequestMapping("disposal_excel.do")
	public ModelAndView disposalexcel(DisposalVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("commonExcelView");
		mv.addObject("datas", disposalService.getDisposalMap(vo));// Map객체를 조회해서 시트를 생성한다.
		mv.addObject("filename", "diposallist");// 파일이름을 바꿔준다.
		mv.addObject("headers", new String[] { "폐기/불량번호", "품목명","수량","단가","손실금액","폐기일","창고번호","구분"}); // 헤더의 값만 출력된다.
		return mv;
	}
	
	// excel 출력
//	@RequestMapping("/disposal_excel.do")
//	public ModelAndView excelView(DisposalVO vo, HttpServletResponse response) throws IOException{
//		List<Map<String, Object>> list = disposalService.getDisposalMap(vo);
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		String[] header = {"폐기불량 번호", "품목명","수량","단가","손실금액","폐기일","창고번호","구분"};
//		map.put("headers", header);
//		map.put("filename", "diposallist");
//		map.put("datas", list);
//		return new ModelAndView("commonExcelView", map);
//	}
	
	
		
}
