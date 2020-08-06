package com.hein.empti.role.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hein.empti.role.RoleVO;
import com.hein.empti.role.service.RoleService;

@Controller
public class RoleController {

	@Autowired RoleService roleService;
	
	@RequestMapping("/getRoleList")
	public String getRoleList(Model model, RoleVO roleVO) {
		model.addAttribute("roleList", roleService.getRoleList(roleVO));
		return "role/roleList";
	}
}
