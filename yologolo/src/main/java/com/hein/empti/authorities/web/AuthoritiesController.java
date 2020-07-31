package com.hein.empti.authorities.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hein.empti.authorities.RoleVO;
import com.hein.empti.authorities.service.AuthoritiesService;

@Controller
public class AuthoritiesController {

	@Autowired AuthoritiesService authoritiesService;
	
	@RequestMapping("/getRoleList")
	public String getRoleList(RoleVO roleVO, Model model) {
		model.addAttribute("roleList", authoritiesService.getRoleList(roleVO));
		return "authorities/roleList";
	}
}
