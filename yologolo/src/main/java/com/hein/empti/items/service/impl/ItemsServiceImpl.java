package com.hein.empti.items.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.items.ItemsVO;
import com.hein.empti.items.mapper.ItemsMapper;
import com.hein.empti.items.service.ItemsService;

@Service
public class ItemsServiceImpl implements ItemsService {

	@Autowired
	ItemsMapper itemsMapper;
	
	@Override
	public ItemsVO getItems(ItemsVO itemsVO) {
		return itemsMapper.getItems(itemsVO);
	}

	@Override
	public List<ItemsVO> getItemsList(ItemsVO itemsVO) {
		return itemsMapper.getItemsList(itemsVO);
	}

	@Override
	public void setInsertItems(ItemsVO itemsVO) {
		itemsMapper.setInsertItems(itemsVO);
	}

	@Override
	public void setUpdateItems(ItemsVO itemsVO) {
		itemsMapper.setUpdateItems(itemsVO);
	}

	@Override
	public List<Map<String, Object>> getItemsMap(ItemsVO vo) {
		return itemsMapper.getItemsMap(vo);
	}



}
