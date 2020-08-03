package com.hein.empti.disposal.mapper;

import java.util.List;
import java.util.Map;


import com.hein.empti.disposal.DisposalVO;

public interface DisposalMapper {

	public DisposalVO getDisposal(DisposalVO disposalVO);
	public List<Map<String, Object>> getDisposalList(DisposalVO disposalVO);
	public void setInsertDisposal(DisposalVO disposalVO);
	public void setUpdateDisposal(DisposalVO disposalVO);
	
	//폐기 불량 리스트(Map) 엑셀
	public List<Map<String, Object>> getDisposalMap(DisposalVO vo);
}