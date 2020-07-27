package com.hein.empti.items.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.items.ItemsVO;
import com.hein.empti.items.service.ItemsService;

@Controller
public class ItemsController {
	
	@Autowired
	ItemsService itemsService;
	
		//등록폼
		@RequestMapping("/setInsertFormItems")
		public String setInsertFormItems(ItemsVO vo) {
			
			return "admin/items/insertItems";
			
		}
		
		//등록 처리
		@RequestMapping("/setInsertItems")
		public String setInsertItems(ItemsVO vo	){//1.커맨드객체는 자동으로 모델에 저장됨. model.addAttribute
		//model.addAttribute("evo", vo);
		//서비스호출
		itemsService.setInsertItems(vo);
		return "redirect:getItemsList";
		}
		
		//품목 전체 조회
		@RequestMapping("/getItemsList")
		public String getItemsList(Model model, ItemsVO vo) {
			model.addAttribute("itemsList", itemsService.getItemsList(vo));
			return "admin/items/itemsList";
		}
		
		//품목 단건 조회
		@RequestMapping("/getItems/{item_no}")	//getEmp?employeeId=aaaa 
		public String getItems(@PathVariable String item_no) { //@PathVariable 경로(/)에 값을 그대로 넘김
			return "admin/home";
		}
		
		//품목 수정폼
		@RequestMapping("/setUpdateFormItems")
		public String setUpdateFormItems(Model model, ItemsVO vo){
			model.addAttribute("updateList", itemsService.getItems(vo));
			return "admin/items/updateItems";
		}
		
		//수정처리
		@RequestMapping("/setUpdateItems")
		public String setUpdateItems(ItemsVO vo) {
			itemsService.setUpdateItems(vo);
			return "redirect:getItemsList";
		}
		

		
		//품목검색
		@RequestMapping("/findItems")
		public String findItems(ItemsVO itemsVO, Model model) {
			model.addAttribute("findItems", itemsService.getItemsList(itemsVO));
			return "items/findItems";
		}
		
		//view resolver 방식
		@RequestMapping("items_list.do")
		public ModelAndView getSaleLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception
		{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pdfView");
		mv.addObject("filename", "/reports/items_list.jrxml");
		return mv;
		}
		

}