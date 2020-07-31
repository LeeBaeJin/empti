package com.hein.empti.items.mapper;

import java.util.List;
import java.util.Map;

import com.hein.empti.items.ItemsVO;

public interface ItemsMapper {

	public ItemsVO getItems(ItemsVO itemsVO);
	public List<ItemsVO> getItemsList(ItemsVO itemsVO);
	public void setInsertItems(ItemsVO itemsVO);
	public void setUpdateItems(ItemsVO itemsVO);
	
	//품목 리스트(Map) 엑셀
	public List<Map<String, Object>> getItemsMap(ItemsVO vo);
}
