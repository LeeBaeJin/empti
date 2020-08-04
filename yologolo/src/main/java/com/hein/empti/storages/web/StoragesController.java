package com.hein.empti.storages.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.emp.EmpVO;
import com.hein.empti.emp.service.EmpService;
import com.hein.empti.items.ItemsVO;
import com.hein.empti.storages.StoragesVO;
import com.hein.empti.storages.service.StoragesService;

@Controller
public class StoragesController {

	@Autowired
	StoragesService storagesService;
	@Autowired
	EmpService empService;

	// 등록폼
	@RequestMapping("/setInsertFormStorages")
	public String setInsertFormStorages(StoragesVO storagesVO, Model model, EmpVO empVO) {
		model.addAttribute("emps", empService.getEmpList(empVO));
		return "admin/storages/insertStorages";
	}

	// 등록처리
	@RequestMapping("/setInsertStorages")
	public String setInsertStorages(StoragesVO storagesVO) {

		storagesService.setInsertStorages(storagesVO);
		return "redirect:getStoragesListMap";
	}

	// 전체조회
	// @RequestMapping("/getStoragesList")
	public String getStoragesList(Model model, StoragesVO storagesVO) {
		model.addAttribute("storagesList", storagesService.getStoragesList(storagesVO));
		return "admin/storages/storagesList";
	}

	@RequestMapping("/getStoragesListMap")
	public String getStoragesListMap(Model model, StoragesVO storagesVO) {
		model.addAttribute("storagesList", storagesService.getStoragesListMap(storagesVO));
		return "admin/storages/storagesList";
	}

	// 단건조회
	@RequestMapping("/getStorage/{strg_no}")
	public String getStorages(@PathVariable String strg_no) {
		return "admin/home";
	}

	// 수정폼
	@RequestMapping("/setUpdateFormStorages")
	public String setUpdateFormStorages(Model model, StoragesVO storagesVO) {
		model.addAttribute("updateList", storagesService.getStorages(storagesVO));
		return "admin/storages/updateStorages";
	}

	// 수정처리
	@RequestMapping("/setUpdateStorages")
	public String setUpdateStorages(Model model, StoragesVO storagesVO) {
		storagesService.setUpdateStorages(storagesVO);
		return "redirect:getStoragesListMap";
	}
	
	//삭제처리
	@RequestMapping("/setDeleteStorages")
	public String setDeleteStorages(Model model, StoragesVO storagesVO) {
		if(storagesService.getDisposalCount(storagesVO) > 0 || storagesService.getStocksCount(storagesVO) >0) {
			model.addAttribute("msg", "삭제할 수 없습니다.");
			model.addAttribute("loc", "getStoragesListMap");
			return "common/msg";
		} else {
			storagesService.setDeleteStorages(storagesVO);
			return "redirect:getStoragesListMap";		
		}
	}

	// view resolver 방식
	@RequestMapping("storages.do")
	public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pdfView");
		mv.addObject("filename", "/reports/storages.jrxml");
		return mv;
	}

	// excel 출력
	@RequestMapping("storages_excel.do")
	public ModelAndView storagesExcel(StoragesVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("commonExcelView");
		mv.addObject("datas", storagesService.getStoragesExcelMap(vo));// Map객체를 조회해서 시트를 생성한다.
		mv.addObject("filename", "storageslist");// 파일이름을 바꿔준다.
		mv.addObject("headers", new String[] { "창고번호", "창고유형", "담당사원"}); // 헤더의 값만 출력된다.
		return mv;
	}
}
