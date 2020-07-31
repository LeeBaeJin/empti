package com.hein.empti.ledger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.ledger.LedgerVO;
import com.hein.empti.ledger.mapper.LedgerMapper;
import com.hein.empti.ledger.service.LedgerService;

@Service
public class LedgerServiceImpl implements LedgerService {
	
	@Autowired LedgerMapper ledgerMapper;
	
	@Override 
	public List<LedgerVO> getLedgerList(LedgerVO ledgerVO) {
		return ledgerMapper.getLedgerList(ledgerVO);
	}

	@Override
	public LedgerVO getLedger(LedgerVO ledgerVO) {
		return ledgerMapper.getLedger(ledgerVO);
	}

	@Override
	public void setInsertLedger(LedgerVO ledgerVO) {
		ledgerVO.setLdgr_date(ledgerVO.getLdgr_date().replace('T', ' '));
		
		ledgerMapper.setInsertLedger(ledgerVO);
	}

	@Override
	public void setUpdateLedger(LedgerVO ledgerVO) {
		ledgerVO.setLdgr_date(ledgerVO.getLdgr_date().replace('T', ' '));
		ledgerMapper.setUpdateLedger(ledgerVO);
	}

	
}
