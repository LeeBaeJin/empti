package com.hein.empti.role.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.role.RoleVO;
import com.hein.empti.role.mapper.RoleMapper;
import com.hein.empti.role.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired RoleMapper roleMapper;

	@Override
	public List<RoleVO> getRoleList(RoleVO roleVO) {
		return roleMapper.getRoleList(roleVO);
	}
}
