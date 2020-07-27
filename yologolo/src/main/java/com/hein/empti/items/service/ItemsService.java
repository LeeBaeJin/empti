package com.hein.empti.items.service;

import java.util.List;

import com.hein.empti.items.ItemsVO;

public interface ItemsService {

	public ItemsVO getItems(ItemsVO itemsVO);
	public List<ItemsVO> getItemsList(ItemsVO itemsVO);
	public void setInsertItems(ItemsVO itemsVO);
	public void setUpdateItems(ItemsVO itemsVO);
}
