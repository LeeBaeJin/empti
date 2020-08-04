package com.hein.empti.ledger.service;

import java.util.List;
import java.util.Map;

import com.hein.empti.ledger.LedgerVO;

public interface LedgerService {
	public List<LedgerVO> getLedgerList(LedgerVO ledgerVO);
	public LedgerVO getLedgerNo(LedgerVO ledgerVO);
	public LedgerVO getLedgerStatus(LedgerVO ledgerVO);
	public void setInsertLedger(LedgerVO ledgerVO);
	public void setUpdateLedger(LedgerVO ledgerVO);
	
	//엑셀
	public List<Map<String, Object>> getLdgrExcelMap(LedgerVO vo);
}
