package com.hein.empti.disposal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.disposal.DisposalVO;
import com.hein.empti.disposal.mapper.DisposalMapper;
import com.hein.empti.disposal.service.DisposalService;

@Service
public class DisposalServiceImpl implements DisposalService{
	
	@Autowired
	DisposalMapper disposalMapper;

	@Override
	public DisposalVO getDisposal(DisposalVO disposalVO) {
		return disposalMapper.getDisposal(disposalVO);
	}

	@Override
	public List<DisposalVO> getDisposalList(DisposalVO disposalVO) {
		return disposalMapper.getDisposalList(disposalVO);
	}

	@Override
	public void setInsertDisposal(DisposalVO disposalVO) {
		disposalVO.setDisposal_date(disposalVO.getDisposal_date().replace('T', ' '));
		disposalMapper.setInsertDisposal(disposalVO);
	}

	@Override
	public void setUpdateDisposal(DisposalVO disposalVO) {
		disposalMapper.setUpdateDisposal(disposalVO);
	}

	
		
}
