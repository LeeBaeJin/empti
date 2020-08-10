package com.hein.empti.role.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/getEmpRoleList")
	@ResponseBody
	public List<RoleVO> getEmpRoleList(Model model, RoleVO roleVO) {
		return roleService.getEmpRoleList(roleVO);
	}
}