package com.hein.empti.authorities.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hein.empti.authorities.AuthoritiesVO;
import com.hein.empti.authorities.RoleVO;
import com.hein.empti.authorities.mapper.AuthoritiesMapper;
import com.hein.empti.authorities.service.AuthoritiesService;

@Service
public class AuthoritiesServiceImpl implements AuthoritiesService{
	
	@Autowired AuthoritiesMapper authoritiesMapper;
	
	@Override
	public List<AuthoritiesVO> getAuthoritiesList(AuthoritiesVO authoritiesVO) {
		return authoritiesMapper.getAuthoritiesList(authoritiesVO);
	}

	@Override
	public AuthoritiesVO getAuthorities(AuthoritiesVO authoritiesVO) {
		return authoritiesMapper.getAuthorities(authoritiesVO);
	}

	@Override
	public List<AuthoritiesVO> getAuthMenuList(AuthoritiesVO authoritiesVO) {
		return authoritiesMapper.getAuthMenuList(authoritiesVO);
	}

	@Override
	public List<RoleVO> getRoleList(RoleVO roleVO) {
		return authoritiesMapper.getRoleList(roleVO);
	}
}