package com.hein.empti.storages.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.storages.StoragesVO;
import com.hein.empti.storages.mapper.StoragesMapper;
import com.hein.empti.storages.service.StoragesService;

@Service
public class StoragesServiceImpl implements StoragesService{
	
	@Autowired
	StoragesMapper storagesMapper;

	@Override
	public StoragesVO getStorages(StoragesVO storagesVO) {
		return storagesMapper.getStorages(storagesVO);
	}

	@Override
	public List<StoragesVO> getStoragesList(StoragesVO storagesVO) {
		return storagesMapper.getStoragesList(storagesVO);
	}
	
	@Override
	public List<Map<String,Object>> getStoragesListMap(StoragesVO storagesVO) {
		return storagesMapper.getStoragesListMap(storagesVO);
	}

	@Override
	public void setInsertStorages(StoragesVO storagesVO) {
		storagesMapper.setInsertStorages(storagesVO);
	}

	@Override
	public void setUpdateStorages(StoragesVO storagesVO) {
		storagesMapper.setUpdateStorages(storagesVO);
	}

	@Override
	public List<Map<String, Object>> getStoragesExcelMap(StoragesVO vo) {
		return storagesMapper.getStoragesExcelMap(vo);
	}
	
	
}
