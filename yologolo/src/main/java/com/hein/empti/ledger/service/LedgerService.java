package com.hein.empti.ledger.service;

import java.util.List;

import com.hein.empti.ledger.LedgerVO;

public interface LedgerService {
	public List<LedgerVO> getLedgerList(LedgerVO ledgerVO);
	public LedgerVO getLedger(LedgerVO ledgerVO);
	public void setInsertLedger(LedgerVO ledgerVO);
	public void setUpdateLedger(LedgerVO ledgerVO);
}
