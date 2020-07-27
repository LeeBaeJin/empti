package com.hein.empti.buyledger.service;

import java.util.List;

import com.hein.empti.buyledger.BuyledgerVO;

public interface BuyledgerService {
	public List<BuyledgerVO> getBuyledgerList(BuyledgerVO buyledgerVO);
	public BuyledgerVO getBuyledger(BuyledgerVO buyledgerVO);
	public void setInsertBuyledger(BuyledgerVO buyledgerVO);
	public void setUpdateBuyledger(BuyledgerVO buyledgerVO);
	public void setDeleteBuyledger(BuyledgerVO buyledgerVO);
}
