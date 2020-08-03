package com.hein.empti.ledger.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hein.empti.buyorders.BuyordersVO;
import com.hein.empti.buyorders.service.BuyordersService;
import com.hein.empti.ledger.LedgerVO;
import com.hein.empti.ledger.service.LedgerService;
import com.hein.empti.saleorders.SaleordersVO;
import com.hein.empti.saleorders.service.SaleordersService;

@Controller
public class LedgerController {

	@Autowired	LedgerService ledgerService;
	@Autowired	SaleordersService saleordersService;
	@Autowired	BuyordersService buyordersService;

	// 등록폼
	@RequestMapping("/setLedgerForm")
	public String setInsertFormLedger(Model model, SaleordersVO saleordersVO, BuyordersVO buyordersVO) {
		model.addAttribute("saleorders", saleordersService.getSaleordersListMap(saleordersVO));
		model.addAttribute("buyorders", buyordersService.getBuyordersListMap(buyordersVO));
		return "admin/ledger/ledgerAjax";
	}

	// 등록
	@RequestMapping(value = "/ledgers", method = RequestMethod.POST)
	@ResponseBody
	public Map setInsertLedger(LedgerVO ledgerVO, Model model) {
		ledgerService.setInsertLedger(ledgerVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("kkk", "ok");
		return map;
	}

	// 수정
	@RequestMapping(value = "/ledgers", method = RequestMethod.PUT, consumes = "application/json")
	// ,headers = {"Content-type=application/json"})
	// 요청헤더
	@ResponseBody
	public LedgerVO setUpdateLedger(@RequestBody LedgerVO ledgerVO, Model model) {
		ledgerService.setUpdateLedger(ledgerVO);
		return ledgerVO;
	}

	// 단건조회
	@RequestMapping(value = "/ledgers/{ldgr_no}", method = RequestMethod.GET)
	@ResponseBody
	public LedgerVO getLedger(@PathVariable String ldgr_no, LedgerVO ledgerVO, Model model) {

		ledgerVO.setLdgr_no(ldgr_no);
		ledgerVO = ledgerService.getLedger(ledgerVO);
		if (ledgerVO.getLdgr_date() != null)
			ledgerVO.setLdgr_date(ledgerVO.getLdgr_date().replace(' ', 'T'));
		ledgerVO.setLdgr_date(ledgerVO.getLdgr_date().substring(0, 16));
		return ledgerVO;
	}

	// 전체조회
	@RequestMapping(value = "/ledgers", method = RequestMethod.GET)
	@ResponseBody
	public List<LedgerVO> LedgerList(Model model, LedgerVO ledgerVO) {
		return ledgerService.getLedgerList(ledgerVO);
	}

	// 내역 조회
	@RequestMapping("/getLedgerList")
	public String getLedgerList(Model model, LedgerVO VO) {
		model.addAttribute("LedgerList", ledgerService.getLedgerList(null));
		return "admin/ledger/ledgerList";
	}

	// view resolver 방식
	@RequestMapping("ledger_list.do")
	public ModelAndView getLedgerListReport(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pdfView");
		mv.addObject("filename", "/reports/ledger_list.jrxml");
		return mv;
	}

}