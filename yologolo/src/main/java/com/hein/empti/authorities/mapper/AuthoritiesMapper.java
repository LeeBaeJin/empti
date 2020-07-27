package com.hein.empti.authorities.mapper;

import java.util.List;

import com.hein.empti.authorities.AuthoritiesVO;

public interface AuthoritiesMapper {
	public List<AuthoritiesVO> getAuthoritiesList(AuthoritiesVO authoritiesVO);
	public List<AuthoritiesVO> getAuthMenuList(AuthoritiesVO authoritiesVO);
	public AuthoritiesVO getAuthorities(AuthoritiesVO authoritiesVO);
}
