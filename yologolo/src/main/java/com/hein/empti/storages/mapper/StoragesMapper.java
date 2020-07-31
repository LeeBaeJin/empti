package com.hein.empti.storages.mapper;

import java.util.List;
import java.util.Map;

import com.hein.empti.storages.StoragesVO;

public interface StoragesMapper {
	
	public StoragesVO getStorages(StoragesVO storagesVO);
	public List<StoragesVO> getStoragesList(StoragesVO storagesVO);
	public void setInsertStorages(StoragesVO storagesVO);
	public void setUpdateStorages(StoragesVO storagesVO);
	
	public List<Map<String, Object>> getStoragesListMap(StoragesVO storagesVO);
	
	//창고 (map)엑셀
	public List<Map<String,Object>> getStoragesExcelMap(StoragesVO vo);
}
