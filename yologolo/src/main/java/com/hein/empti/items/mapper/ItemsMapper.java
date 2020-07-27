package com.hein.empti.items.mapper;

import java.util.List;

import com.hein.empti.items.ItemsVO;

public interface ItemsMapper {

	public ItemsVO getItems(ItemsVO itemsVO);
	public List<ItemsVO> getItemsList(ItemsVO itemsVO);
	public void setInsertItems(ItemsVO itemsVO);
	public void setUpdateItems(ItemsVO itemsVO);
}
