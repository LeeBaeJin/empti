package com.hein.empti.buyledger.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.buyledger.BuyledgerVO;
import com.hein.empti.buyledger.mapper.BuyledgerMapper;
import com.hein.empti.buyledger.service.BuyledgerService;

@Service
public class BuyledgerServiceImpl implements BuyledgerService {
	
	@Autowired BuyledgerMapper buyledgerMapper;
	
	@Override
	public List<BuyledgerVO> getBuyledgerList(BuyledgerVO buyledgerVO) {
		return buyledgerMapper.getBuyledgerList(buyledgerVO);
	}

	@Override
	public BuyledgerVO getBuyledger(BuyledgerVO buyledgerVO) {
		return buyledgerMapper.getBuyledger(buyledgerVO);
	}

	@Override
	public void setInsertBuyledger(BuyledgerVO buyledgerVO) {
		buyledgerVO.setLdgr_date(buyledgerVO.getLdgr_date().replace('T', ' '));
		buyledgerMapper.setInsertBuyledger(buyledgerVO);
	}

	@Override
	public void setUpdateBuyledger(BuyledgerVO buyledgerVO) {
		buyledgerMapper.setUpdateBuyledger(buyledgerVO);
	}

	@Override
	public void setDeleteBuyledger(BuyledgerVO buyledgerVO) {
		buyledgerMapper.setDeleteBuyledger(buyledgerVO);
	}
}