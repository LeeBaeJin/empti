package com.hein.empti.disposal.service;

import java.util.List;

import com.hein.empti.disposal.DisposalVO;

public interface DisposalService {

	public DisposalVO getDisposal(DisposalVO disposalVO);
	public List<DisposalVO> getDisposalList(DisposalVO disposalVO);
	public void setInsertDisposal(DisposalVO disposalVO);
	public void setUpdateDisposal(DisposalVO disposalVO);
	
	
}
