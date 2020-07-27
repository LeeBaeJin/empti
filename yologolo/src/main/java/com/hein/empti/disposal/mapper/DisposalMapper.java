package com.hein.empti.disposal.mapper;

import java.util.List;

import com.hein.empti.disposal.DisposalVO;

public interface DisposalMapper {

	public DisposalVO getDisposal(DisposalVO disposalVO);
	public List<DisposalVO> getDisposalList(DisposalVO disposalVO);
	public void setInsertDisposal(DisposalVO disposalVO);
	public void setUpdateDisposal(DisposalVO disposalVO);
}